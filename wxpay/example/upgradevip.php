<?php 
session_start();
ini_set('date.timezone','Asia/Shanghai');
//error_reporting(E_ERROR);
require_once "../lib/WxPay.Api.php";
require_once "WxPay.JsApiPay.php";
require_once 'log.php';
require_once 'database.php';
$id=intval($_GET['id']);

$sql="select * from onethink_user_recharge where id=".$id;
$result = mysql_query($sql);
$data	= mysql_fetch_array($result);

$sql="select * from onethink_web_site";
$result = mysql_query($sql);
$website= mysql_fetch_array($result);

//可获取商城币
//$money=floor($user['integral']/$website['rate']);
//初始化日志
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);

//打印输出数组信息
function printf_info($data)
{
    foreach($data as $key=>$value){
        echo "<font color='#00ff55;'>$key</font> : $value <br/>";
    }
}

//①、获取用户openid
$tools = new JsApiPay();
$openId = $tools->GetOpenid();

//②、统一下单
$input = new WxPayUnifiedOrder();
$input->SetBody("test");
$input->SetAttach("test");
//$input->SetOut_trade_no(WxPayConfig::MCHID.date("YmdHis"));
$input->SetOut_trade_no($data['id'].'Y');
$input->SetTotal_fee($data['money']*100);
$input->SetTime_start(date("YmdHis"));
$input->SetTime_expire(date("YmdHis", time() + 600));
$input->SetGoods_tag("test");
$input->SetNotify_url("http://lcwx.tjtomato.com/wxpay/example/rechargenotify.php");
$input->SetTrade_type("JSAPI");
$input->SetOpenid($openId);
$order = WxPayApi::unifiedOrder($input);
/*echo '<font color="#f00"><b>统一下单支付单信息</b></font><br/>';
printf_info($order);*/
$jsApiParameters = $tools->GetJsApiParameters($order);

//获取共享收货地址js函数参数
$editAddress = $tools->GetEditAddressParameters();

//③、在支持成功回调通知中处理成功之后的事宜，见 notify.php
/**
 * 注意：
 * 1、当你的回调地址不可访问的时候，回调通知会失败，可以通过查询订单来确认支付是否成功
 * 2、jsapi支付时需要填入用户openid，WxPay.JsApiPay.php中有获取openid流程 （文档可以参考微信公众平台“网页授权接口”，
 * 参考http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html）
 */
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>龙驰网信</title>
<meta name="description" content="龙驰网信" />
<meta name="keywords" content="龙驰网信" />
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
<link href="__PUBLIC__/Home/css/weui.min.css" rel="stylesheet" />
<link href="__PUBLIC__/Home/css/jquery-weui.css" rel="stylesheet" />
<link href="__PUBLIC__/Home/css/common.css" rel="stylesheet" />
<link href="__PUBLIC__/Home/css/style.css" rel="stylesheet" />
<script src="__PUBLIC__/Home/js/jquery-1.8.3.min.js"></script>
<script src="__PUBLIC__/Home/js/common.js"></script>
</head>
<body>
<!--top-->
<div class="g_wrap top">
	<table>
    	<tr>
        	<td class="td01"><a href="javascript:/Member;"><img src="__PUBLIC__/Home/images/icon1_03.png" class="img2" /></a></td>
            <td class="td02">升级VIP</td>
            <td class="td03">&nbsp;</td>
        </tr>
    </table>
</div>
<!--content-->
<div class="container g_wrap" style="padding-top:20px;"> 
	 <div class="com_div">
    	<table class="pay_table">
        	<tr>
            	<td>名称：</td><td align="right">购买VIP会员</td>
            </tr>
            <tr>
            	<td>下单时间：</td><td align="right">{$data.addtime|date='Y-m-d',###}</td>
            </tr>
            <tr>
            	<td>订单编号：</td><td align="right">{$data.order_sn}</td>
            </tr>
            <tr>
            	<td class="td01">金额：</td><td align="right" class="font1 td01">{$data.money}</td>
            </tr>
            <tr>
            	<td class="td01">还需支付：</td><td align="right" class="td01 font2">￥<i>{$data.money}</i></td>
            </tr>
        </table>
    </div>
    <div class="com_btndiv">
    	<a href="javascript:window.location.href='/wxpay/example/upgradevip.php?id={$id}'" id="show-toast-text" class="weui_btn weui_btn_primary com_btn1 bg1">微信支付</a>
    </div>
</div>
<script src="__PUBLIC__/Home/js/jquery-2.1.4.js"></script>
<script src="__PUBLIC__/Home/js/jquery-weui.js"></script>

</body>
</html>
<script type="text/javascript">
	//调用微信JS api 支付
	function jsApiCall()
	{
		WeixinJSBridge.invoke(
			'getBrandWCPayRequest',
			<?php echo $jsApiParameters; ?>,
			function(res){
				WeixinJSBridge.log(res.err_msg);
				if(res.err_msg == "get_brand_wcpay_request:ok"){
                   //alert(res.err_code+res.err_desc+res.err_msg);
                       window.location.href="http://lcwx.tjtomato.com/Member/Index/shopmoney";
                   }else{
                       //返回跳转到订单详情页面
                       //alert(支付失败);
                       window.location.href="http://lcwx.tjtomato.com/Member/Index/shopmoney";
                   }
				//alert(res.err_code+res.err_desc+res.err_msg);
			}
		);
	}

	function callpay()
	{
		if (typeof WeixinJSBridge == "undefined"){
		    if( document.addEventListener ){
		        document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
		    }else if (document.attachEvent){
		        document.attachEvent('WeixinJSBridgeReady', jsApiCall); 
		        document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
		    }
		}else{
		    jsApiCall();
		}
	}
	</script>
	<script type="text/javascript">
	//获取共享地址
	function editAddress()
	{
		WeixinJSBridge.invoke(
			'editAddress',
			<?php echo $editAddress; ?>,
			function(res){
				var value1 = res.proviceFirstStageName;
				var value2 = res.addressCitySecondStageName;
				var value3 = res.addressCountiesThirdStageName;
				var value4 = res.addressDetailInfo;
				var tel = res.telNumber;
				
				alert(value1 + value2 + value3 + value4 + ":" + tel);
			}
		);
	}
	
	window.onload = function(){
		/*if (typeof WeixinJSBridge == "undefined"){
		    if( document.addEventListener ){
		        document.addEventListener('WeixinJSBridgeReady', editAddress, false);
		    }else if (document.attachEvent){
		        document.attachEvent('WeixinJSBridgeReady', editAddress); 
		        document.attachEvent('onWeixinJSBridgeReady', editAddress);
		    }
		}else{
			editAddress();
		}*/
		callpay();
	};
	
	</script>