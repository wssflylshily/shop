<?php 
ini_set('date.timezone','Asia/Shanghai');
$order_id	=	intval($_GET['order_id']);
$ordertype = 0;//(int)$_GET['order_type'];
if($order_id<1)
{
	exit('订单不存在');
}
//error_reporting(E_ERROR);
require_once "../lib/WxPay.Api.php";
require_once "WxPay.JsApiPay.php";
require_once 'log.php';
//echo $order_id;exit;
require_once 'database.php';
$sql="select * from onethink_web_site";
$result=mysql_query($sql);
$record=mysql_fetch_array($result);
//var_dump($mysqliObj);exit;
$sql="select * from onethink_order where id=".$order_id;
if ($ordertype==1){
	$sql = "select * from onethink_spellorder where id=".$order_id;
}
//echo $sql;
//$query=$mysqliObj->query($sql);
//var_dump($query);exit;
//$orders=$query->fetch_assoc();
//var_dump($orders);exit;
$result = mysql_query($sql,$conn);
//var_dump($result);exit;
$orders = mysql_fetch_array($result);
//var_dump($orders);exit; 
if(!$orders)
{
	exit('订单不存在!');
}
if($orders['status']>0)
{
	exit('已经付过款了');
}
//$total_price=$orders['money']+$orders['express_money'];
$total_price=$orders['money'];
if($total_price<=0)
{
	$sql="update onethink_order set status=1 where id=".$order_id;
	$result = mysql_query($sql,$conn);
	header('Location:/Member/Order');
	if ($ordertype==1){
		$sql="update onethink_spellorder set status=1 where id=".$order_id;
		$result = mysql_query($sql,$conn);
		header('Location:/Member/Sepll/index');
	}
}
$sqls = "SELECT p.title,c.title as cate FROM onethink_product as p INNER JOIN onethink_order_detail as o ON o.product_id=p.id INNER JOIN onethink_category as c ON c.id=p.category_id WHERE o.order_id=".$order_id;
$titles = mysql_query($sqls,$conn);
$title = mysql_fetch_array($titles);
//查询运费
/*$sqls = "SELECT totalmoney,expenses FROM onethink_integrate limit 1";
$yunfei = mysql_query($sqls);
$expense = $yunfei[0]['expenses'];
file_put_contents('s.txt', $yunfei[0]['expenses']."\r\n".$yunfei[0]['totalmoney']);*/
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
$input->SetBody($title['title']);
$input->SetAttach("蜜罐儿优选");
//$total_price=0.01;
//$input->SetOut_trade_no(WxPayConfig::MCHID.date("YmdHis"));
$input->SetOut_trade_no($orders['sn']."mgyx");
$input->SetTotal_fee($total_price*100);
$input->SetTime_start(date("YmdHis"));
$input->SetTime_expire(date("YmdHis", time() + 600));
$input->SetGoods_tag($titles[0]['title']);
$input->SetNotify_url("http://www.miguaner.cn/wxpay/example/notify.php");
$input->SetTrade_type("JSAPI");
$input->SetOpenid($openId);
$order = WxPayApi::unifiedOrder($input);
//var_dump($order);exit;
/*echo '<font color="#f00"><b>统一下单支付单信息</b></font><br/>';
printf_info($order);*/
$jsApiParameters = $tools->GetJsApiParameters($order);
//var_dump($jsApiParameters);exit;
//获取共享收货地址js函数参数
$editAddress = $tools->GetEditAddressParameters();
//var_dump($editAddress);exit;
//③、在支持成功回调通知中处理成功之后的事宜，见 notify.php
/**
 * 注意：
 * 1、当你的回调地址不可访问的时候，回调通知会失败，可以通过查询订单来确认支付是否成功
 * 2、jsapi支付时需要填入用户openid，WxPay.JsApiPay.php中有获取openid流程 （文档可以参考微信公众平台“网页授权接口”，
 * 参考http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html）
 */
