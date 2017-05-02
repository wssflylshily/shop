<?php
ini_set('date.timezone','Asia/Shanghai');
error_reporting(E_ERROR);

require_once "../lib/WxPay.Api.php";
require_once '../lib/WxPay.Notify.php';
require_once 'log.php';

//初始化日志
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);

class PayNotifyCallBack extends WxPayNotify
{
	//查询订单
	public function Queryorder($transaction_id)
	{
		$input = new WxPayOrderQuery();
		$input->SetTransaction_id($transaction_id);
		$result = WxPayApi::orderQuery($input);
		Log::DEBUG("query:" . json_encode($result));
		if(array_key_exists("return_code", $result)
			&& array_key_exists("result_code", $result)
			&& $result["return_code"] == "SUCCESS"
			&& $result["result_code"] == "SUCCESS")
		{
			$order_id = $result["out_trade_no"];
			$order_id = substr($order_id,0,-1);
			require_once 'database.php';
			$sql="select * from onethink_account_record where id=".$order_id;
			$result = mysql_query($sql);
			$order = mysql_fetch_array($result);
			if(!$order)
			{
				Log::DEBUG('订单不存在['.$order_id.']');
				exit;
			}
			if($order['is_pay']>0)
			{
				Log::DEBUG('订单已交完费['.$order_id.']');
				exit;
			}
			$sql="update onethink_user set money=money+".($order['money'])." where id=".$order['user_id'];
			mysql_query($sql);
			Log::DEBUG('用户增加余额['.$sql.']');
			$sql="update onethink_account_record set is_pay=1,paytime=".time()." where id=".$order_id;
			Log::DEBUG('修改充值订单['.$sql.']');
			mysql_query($sql);
			/*$sql="select * from onethink_user_recharge where user_id=".$order['user_id'];
			$result=mysql_query($sql);
			$money=0;
			while($row=mysql_fetch_array($result))
			{
				$money+=$row['money'];
			}
			$sql="select * from onethink_web_site";
			$result=mysql_query($sql);
			$website=mysql_fetch_array($result);
			if($money >= $website['recharge_vip']){
				$sql="update onethink_user set type=1 where id=".$order['user_id'];
				Log::DEBUG('修改用户类别为VIP['.$sql.']');
				mysql_query($sql);
			}*/
			
			return true;
		}
		return false;
	}
	
	//重写回调处理函数
	public function NotifyProcess($data, &$msg)
	{
		Log::DEBUG("call back:" . json_encode($data));
		$notfiyOutput = array();
		
		if(!array_key_exists("transaction_id", $data)){
			$msg = "输入参数不正确";
			return false;
		}
		//查询订单，判断订单真实性
		if(!$this->Queryorder($data["transaction_id"])){
			$msg = "订单查询失败";
			return false;
		}
		return true;
	}
}

Log::DEBUG("begin notify");
$notify = new PayNotifyCallBack();
$notify->Handle(false);
