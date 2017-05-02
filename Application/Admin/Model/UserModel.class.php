<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 用户模型
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */

class UserModel extends Model {

    protected $_validate = array(
        array('login_user', '1,36', '昵称长度为1-36个字符', self::EXISTS_VALIDATE, 'length'),
        array('login_user', '', '用户名被占用', self::EXISTS_VALIDATE, 'unique'), //用户名被占用
        array('login_pass', 'require', '密码不能为空', 0,'',1),
        array('login_pass', 'checkPass', '两次密码不一致', self::MUST_VALIDATE, 'callback', self::MODEL_BOTH),
    );
    protected $_auto = array(
        array('login_pass','getpass',3,'callback'),
        array('admin_id', 'session', self::MODEL_INSERT, 'function', 'user_auth.uid'),
        array('addtime', NOW_TIME, self::MODEL_INSERT),
    );

	protected function checkPass(){
        $login_pass=I('post.login_pass');
		if(!empty($login_pass))
		{
			$login_pass_1=I('post.repassword');
			if($login_pass!=$login_pass_1)return false;
		}
		return true;
    }

	function getpass()
	{
		$login_pass=I('post.login_pass');
		if(empty($login_pass))
		{
			unset($_POST['login_pass']);
			return false;
		}
		return md5($login_pass);
	}

}
