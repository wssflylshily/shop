<?php
namespace Admin\Controller;
use Think\Controller;
class AdminCityController extends CommonController {
	public $model_name = 'Admin';
	public function _filter(&$map)
	{
	 	$map['status'] = 0; 
	 	$map['city_id'] = array('neq','0');
	}
	public function _before_add()
	{
		$city = M('City')->select();
		$role = M('AdminRole')->where('status = 0')->select();
		$this->assign('city',$city);
		$this->assign('role',$role);
	}
	public function _before_edit()
	{
		$city = M('City')->select();
		$role = M('AdminRole')->where('status = 0')->select();
		$this->assign('city',$city);
		$this->assign('role',$role);
	}
	public function user_check()
	{
		$map['login_user'] = I('post.user');
		$flag = M('Admin')->where($map)->count();
		if ($flag > 0) {
			echo 'false';
		}else{
			echo 'true';
		}
	}


}