//echo 'd';exit;
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>蜜罐儿优选</title>
<meta name="description" content="蜜罐儿优选" />
<meta name="keywords" content="蜜罐儿优选" />
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width"/>
<link rel="stylesheet" href="/Public/Home/css/common.css"/>
<link rel="stylesheet" href="/Public/Home/css/main.css"/>
<script src="/Public/Home/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
	//调用微信JS api 支付
	function jsApiCall()
	{
		WeixinJSBridge.invoke(
			'getBrandWCPayRequest',
			<?php echo $jsApiParameters; ?>,
			function(res){
				var ordertype = <?php echo $ordertype;?>;
				WeixinJSBridge.log(res.err_msg);
				//alert(res.err_msg);
				if(res.err_msg == "get_brand_wcpay_request:ok"){
                   //alert(res.err_code+res.err_desc+res.err_msg);
	                   if(ordertype==1){
		                   	window.location.href = "http://www.miguaner.cn/index.php?s=/Home/Spell/payok/order_id/<?php echo $orders['id']?>";
	                   }else{
	                       	window.location.href = "http://www.miguaner.cn/index.php?s=/Member/Order/payok/order_id/<?php echo $orders['id']?>";
	                   }   
                   }else{
                       //返回跳转到订单详情页面
                       //alert('支付失败');
                       if(ordertype==1){
                    	   	window.location.href = "http://www.miguaner.cn/index.php?s=/Member/Spell/index";
                       }else{
                       		window.location.href = "http://www.miguaner.cn/index.php?s=/Member/Order/index";
                       }		
                   }
				//alert(res.err_code+res.err_desc+res.err_msg);
			}
		);
	}

	function callpay()
	{
		$.ajax({
			//提交数据的类型 POST GET
			type:"POST",
			//提交的网址
			url:"/index.php?s=/Cart/detection.html",
			//提交的数据
			data:{},
			//返回数据的格式
			datatype: "json",           
			success:function(json){
				//alert(json.info);
				if(json.status<1)
				{
					alert(json.info);
					window.location.href='/index.php?s=/Cart/index.html';
				}
				else
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
			}        
		 });
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
		//callpay();
	};
	
	</script>
</head>
<body>

<!--正文区域-->
<div id="zhifuokTop" class="topBackTitle">
	<div class="contain maxWidth">
		<a class="hz back" href="/index.php?s=/Member/Order/index.html">&#xe600;</a>支付订单
	</div>
</div>
<div id="zhifuokMain" class="fastscroll top50bot0">
	<div class="contain maxWidth">
		<ul class="ullist1line">
			<li class="clear">
				<div class="left">下单时间：</div>
				<div class="right"><?php echo date('Y-m-d H:i',$orders['addtime']);?></div>
			</li>
			<li class="clear">
				<div class="left">订单编号：</div>
				<div class="right"><?php echo $orders['sn'];?></div>
			</li>
			<li class="clear">
				<div class="left">订单总价：</div>
				<div class="right"><?php echo $orders['money'];?></div>
			</li>
			<?php if($orders['express_money']>0){ ?>
				<li class="clear">
					<div class="left">运费：</div>
					<div class="right"><?php echo $orders['express_money'];?></div>
				</li>
			<?php } ?>
			
			<li class="clear">
				<div class="left">需支付：</div>
				<div class="right">&yen;<?php echo $total_price;?></div>
			</li>
		</ul>
		<div class="summary">
			<a href="javascript:callpay()" id="show-toast-text" class="orangeBtn">微信支付</a>
		</div>
	</div>
</div>









<!-- <div class="g_wrap top">
	<table>
    	<tr>
        	<td class="td01"><a href="javascript:history.go(-1);"><img src="__PUBLIC__/Home/images/icon1_03.png" class="img2" /></a></td>
            <td class="td02">支付订单</td>
            <td class="td03">&nbsp;</td>
        </tr>
    </table>
</div> -->
<?php
//echo 'a';exit;
?>
<!--content-->
<!-- <div class="container g_wrap">    
    <div class="com_div">
    	<table class="pay_table">
        	<tr>
            	<td>下单时间：</td><td align="right"><?php echo date('Y-m-d H:i');?></td>
            </tr>
            <tr>
            	<td>订单编号：</td><td align="right"><?php echo $orders['sn'];?></td>
            </tr>
            <tr>
            	<td>订单总价：</td><td align="right" class="font1"><?php echo $orders['money'];?></td>
            </tr>
			<if condition="$row.type eq 0">
            <tr>
            	<td>运费：</td><td align="right" class="font1"><?php echo $orders['express_money'];?></td>
            </tr>
			</if> -->
			<!--
            <tr>
            	<td class="td01">商城币支付：</td><td align="right" class="font1 td01">6.00</td>
            </tr>
			-->
            <!-- <tr>
            	<td class="td01">还需支付：</td><td align="right" class="td01 font2">￥<i><?php echo $total_price;?></i></td>
            </tr>
        </table>
    </div>
    <div class="com_btndiv">
    	<a href="javascript:callpay()" id="show-toast-text" class="weui_btn weui_btn_primary com_btn1 bg1">微信支付</a>
    </div>
</div> -->
<!--
    <br/>
    <font color="#9ACD32"><b>该笔订单支付金额为<span style="color:#f00;font-size:50px">1分</span>钱</b></font><br/><br/>
	<div align="center">
		<button style="width:210px; height:50px; border-radius: 15px;background-color:#FE6714; border:0px #FE6714 solid; cursor: pointer;  color:white;  font-size:16px;" type="button" onclick="callpay()" >立即支付</button>
	</div>-->
</body>
</html>