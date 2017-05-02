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
 * 推广人
 */
class SpreadController extends HomeController {
	public function index(){
		$user=M('User')->where('id='.$this->user['id'])->find();
		$this->assign('user',$user);
		$usersid = M('user')->getField('id',true);
		$userid = $user['id'];
// 		$userid = 154;
		//我的佣金来源记录
		$m = M('brokerage_record');
		$map['parent_id'] = $userid;
		$map['user_id'] = array('in',$usersid);
		$list = $m->where($map)->order('id DESC')->limit(20)->select();
// 		print_r($m->getLastsql());die;
		foreach ($list as $k=>$v){
			$order = M('order')->where('id='.$v['order_id'])->find();
			$list[$k]['totalmoney'] = $order['money'];
			$spread = M('user')->where('id='.$order['user_id'])->find();
			if ($spread['name']){
				$list[$k]['spread'] = $spread['name'];
			}else{
				$list[$k]['spread'] = $spread['login_user'];
			}
		}
		
		
		/*$spread=M('User')->where('id='.$user['parent_user_id'])->find();
		$userlist=M('User')->where('parent_user_id='.$user['id'])->limit(10)->select();
		foreach ($userlist as $k=>$v){
			$userlist[$k]['time'] = $v['register_time'];
			if (!$v['register_time']) $userlist[$k]['time'] = $v['addtime'];
			$userlist[$k]['showname'] = $v['name'];
			if (!$v['name']) $userlist[$k]['showname'] = $v['login_user'];
			
		}
		if (empty($userlist)) {
			$spread['login_user']	=	'无';
		}
			
		$this->assign('userlist',$userlist);
		$this->assign('spread',$spread);*/
		$this->assign('list',$list);
		
		$this->display();
	}
	/**
	 * ajax加载更多
	 */
	public function ajaxGetlist(){
		$userid = $this->user['id'];
		$page = (int)I('page');
		$per = 20;
		$start = ($page-1)*$per;
		$m = M('brokerage_record');
		$list = $m->where('parent_id='.$userid)->order('id DESC')->limit($start,$per)->select();
		if ($list){
			foreach ($list as $k=>$v){
				$order = M('order')->where('id='.$v['id'])->find();
				$list[$k]['totalmoney'] = $order['money'];
				$spread = M('user')->where('id='.$order['user_id'])->find();
				if ($spread['name']){
					$list[$k]['spread'] = $spread['name'];
				}else{
					$list[$k]['spread'] = $spread['login_user'];
				}
			}
		}else{
			$list = array();
		}
		/*$userlist = M('User')->where('parent_user_id='.$userid)->limit($start,$per)->select();
		if ($userlist){
			foreach ($userlist as $k=>$v){
				$userlist[$k]['time'] = date('Y-m-d',$v['register_time']);
				if (!$v['register_time']) $userlist[$k]['time'] = date('Y-m-d',$v['addtime']);
				$userlist[$k]['showname'] = $v['name'];
				if (!$v['name']) $userlist[$k]['showname'] = $v['login_user'];
			
			}
		}else{
			$userlist = array();
		}*/
		$this->ajaxReturn($list);
	}
	
}