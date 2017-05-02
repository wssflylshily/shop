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
use Think\Page;

class UserAddressModel extends Model{

	/* 自动验证规则 */
	protected $_validate = array(
        array('name', 'require', '收货人姓名不能为空', self::MUST_VALIDATE, ),
        array('mobile', 'require', '手机号码不能为空', self::MUST_VALIDATE, ),
		array('mobile','checkMobile','手机号码格式不正确',3,'callback'),
        array('address', 'require', '街道地址不能为空', self::MUST_VALIDATE, ),
	);

	function checkMobile()
	{
		$exp = "/^13[0-9]{1}[0-9]{8}$|15[012356789]{1}[0-9]{8}$|18[012356789]{1}[0-9]{8}$|14[57]{1}[0-9]$/";  
		if(preg_match($exp,$_POST['mobile'])){      
			return true;  
		}else{      
			return false;        
		}
	}


}
