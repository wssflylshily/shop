<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Member\Model;
use Think\Model;
use User\Api\UserApi;

/**
 * 文档基础模型
 */
class UserModel extends Model{
    protected $_validate = array(
		array('name','checkName','姓名格式不正确',3,'callback'), 
		array('email','checkEmail','邮箱格式不正确',3,'callback'),// 自定义函数验证密码格式
		array('mobile','checkMobile','手机号格式不正确',3,'callback'),
        //array('name', 'require', '姓名不能为空', self::MUST_VALIDATE, ),
		//array('name','2,20','长度不符！',3,'length'),
        //array('email', 'require', '邮箱不能为空', self::MUST_VALIDATE, ),
		//array('email','email','邮箱格式错误'),
        //array('mobile', 'require', '手机号不能为空', self::MUST_VALIDATE, ),
    );

	function checkName()
	{
		if(isset($_POST['name']))
		{
			if(strlen($_POST['name'])<2 || strlen($_POST['name'])>20)return false;
		}
		return true;
	}

	function checkEmail()
	{
		if(isset($_POST['email']))
		{
			$email	=	$_POST['email'];
			$exp="^[a-z'0-9]+([._-][a-z'0-9]+)*@([a-z0-9]+([._-][a-z0-9]+))+$"; 
			if(eregi($exp,$email)){ //先用正则表达式验证email格式的有效性 
				if(checkdnsrr(array_pop(explode("@",$email)),"MX")){//再用checkdnsrr验证email的域名部分的有效性 
					return true; 
				}else{ 
					return false; 
				} 
			}else{ 
				return false; 
			} 
		}
		return true;
	}

	function checkMobile()
	{
		if(isset($_POST['mobile']))
		{
			$exp = "/^13[0-9]{1}[0-9]{8}$|15[012356789]{1}[0-9]{8}$|18[012356789]{1}[0-9]{8}$|14[57]{1}[0-9]$/";  
			if(preg_match($exp,$_POST['mobile'])){      
				return true;  
			}else{      
				return false;        
			}
		}
		return true;
	}
}
