<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 前台公共库文件
 * 主要定义前台公共函数库
 */

/**
 * 检测验证码
 * @param  integer $id 验证码ID
 * @return boolean     检测结果
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function check_verify($code, $id = 1){
	$verify = new \Think\Verify();
	return $verify->check($code, $id);
}

/**
 * 获取列表总行数
 * @param  string  $category 分类ID
 * @param  integer $status   数据状态
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_list_count($category, $status = 1){
    static $count;
    if(!isset($count[$category])){
        $count[$category] = D('Document')->listCount($category, $status);
    }
    return $count[$category];
}

/**
 * 获取段落总数
 * @param  string $id 文档ID
 * @return integer    段落总数
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_part_count($id){
    static $count;
    if(!isset($count[$id])){
        $count[$id] = D('Document')->partCount($id);
    }
    return $count[$id];
}

/**
 * 获取导航URL
 * @param  string $url 导航URL
 * @return string      解析或的url
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_nav_url($url){
    switch ($url) {
        case 'http://' === substr($url, 0, 7):
        case '#' === substr($url, 0, 1):
            break;        
        default:
            $url = U($url);
            break;
    }
    return $url;
}
function getfocus($pos_id=1,$limit=0)
{
	$map['pos_id']=$pos_id;
	if($limit>0)
	{
		return M('Focus')->where($map)->order('order_num desc,id desc')->limit($limit)->select();
	}
	else
	{
		return M('Focus')->where($map)->order('order_num desc,id desc')->select();
	}
}
 // 分析枚举类型配置值 格式 a:名称1,b:名称2
function parse_config_attr($string) {
    $array = preg_split('/[,;\r\n]+/', trim($string, ",;\r\n"));
    if(strpos($string,':')){
        $value  =   array();
        foreach ($array as $val) {
            list($k, $v) = explode(':', $val);
            $value[$k]   = $v;
        }
    }else{
        $value  =   $array;
    }
    return $value;
}

function is_mobile($mobile) {
    $chars = "/^13[0-9]{1}[0-9]{8}$|15[0-9]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$/";
    if (preg_match($chars, $mobile)) {
        return true;
    } else {
        return false;
    }
}


function Post($data, $target) {
	$url_info = parse_url($target);
	$httpheader = "POST " . $url_info['path'] . " HTTP/1.0\r\n";
	$httpheader .= "Host:" . $url_info['host'] . "\r\n";
	$httpheader .= "Content-Type:application/x-www-form-urlencoded\r\n";
	$httpheader .= "Content-Length:" . strlen($data) . "\r\n";
	$httpheader .= "Connection:close\r\n\r\n";
	//$httpheader .= "Connection:Keep-Alive\r\n\r\n";
	$httpheader .= $data;

	$fd = fsockopen($url_info['host'], 80);
	fwrite($fd, $httpheader);
	$gets = "";
	while(!feof($fd)) {
		$gets .= fread($fd, 128);
	}
	fclose($fd);
	if($gets != ''){
		$start = strpos($gets, '<?xml');
		if($start > 0) {
			$gets = substr($gets, $start);
		}
	}
	return $gets;
}


/*function Post($curlPost,$url){
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_NOBODY, true);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $curlPost);
		$return_str = curl_exec($curl);
		curl_close($curl);
		return $return_str;
}*/
function xml_to_array($xml){
	$reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";
	if(preg_match_all($reg, $xml, $matches)){
		$count = count($matches[0]);
		for($i = 0; $i < $count; $i++){
		$subxml= $matches[2][$i];
		$key = $matches[1][$i];
			if(preg_match( $reg, $subxml )){
				$arr[$key] = xml_to_array( $subxml );
			}else{
				$arr[$key] = $subxml;
			}
		}
	}
	return $arr;
}
function random($length = 6 , $numeric = 0) {
	PHP_VERSION < '4.2.0' && mt_srand((double)microtime() * 1000000);
	if($numeric) {
		$hash = sprintf('%0'.$length.'d', mt_rand(0, pow(10, $length) - 1));
	} else {
		$hash = '';
		$chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789abcdefghjkmnpqrstuvwxyz';
		$max = strlen($chars) - 1;
		for($i = 0; $i < $length; $i++) {
			$hash .= $chars[mt_rand(0, $max)];
		}
	}
	return $hash;
}

/**
 * 获取注册积分比例
 */
function getRegistRatio(){
	$info = M('integrate')->find();
	if (!$info){
		$info['regist_ratio'] = 0;
	}
	return $info['regist_ratio'];
}

/**
 * 获取会员等级的最低等级id
 */
function getMinGrade(){
	$grade = M('grade')->order('glv ASC')->find();
	return $grade['id']; 
}

/**
 * 获取运费价格
 */
function getExpense(){
	$info = M('integrate')->find();
	$expense = $info['expenses'];
	if (!$info){
		$expense = 0;
	}
	return $expense;
}
/**
 * 获取可免运费的订单总额下限
 */
function getOrderMoney(){
	$info = M('integrate')->find();
	$money = $info['totalmoney'];
	if (!$info){
		$money = 0;
	}
	return $money;
}