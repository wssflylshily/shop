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
 * 返利控制器
 * @author huajie <banhuajie@163.com>
 */
class RebateRecordController extends AdminController {
	public function _before_index()
	{
		$statusarr[0]='未还';
		$statusarr[1]='已还';
		$this->assign('statusarr',$statusarr);
	}
	public function _filter(&$map)
	{
		$status=I('status');
		if($status!='')
		{
			$map['status']=$status;
		}
		$order_sn=I('order_sn');
		if(!empty($order_sn))
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
			$map['_string']=" day>='".$start_date."'";
		}
		$end_date=I('end_date');
		if(!empty($end_date))
		{
			if(!empty($map['_string']))
			{
				$map['_string'].=" and day<='".$end_date."'";
			}
			else
			{
				$map['_string']=" day<='".$end_date."'";
			}
		}
	}
}
