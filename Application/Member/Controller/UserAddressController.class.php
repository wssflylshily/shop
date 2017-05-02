<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Member\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class UserAddressController extends HomeController {
	public function _before_index()
	{
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$cart_id	=	I('cart_id');
		$this->assign('cart_id',$cart_id);
		$this->assign('x_title','管理收货地址');
	}
	public function _before_add()
	{
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$this->assign('save',true);
		$arealist	=	M('Area')->select();
		$this->assign('arealist',$arealist);
		$cart_id	=	I('cart_id');
		$this->assign('cart_id',$cart_id);
		$this->assign('backurl','/Member/UserAddress');
		$this->assign('x_title','新增收货地址');
	}
	public function _before_insert()
	{
		$cart_id=I('cart_id');
		if(!empty($cart_id))
		{
			$map['user_id']=$this->user['id'];
			M('UserAddress')->where($map)->save(array('is_default'=>0));
		}
	}
	public function _before_edit()
	{
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$this->assign('save',true);
		$arealist	=	M('Area')->select();
		$this->assign('arealist',$arealist);
		$cart_id	=	I('cart_id');
		$this->assign('cart_id',$cart_id);
		$this->assign('backurl','/Member/UserAddress');
		$this->assign('x_title','编辑收货地址');
		$sexarr[0]='保密';
		$sexarr[1]='男';
		$sexarr[2]='女';
		$this->assign('sexarr',$sexarr);
	}
	
	/**
	 * 地址列表
	 */
	public function index(){
		$userid = $_SESSION['user']['id'];
		$map = array();
		$map['user_id'] = $userid;
		$map['status'] = 1;
		$list = M('user_address')->where($map)->order('is_default DESC,id DESC')->select();
		$this->assign('list',$list);
		
		cookie('forward',$_SERVER['REQUEST_URI']);
		
		$this->display();
	}
	
	
	/**
	 * 删除地址
	 */
	public function del(){
		$id = (int)I('id');
		$m = M('user_address');
		$addr = $m->where('id='.$id)->find();
		if(!$addr){
			$this->error('地址不存在');
		}
		$res = $m->where('id='.$id)->setField('status',0);
		if ($res){
			$this->success('删除成功');
		}else{
			$this->error('删除失败');
		}
		
	}
	
	
	//设定默认地址
	public function setdefault()
	{
		$map['user_id']	=	$this->user['id'];
		M('UserAddress')->where($map)->save(array('is_default'=>0));
		$map['id']	=	intval(I('id'));
		M('UserAddress')->where($map)->save(array('is_default'=>1));
		$this->success('设置成功');
	}
}