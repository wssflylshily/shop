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
use Home\Tool\JssdkController;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {
	//系统首页
    public function index(){
    	$this->updateSpellState();
    	$this->assign('forward',$_SERVER['REQUEST_URI']);
    	if (I('get.ref_id')) {
    		$_SESSION['ref_id'] =I('get.ref_id');
    	}

		$this->assign('home_active','active');
		
		//查找所有一级分类
		$map['status'] = 1;
		$map['pid'] = 0;
		$this->all_cates = M('category')->where($map)->order('sort ASC,id ASC')->field('id,title')->select();
		
		
		//首页顶部焦点图
		$focuslist1	=	$this->getfocuslist(1,100);
		$this->assign('focuslist1',$focuslist1);
		
		//美丽模块焦点图
		$this->list2 = $this->getfocuslist(2,100);
		
		//健康焦点图
		$this->list3 = $this->getfocuslist(3,100);
		
		//玩乐焦点图
		$this->list4 = $this->getfocuslist(4,100);
		
		//家居焦点图
		$this->list5 = $this->getfocuslist(5,100);
		
		//焦点图下的推荐商品
		//酒水推荐商品
		$cats1 = M('category')->where('id=14 or pid=14')->getField('id',true);
		$map = array();
		$map['category_id'] = array('in',$cats1);
		$map['status'] = 1;
		$map['is_home'] = 1;
		$this->products1 = M('product')->where($map)->order('order_num asc')->select();
		//食品推荐商品
		$cats2 = M('category')->where('id=16 or pid=16')->getField('id',true);
		$map['category_id'] = array('in',$cats2);
		$this->products2 = M('product')->where($map)->order('order_num asc')->select();
		//玩乐推荐商品
		/*$cats3 = M('category')->where('id=4 or pid=4')->getField('id',true);
		$map['category_id'] = array('in',$cats3);
		$this->products3 = M('product')->where($map)->order('order_num asc')->select();*/
		//家居推荐商品
		$cats4 = M('category')->where('id=17 or pid=17')->getField('id',true);
		$map['category_id'] = array('in',$cats4);
		$this->products4 = M('product')->where($map)->order('order_num asc')->select();
		/*//玩乐焦点图
		$this->list6 = $this->getfocuslist(6,100);
		//玩乐焦点图下的4小图
		$this->list7 = $this->getfocuslist(7,4);
		
		//家居焦点图
		$this->list8 = $this->getfocuslist(8,100);
		//家居焦点图下的4小图
		$this->list9 = $this->getfocuslist(9,4);*/

		$website=M('WebSite')->find();
		$this->assign('website',$website);
		
		$is_login=0;
		$order_num=0;
		$cart_num=0;
		$coupon_num=0;
		if(isset($_SESSION['user']))
		{
			$is_login=1;
			$user=M('User')->where('id='.$_SESSION['user']['id'])->find();
			$this->assign('user',$user);
			if ($user['name'] !=''){
				$this->assign('name',$user['name']);
			}else {
				$this->assign('name',$user['login_user']);
			}
			//获取订单数量
			$order_num=M('Order')->where('user_id='.$user['id'].' and is_del=0')->count();
			$map			=	array();
			$map['user_id']	=	$_SESSION['user']['id'];
			//购物车数量
			$cart_num		=	M('Cart')->where($map)->count();
			//可使用的优惠券数量
			$map['is_ply'] = 0;
			$coupon_num		=	M('CouponDetail')->where($map)->count();
			//未读消息数量
			$info_num = M('msg')->where(array('user_id'=>$_SESSION['user']['id'],'status'=>0))->count();
		}
		$this->assign('coupon_num',$coupon_num);
		$this->assign('order_num',$order_num);
		$this->assign('is_login',$is_login);
		$this->assign('cart_num',$cart_num);
		$this->assign('info_num',$info_num);
		
		/*******************拼团****************************/
		$this->spell = M('spell')->where('state<3 and status=1 and is_home=1')->order('order_num asc,id DESC')->select();
		$statearr[1] = '拼团未开始';
		$statearr[2] = '拼团分享中';
		$statearr[3] = '拼团已结束';
		$this->assign('statearr',$statearr);
		

		/*******************蜜罐热销榜****************************/
		//查询商品表中销量前五的商品
		$products = M('product')->where('status=1')->order('sell_num DESC')->limit(5)->select();
		$y = date('Y');
		$m = date('m');
		$d = date('d');
		//当日热销榜
		$end = NOW_TIME;
		$start = strtotime(date('Y-m-d'));
		$where = array();
		$where['addtime'] = array('between',array($start,$end));
		$order_ids = M('order')->where($where)->getField('id',true);
		$where = array();
		$where['order_id'] = array('in',$order_ids);
		$proids = M('order_detail')->where($where)->group('product_id')->order('sum(product_num) DESC')->limit(5)->getField('product_id',true);
		$where = array();
		$where['id'] = array('in',$proids);
		$where['status'] = 1;
		$prolist = M('product')->where($where)->select();
		if(!$prolist)$prolist=$products;
		$this->assign('prolist',$prolist);
		
		//当月热销榜
		$start = strtotime($y.'-'.$m.'-01');
		$where = array();
		$where['addtime'] = array('between',array($start,$end));
		$order_ids = M('order')->where($where)->getField('id',true);
		$where = array();
		$where['order_id'] = array('in',$order_ids);
		$proids = M('order_detail')->where($where)->group('product_id')->order('sum(product_num) DESC')->limit(5)->getField('product_id',true);
		$where = array();
		$where['id'] = array('in',$proids);
		$where['status'] = 1;
		$prolist1 = M('product')->where($where)->select();
		if(!$prolist1)$prolist1=$products;
		$this->assign('prolist1',$prolist1);
		
        $this->display();
    }
    
    public function catelist(){
    	$id = (int)I('id');
    	$map = array();
    	$map['pid'] = $id;
    	$map['status'] = 1;
    	$order = 'sort asc,id asc';
    	$first_id = M('category')->where($map)->order($order)->getField('id');
    	$prolist = M('product')->where('status=1 and category_id='.$first_id)->order('order_num asc')->select();
    	
    	$this->assign('prolist',$prolist);
    	
    	$catelist = M('category')->where($map)->order($order)->select();
    	foreach ($catelist as $k=>$v){
    		if($v['icon']>0){
	    		$catelist[$k]['image'] = M('picture')->where('id='.$v['icon'])->getField('path');
    		}
    	}
    	$this->assign('catelist',$catelist);
    	
    	$this->display();
    }
    /**
     * ajax获取指定分类下的商品
     */
    public function ajaxgetproducts(){
    	$keywords = trim(I('keywords'));
    	//$p = (int)I('page')?(int)I('page'):2;
    	$cateId = (int)I('cate');
    	$map['category_id'] = $cateId;
    	$map['status'] = 1;
    	if($keywords!=""){
    		$map['title'] = array('like','%'.$keywords.'%');
    	}
    	$list = M('product')->where($map)->order('order_num asc')->select();
    	if (!$list) $list = array();
    	echo json_encode($list);
    }
    
	public function ajaxlist()
	{
		$order	=	intval(I('order'));
		switch($order)
		{
			case 1://销量最高
				$orderstr='sell_num desc,id desc';
			break;
			case 2://好评最多
				$orderstr='hao_num desc,id desc';
			break;
			default://综合排序
				$orderstr='order_num desc,id desc';
		}
		$page	=	intval(I('page'));
		$page=$page-1;
		if($page<0)$page=0;
		$model	=	M('Product');
		$map['is_home']	=	1;
		$field='id,title,gprice,sell_num,image';
		$list=M('Product')->field($field)->order($orderstr)->limit($page*10,($page+1)*10)->select();
		if(!$list)$list=array();
		header('Content-Type: text/plain; charset=utf-8');
		echo json_encode($list);
		//$this->assign('list',$list);
		//$this->display();
	}
	
	/**
	 * 联盟酒店详情
	 */
	public function hotelDetail(){
		$jssdk = new JssdkController();
		$signPackage = $jssdk->getSignPackage();
		$this->assign('signPackage',$signPackage);
		
		$id = (int)I('id');
		$info = M('hotel')->where(array('id'=>$id))->find();
		$this->assign('info',$info);
// 		print_r($info);die;
		$picid = explode(',', $info['imglist']);
		$map['id'] = array('in',$picid);
		$piclist = M('picture')->where($map)->select();
		$this->assign('piclist',$piclist);

		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->display();
	}

}