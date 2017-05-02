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
			$order_id=$result["out_trade_no"];
			$order_id = substr($order_id,0,-1);
			Log::DEBUG('订单hao['.$order_id.']');
			require_once 'database.php';
			$orderfrom = 1;
			$sql="select * from onethink_spellorder where id=".$order_id;
			$result = mysql_query($sql);
			
			$order = mysql_fetch_array($result);
			if(!$order)
			{
				Log::DEBUG('订单不存在['.$order_id.']');
				exit;
			}
			if($order['status']>0)
			{
				Log::DEBUG('订单已支付['.$order_id.']');
				exit;
			}
			//订单状态改为已支付
			$sql="update onethink_spellorder set status=1 where id=".$order_id;
			mysql_query($sql);
			//参团人数+1
			$sql = "update onethink_spell_teams set join_num = join_num+1 where id=".$order['team_id'];
			mysql_query($sql);
			//拼团销量增加
			$sql = "update onethink_spell set sell_num = sell_num+".$order['spell_num']." where id=".$order['spell_id'];
			mysql_query($sql);
			//获取返回比例
			$sql="select * from onethink_web_site";
			$result=mysql_query($sql);
			$record=mysql_fetch_array($result);
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
