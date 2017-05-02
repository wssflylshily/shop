<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

class SpellcartController extends HomeController {
	//检测库存
	public function detection()
	{
		$field	=	'c.*,p.title,p.image,p.depot_num';
		$join	=	' as c inner join onethink_product as p on c.product_id=p.id';
		$list=M('Spellcart')->field($field)->join($join)->where($map)->select();
		foreach($list as $item)
		{
			if($item['product_num']>$item['depot_num'])
			{
				$this->error($item['title'].'库存不足');
			}
		}
		$this->success('可以购买');
	}
	//系统首页
    public function index(){
		$is_vip=0;
		if(isset($_SESSION['user']))
		{
			$is_login=1;
			$user=M('User')->where('id='.$_SESSION['user']['id'])->find();
			//var_dump($user);exit;
			if($user && $user['type']==1)
			{
				$is_vip=1;
			}
		}
		$this->assign('is_vip',$is_vip);
        $map['c.user_id']	=	$_SESSION['user']['id'];

		$field	=	'c.*,p.title,p.image';
		$join	=	' as c inner join onethink_product as p on c.product_id=p.id';
		$list=M('Spellcart')->field($field)->join($join)->where($map)->select();
		//echo M('Spellcart')->getlastsql();exit;
		$this->assign('list',$list);
		//var_dump($list);exit;
		$class_nav['cart']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$this->assign('cart_active','active');
         $this->display();
    }
	//增加
	public function insert()
	{
		$product_id	=	I('post.product_id');
		$product_num=	I('post.amount');
		$share_user_id=	I('post.share_user_id');//分享人ID
		if($share_user_id==$_SESSION['user']['id'])$share_user_id=0;
		$product	=	M('Product')->where('id='.$product_id)->find();
		if(!$product)
		{
			$this->error('商品不存在');
		}
		if($product['depot_num']<$product_num)
		{
			$this->error('库存不足');
		}
		$map	=	array();
		$map['id']	=	$product_id;
		$row=M('Product')->where($map)->find();
		$row['price']=$row['gprice'];
		$row['vipprice']=$row['gvipprice'];
		//var_dump($row);exit;
		$map1['user_id']=$_SESSION['user']['id'];
		$map1['product_id']=$product_id;
		$cart=M('Spellcart')->where($map1)->find();
		if($cart)
		{
			M('Spellcart')->where('id='.$cart['id'])->setInc('product_num',$product_num);
		}
		else
		{
			$data['user_id']	=	$_SESSION['user']['id'];
			$data['product_id']	=	$product_id;
			$data['product_num']=	$product_num;
			$data['product_price']=	$row['smoney'];
			$data['product_price']=	$row['price'];
			
			$data['product_vipprice']=	$row['vipprice'];
			$data['share_user_id']=	$share_user_id;
			$data['addtime']=	time();
			M('Spellcart')->add($data);
			//echo M('Spellcart')->getlastsql();exit;
		}
		$this->success('加入购物车成功');
		//var_dump($row);
	}
	//减少数量
	public function reduce()
	{
		$cart_id=I('post.cart_id');
		$cart=M('Spellcart')->where('id='.$cart_id)->find();
		if($cart['product_num']<2)
		{
			$this->error('再减就删除了');
		}
		M('Spellcart')->where('id='.$cart_id)->setDec('product_num',1);
	}
	//增加数量
	public function addnum()
	{
		$cart_id=I('post.cart_id');
		$cart=M('Spellcart')->where('id='.$cart_id)->find();
		M('Spellcart')->where('id='.$cart_id)->setInc('product_num',1);
	}
	//改变数量
	public function updatenum($cart_id)
	{
		$cart_id=I('post.cart_id');
		$data['product_num']=I('post.product_num');
		M('Spellcart')->where('id='.$cart_id)->save($data);
	}
	//删除某个商品
	public function del()
	{
		$cart_id=I('post.cart_id');
		$map['id']=array('in',$cart_id);
		M('Spellcart')->where($map)->delete();
	}
	//确认订单
	public function step2()
	{
		$class_nav['cart']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		//获取网站基本设置
		$record=M('WebSite')->find();
		$cart_id=I('cart_id');
		$map['c.user_id']=$_SESSION['user']['id'];
		$map['c.id']=array('in',$cart_id);
		$field	=	'c.*,p.title,p.image,p.market_price';
		$join	=	' as c inner join onethink_product as p on c.product_id=p.id';
		$list=M('Spellcart')->field($field)->join($join)->where($map)->select();
		
//echo M('Spellcart')->getlastsql();exit;
		$express_money=0;
		$product_num=0;
		$total_price=0;
		$depot_ids	=	array();
		$integral_price=0;//积分金额
		foreach($list as $item)
		{
			$express_money=$express_money+$product['express_money'];
			$total_price+=$item['product_num']*$item['product_price'];
		}
		//echo $total_price;exit;
		//运费
		$this->assign('express_money',$express_money);
		//商品数量
		$this->assign('product_num',$product_num);
		//商品总额
		$this->assign('total_price',$total_price);
		//echo M('Spellcart')->getlastsql();exit;
		//var_dump($list);exit;
		$this->assign('list',$list);
		//获取用户信息
		$user	=	M('User')->where('id='.$_SESSION['user']['id'])->find();
		$this->assign('integral_price',$integral_price);
		//可以使用积分支付
		//echo $integral_price;exit;
		if($integral_price>0)
		{
			//if($user['integral']>=$integral_price*$siteset['rate'])
			//{
				//echo $integral_price.'='.$record['rate'];exit;
				$user_integral=$integral_price*$record['rate'];
			//}
		}
		else
		{
			$user_integral=0;
		}
		//echo $user_integral;exit;
		if($user_integral<$user['integral'])$user['integral']=$user_integral;
		$this->assign('user',$user);
		$this->assign('user_integral',$user_integral);
		$this->assign('cart_id',$cart_id);
		//获取用户地址
		$map	=	array();
		$map['user_id']	=	$_SESSION['user']['id'];
		$uaddress_id	=	intval(I('uaddress_id'));
		if($uaddress_id>0)
		{
			$map['id']	=	$uaddress_id;
		}
		$useraddress	=	M('UserAddress')->where($map)->order('is_default desc,id desc')->find();
		$this->assign('useraddress',$useraddress);
		//获取仓库
		$map	=	array();
		$map['id']	=	array('in',implode(',',$depot_ids));
		$depotlist	=	M('Depot')->where($map)->select();
		//var_dump($depotlist);exit;
		$this->assign('depotlist',$depotlist);
		$arealist	=	M('Area')->select();
		foreach($arealist as $item)
		{
			$areaarr[$item['id']]=$item;
		}
		$this->assign('areaarr',$areaarr);
		//$tmpl
		$record=M('WebSite')->find();
		//var_dump($record);exit;
		$rateprice=round($record['rate']);
		$this->assign('rateprice',$rateprice);
		//获取用户可用优惠券
		$join=' as d inner join onethink_coupon as c on d.coupon_id=c.id';
		$map	=	array();
		$map['d.user_id']=$_SESSION['user']['id'];
		$proid =M('cart')->where("id =".$cart_id)->getField('product_id');
		$map['c.pid'] =$proid;
		$couponnum=M('CouponDetail')->join($join)->where(' start_date<="'.date("Y-m-d").'" and end_date>="'.date("Y-m-d").'"')->where($map)->count();
		// echo M('CouponDetail')->getlastsql();exit;
		$this->assign('couponnum',$couponnum);
		$coupon_id	=	intval(I('coupon_id'));
		if($coupon_id>0)
		{
			$coupondetail=M('CouponDetail')->where('id='.$coupon_id)->find();
			$coupon=M('Coupon')->where('id='.$coupondetail['coupon_id'])->find();
			$this->assign('coupon',$coupon);
			$this->assign('coupondetail',$coupondetail);
		}
		$this->display();
	}
	//写入订单
	public function addorder()
	{
		if(!isset($_SESSION['user']))
		{
			$this->error('请登陆');
		}
		$type	=	intval(I('post.type'));
		$address_id	=	intval(I('post.address_id'));
		$depot_id=	intval(I('post.depot_id'));
		if($type==0)
		{
			if($address_id<1)
			{
				$this->error('请选择您的收货地址');
			}
		}
		else
		{
			if($depot_id<1)
			{
				$this->error('请选择仓库');
			}
		}
		//地址ID
		$cart_ids	=	I('post.cart_ids');//获取购物车内容
		$map['user_id']=$_SESSION['user']['id'];
		$map['id']	=	array('in',I('post.cart_ids'));
		$list	=	M('Spellcart')->where($map)->select();
		if(!$list)
		{
			$this->error('请您选择产品');
		}
		$coupon_detail_id=intval(I('coupon_id'));
		$coupon_money=0;
		if($coupon_detail_id>0)
		{
			$coupondetail=M('CouponDetail')->where('id='.$coupon_detail_id)->find();
			$coupon=M('Coupon')->where('id='.$coupondetail['coupon_id'])->find();
			$coupon_money=$coupon['money'];
			$datad['plytime']	=	time();
			$datad['is_ply']	=	1;
			M('CouponDetail')->where('id='.$coupon_detail_id)->save($datad);
		}
		//$total_price=0;
		/*foreach($list as $item)
		{
			//$total_price+=$item['product_num']*$item['product_price'];
		}*/
		$this->assign('total_price',$total_price);
		$integral	=	intval(I('post.integral'));
		$user	=	M('User')->where('id='.$_SESSION['user']['id'])->find();
		if($user['integral']<$integral)
		{
			$this->error('您的积分不足');
		}
		$data['sn']			=	date('YmdHis').rand(0,999);
		$data['user_id']	=	$_SESSION['user']['id'];
		$data['money']		=	I('post.total_price');//总金额 
		$data['express_money']=	I('post.express_money');//运费
		$data['type']		=	$type;//0送货上门  1仓库自取
		$data['address_id']	=	$address_id;//地址ID
		$data['depot_id']	=	I('post.depot_id');//仓库ID
		$data['integral']	=	$integral;//积分
		$data['addtime']	=	time();
		$data['is_invoice']	=	I('post.is_invoice');//是否开票发票0否 1是
		$data['invoice_head']=	I('post.invoice_head');//发票抬头
		$data['coupon_id']	=	$coupon_detail_id;
		$data['coupon_money']=	$coupon_money;
		$order_id=M('spellorder')->add($data);
		if($order_id<1)
		{
			$this->error('下单失败');
		}
		if($integral>0)
		{
			$datam	=	array();
			$datam['user_id']=	$_SESSION['user']['id'];
			$datam['title']	=	'积分支付';
			$datam['money']	=	$integral;
			$datam['addtime']=	time();
			$datam['status']=	1;
			$datam['type']	=	1;
			M('UserRecharge')->add($datam);
		}
		$datam	=	array();
		$datam['order_id']	=	$order_id;
		foreach($list as $item)
		{
			$datam['product_id']	=	$item['product_id'];
			$datam['product_num']	=	$item['product_num'];
			$datam['product_attr']	=	$item['product_attr'];
			$datam['product_price']	=	$item['product_price'];
			$datam['product_vipprice']=	$item['product_vipprice'];
			$datam['share_user_id']	=	$item['share_user_id'];
			M('spellorder_detail')->add($datam);
			//echo M('OrderDetail')->getlastsql();exit;
		}
		$this->assign('order',$data);
		M('Spellcart')->where($map)->delete();
		$map['id']	=	$_SESSION['user']['id'];
		M('User')->where($map)->setDec($integral);//减少用户积分
		header('content-type:application/json;charset=utf8');
		$arr['order_id']=	$order_id;
		$arr['status']	=	1;
		echo json_encode($arr);
		exit;
		//header('Location:/Member/Order?order_id='.$order_id);
		//$this->display();
	}
	//选择优惠券
	public function couponlist()
	{
		$field='c.*,d.id as did';
		$join=' as d inner join onethink_coupon as c on d.coupon_id=c.id';
		$cart_id	=	I('cart_id');
		$this->assign('cart_id',$cart_id);
		//$map['user_id']	=	$_SESSION['user']['id'];
		$map	=	array();
		$proid =M('cart')->where("id =".$cart_id)->getField('product_id');
		$map['c.pid'] =$proid;
		$map['d.user_id']=$_SESSION['user']['id'];
		$map['_string']=' start_date<="'.date("Y-m-d").'" and end_date>="'.date("Y-m-d").'"';
		$list=M('CouponDetail')->field($field)->join($join)->where($map)->select();
		// echo M('CouponDetail')->getlastsql();exit;
		$this->assign('list',$list);
		$this->display();
	}

}