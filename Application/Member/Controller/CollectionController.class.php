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
 * 收藏数据
 */
class CollectionController extends HomeController {
	public function index()
	{
		$map['c.user_id']	=	$this->user['id'];
		
		$model	=	M('Collection');
		$field	=	'p.title,p.image,p.gprice,c.id,p.id as product_id,p.market_price';
		$join	=	' as c inner join onethink_product as p on c.product_id=p.id';
		//$this->_list($model,$map);
		$count = $model->field($field)->join($join)->where($map)->count ();
		//echo $model->getlastsql();exit;
		if ($count > 0) {
			$p = new \Think\Page($count, C('PAGE_NUM'));
			$list = $model->field($field)->join($join)->where($map)->order('c.id desc')->select();
			//echo $model->getlastsql();exit;
			$page = $p->show ();
			$this->assign ( 'list', $list );
		}
		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->display();
	}
	//支付
	public function cancel()
	{
		$id	=	intval(I('id'));
		$map['id']	=	$id;
		$row=	M('Order')->where($map)->find();
		if(!$row)
		{
			$this->error('订单不存在');
		}
		$this->assign('row',$row);
		$total_price=$row['money'];
		if($row['type']==0)$total_price+=$row['express_money'];
		$this->assign('total_price',$total_price);
		$this->display();
	}
	//改变订单状态
	public function upstatus()
	{
		$id	=	intval(I('id'));
		$status	=	intval(I('status'));
		$order=	M('Order')->where('id='.$id)->find();
		if(!$order)
		{
			$this->error('订单不存在');
		}
		if($order['user_id']!=$this->user['id'])
		{
			$this->error('订单不属于您');
		}
		if($order['status']>2)
		{
			$this->error('订单不能被改变');
		}
		$data['status']=$status;
		M('Order')->where('id='.$id)->save($data);
		$this->success('操作成功');
	}
	/**
	 * 取消收藏
	 */
	function delcollection()
	{
		$id	=	rtrim(I('post.ids'), ",");
		$map['user_id']=$this->user['id'];
		$map['id']=array('in',$id);
		M('Collection')->where($map)->delete();
		$this->success('取消成功');
	}
}