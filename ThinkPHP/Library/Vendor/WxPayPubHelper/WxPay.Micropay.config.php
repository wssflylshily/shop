<?php
/**
* 	配置账号信息
*/

class WxPayConf_micropay
{
	//=======【基本信息设置】=====================================
	//微信公众号身份的唯一标识。审核通过后，在微信发送的邮件中查看
	const APPID = 'wx8c1297a2aafcb715';
	//受理商ID，身份标识
	const MCHID = '1394179202';
	//商户支付密钥Key。审核通过后，在微信发送的邮件中查看
	const KEY = 'tjtomato20160101tjtomato74915036';
		
	//=======【证书路径设置】=====================================
	//证书路径,注意必须填写绝对路径
    const SSLCERT_PATH = 'http://fqmall.tjtomato.com/ThinkPHP/Library/Vendor/WxPayPubHelper/cacert/apiclient_cert.pem';
    const SSLKEY_PATH = 'http://fqmall.tjtomato.com/ThinkPHP/Library/Vendor/WxPayPubHelper/cacert/apiclient_key.pem';

	//=======【curl超时设置】===================================
	//本例程通过curl使用HTTP POST方法，此处可修改其超时时间，默认为30秒
	const CURL_TIMEOUT = 30;

}
	
?>