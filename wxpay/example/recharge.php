<?php 
//session_start();
ini_set('date.timezone','Asia/Shanghai');
require_once "../lib/WxPay.Api.php";
require_once "WxPay.JsApiPay.php";
require_once 'log.php';
require_once 'database.php';

$id = intval($_GET['order_id']);
$sql="select * from onethink_web_site";
$result = mysql_query($sql);
$website= mysql_fetch_array($result);
$sql = "select * from onethink_account_record where id=".$id;
$result = mysql_query($sql);
$orders = mysql_fetch_array($result);
if (!$orders) exit('订单不存在');
if($orders['is_pay']==1) exit('订单已支付');
$money = $orders['money'];

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
$input->SetBody("余额充值");
$input->SetAttach("蜜罐儿优选");
//$input->SetOut_trade_no(WxPayConfig::MCHID.date("YmdHis"));
$input->SetOut_trade_no($orders['id'].'Y');
//$money = 0.01;
$input->SetTotal_fee($money*100);
$input->SetTime_start(date("YmdHis"));
$input->SetTime_expire(date("YmdHis", time() + 600));
$input->SetGoods_tag("余额充值");
$input->SetNotify_url("http://www.miguaner.cn/wxpay/example/rechargenotify.php");
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
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>蜜罐儿优选</title>
<meta name="description" content="蜜罐儿优选" />
<meta name="keywords" content="蜜罐儿优选" />
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width" />
<link rel="stylesheet" href="/Public/Home/css/common.css"/>
<link rel="stylesheet" href="/Public/Home/css/main.css"/>
<script src="/Public/Home/js/jquery-1.8.3.min.js"></script>
<script src="/PUBLIC/Home/js/zepto.js"></script>
<script type="text/javascript">

	//调用微信JS api 支付
	function jsApiCall(){
		WeixinJSBridge.invoke(
			'getBrandWCPayRequest',
			<?php echo $jsApiParameters; ?>,
			function(res){
				WeixinJSBridge.log(res.err_msg);
				var orderid = <?php echo $orders['id'];?>;
				if(res.err_msg == "get_brand_wcpay_request:ok"){
                    window.location.href = "http://www.miguaner.cn/index.php?s=/Member/Index/rechargeok/id/"+orderid;
                }else{
                    //返回跳转到订单详情页面
                  	window.location.href="http://wwww.miguaner.cn/index.php?s=/Member/Index/recharge";
                }
				
			}
		);
	}

	function callpay(){
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

</head>
	<body>
		
<!--正文区域-->
<div id="zhifuokTop" class="topBackTitle">
	<div class="contain maxWidth">
		<a class="hz back" href="javascript:history.go(-1);;">&#xe600;</a>微信充值
	</div>
</div>
<div id="zhifuokMain" class="fastscroll top50bot0">
	<div class="contain maxWidth">
		<ul class="ullist1line">
			<li class="clear">
				<div class="left">充值金额：</div>
				<div class="right">&yen;<?php echo $orders['money'];?></div>
			</li>
		</ul>
		<div class="summary">
			<a href="javascript:callpay()" id="show-toast-text" class="orangeBtn">微信支付</a>
		</div>
	</div>
</div>
</body>
</html>