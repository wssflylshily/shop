<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Think\Page;

/**
 * 分销控制器
 * @author huajie <banhuajie@163.com>
 */
class BrokerageRecordController extends AdminController {
	public function _filter(&$map)
	{
		$order_sn=I('order_sn');
		if($order_sn!='')
		{
			$map['order_sn']=array('like','%'.$order_sn.'%');
		}
		$login_user=I('login_user');
		$userids=array();
		
		if(!empty($login_user))
		{
			$list=M('User')->where('login_user like "%'.$login_user.'%"')->select();
			if($list)
			{
				foreach($list as $item)
				{
					$userids[]=$item['id'];
				}
			}
			else
			{
				$userids[]=0;
			}
		}
		
		if(count($userids)>0)
		{
			$map['user_id']=array('in',implode(',',$userids));
		}
		$start_date=I('start_date');
		if(!empty($start_date))
		{
			$map['_string']=" addtime>='". strtotime($start_date)."'";
		}
		$end_date=I('end_date');
		if(!empty($end_date))
		{
			if(!empty($map['_string']))
			{
				$map['_string'].=" and addtime<='". strtotime($end_date)."'";
			}
			else
			{
				$map['_string']=" addtime<='". strtotime($end_date)."'";
			}
		}
	}
	
	public function index(){
		$userids = M('user')->getField('id',true);
		$map = array();
		$map['user_id'] = array('in',$userids);
		$map['parent_id'] = array('in',$userids);
		$m = M('brokerage_record');
		$count = $m->where($map)->count();
		$p = new \Think\Page($count, 20);
		$list = $m->limit($p->firstRow.','.$p->listRows)->where($map)->order('id DESC')->select();
		
		$page = $p->show ();
		$this->assign ( 'list', $list );
		$this->assign ( "page", $page );
		
		$this->display();
	}
	
}
