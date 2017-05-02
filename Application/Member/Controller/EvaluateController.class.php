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
class EvaluateController extends HomeController {
	public function add()
	{
		//$product_id=intval(I('product_id'));
		$order_detail_id=intval(I('order_detail_id'));
		//$map['product_id']=$product_id;
		$map['user_id']=$_SESSION['user']['id'];
		$map['order_detail_id']=$order_detail_id;
		$evaluate=M('Evaluate')->where($map)->find();
		if($evaluate)
		{
			header('Location:/Member/Order');
			//$this->error('您已经评价过了');
		}
		$detail	=	M('OrderDetail')->where('id='.$order_detail_id)->find();
		if(!$detail)
		{
			$this->error('详情不存在');
		}
		$this->assign('order_detail_id',$order_detail_id);
		/*
		$product=M('Product')->where('id='.$product_id)->find();
		if(!$product)
		{
			$this->error('产品不存在');
		}
		$this->assign('order_id',$order_id);
		$this->assign('product',$product);*/
		$this->display();
	}
	public function insert()
	{
		$map['order_detail_id']=intval(I('post.order_detail_id'));
		$detail	=	M('OrderDetail')->where('id='.$map['order_detail_id'])->find();
		if(!$detail)
		{
			$this->error('详情不存在');
		}
		$map['user_id']=$_SESSION['user']['id'];
		//$order_id=intval(I('order_id'));
		//$map['order_id']=$order_id;
		$evaluate=M('Evaluate')->where($map)->find();
		if($evaluate)
		{
			$this->error('您已经评价过了');
		}
		$data['order_id']		=	$detail['order_id'];
		$data['order_detail_id']=	intval(I('post.order_detail_id'));
		$data['product_id']		=	$detail['product_id'];
		$data['user_id']		=	$_SESSION['user']['id'];
		$data['score']			=	I('post.score');
		$data['desc']			=	I('post.content');
		$data['addtime']		=	time();
		$product=M('Product')->where('id='.$detail['product_id'])->find();
		if(!$product)
		{
			$this->error('产品不存在');
		}
		if(empty($data['desc']))
		{
			$this->error('请填写评价内容');
		}
		M('Evaluate')->add($data);
		/*$data	=	array();
		if($evaluate_num>6)
		{
			$data['hao_num']=$product['hao_num']+1;
		}
		$data['pj_num']=$product['pj_num']+1;
		M('Product')->where('id='.$product['id'])->save($data);*/
		$this->success('评价成功');
	}
}