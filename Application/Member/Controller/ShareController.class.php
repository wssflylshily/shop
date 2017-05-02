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
 * 分享得真金
 */
class ShareController extends HomeController {
	function index()
	{
		//实际已赚(订单已经完成获得的佣金)
		$total_money=M('BrokerageRecord')->where('user_id='.$this->user['id'])->sum('money');
		if(!$total_money)$total_money=0;
		$this->assign('total_money',$total_money);
		//待到账(分享购买之后待付款的金额)
		$join=' as o inner join onethink_order_detail as d on o.id=d.order_id';
		$map['o.status']=0;
		$map['d.share_user_id']=$this->user['id'];
		$list=M('Order')->field('d.*')->join($join)->where($map)->select();
		//echo M('Order')->getlastsql();exit;
		//var_dump($list);exit;
		$share_total_price=0;
		foreach($list as $item)
		{
			$product=M('Product')->where('id='.$item['product_id'])->find();
			if(!$product)continue;
			$share_total_price+=$product['share_money']*$item['product_num'];
		}
		$this->assign('share_total_price',$share_total_price);
		//获取好友购买次数
		$join=' as o inner join order_detail as d on o.id=d.order_id';
		$map['o.status']=0;
		$map['d.share_user_id']=$this->user['id'];
		$list=M('Order')->field('d.*')->join($join)->where($map)->select();
		//累计分享次数
		$share_num=0;
		$list=M('OrderDetail')->group('order_id')->where('share_user_id='.$this->user['id'])->select();
		foreach($list as $item)
		{
			$order=M('Order')->where('id='.$item['order_id'])->find();
			if($order['status']>0 && $order['status']<4)
			{
				$share_num++;
			}
		}
		$this->assign('share_num',$share_num);
		/*$join=' as o inner join order_detail as d on o.id=d.order_id';
		$map['o.status']=0;
		$map['d.share_user_id']=$this->user['id'];
		$list=M('Order')->field('d.*')->join($join)->where($map)->select();
		$share_total_price=0;
		foreach($list as $item)
		{
			$product=M('Product')->where('id='.$item['product_id'])->find();
			if(!$product)continue;
			$share_total_price=$product['share_money']*$item['product_num'];
		}*/
		$this->display();
	}

}