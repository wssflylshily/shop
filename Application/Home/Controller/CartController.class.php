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

class CartController extends HomeController {
	//检测库存
	public function detection()
	{
		$field	=	'c.*,p.title,p.image,p.depot_num';
		$join	=	' as c inner join onethink_product as p on c.product_id=p.id';
		$list=M('Cart')->field($field)->join($join)->where($map)->select();
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
    	cookie('forward',$_SERVER['REQUEST_URI']);
    	if (!$_SESSION['user']){
    		$this->redirect('/Member/Login/index');
    	}
		$is_vip=0;
		if(isset($_SESSION['user']))
		{
			$is_login=1;
			$user=M('User')->where('id='.$_SESSION['user']['id'])->find();
			if (!$user['mobile']){
				$this->redirect('/Member/Index/addMobile');
			}
			//var_dump($user);exit;
			if($user && $user['type']==1)
			{
				$is_vip=1;
			}
			$grade = M('grade')->where('id='.$user['lv'])->find();
			if($grade)$zk = $grade['gzk'];
			
		}
		if(!$zk) $zk = 1;
		$this->assign('zk',$zk);
		$this->assign('is_vip',$is_vip);
        $map['c.user_id']	=	$_SESSION['user']['id'];
        $map['c.status'] ='0';
		$field	=	'c.*,p.title,p.image,p.gprice,p.market_price as price';
		$join	=	' as c inner join onethink_product as p on c.product_id=p.id';
		$list=M('Cart')->field($field)->join($join)->where($map)->select();
		
		foreach ($list as $k=>$v){
			$product = M('product')->where('id='.$v['product_id'])->find();
			$list[$k]['stock'] = $product['depot_num'];
			$price = $product['gprice'];
			$oldprice = $product['market_price'];
			if($v['product_attr']!=""){
				$attr = "";
				$atr1 = explode(',', $v['product_attr']);
				foreach ($atr1 as $key){
					$atr2 = explode('=', $key);
					$attr.=$atr2[1];
				}
				$pro = M('product_attr')->where('product_id='.$v['product_id'].' and attr_value="'.$attr.'"')->find();
				$price = $pro['price'];
				$oldprice = $pro['oldprice'];
			}
			$list[$k]['price'] = round($price*$zk,2);
			$list[$k]['oldprice'] = round($oldprice*$zk,2);
		}
		//echo M('Cart')->getlastsql();exit;
		$this->assign('list',$list);
		$map1['c.user_id']	=	$_SESSION['user']['id'];
        $map1['c.status'] ='1';
		$field1	=	'c.*,p.title,p.image,p.gprice,p.market_price';
		$join1	=	' as c inner join onethink_product as p on c.product_id=p.id';
		$list1=M('Cart')->field($field1)->join($join1)->where($map1)->select();
// 		echo M('Cart')->getlastsql();exit;
// 		print_r($list1);die;
		$this->assign('list1',$list1);
		//var_dump($list);exit;
		$class_nav['cart']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$this->assign('cart_active','active');
         $this->display();
    }
	//增加
	public function insert()
	{
		$userid = $_SESSION['user']['id'];
		if ($_SESSION['user']['id']!="") {
        	# code...
        	$lv =M('user')->where('id= '.$_SESSION['user']['id'])->getField('lv');
        	$gzk =M('grade')->where('glv ='.$lv)->getField('gzk');
        
        	$this->assign('gzk',$gzk);
        }

		$product_id	=	I('post.product_id');
		$product_attr = rtrim(I('attr'),',');
		$status =I('status')?I('status'):0;
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
		$attrlist=explode(',',$product_attr);
		$attr='';
		foreach($attrlist as $item)
		{
			list($name,$val)=explode('=',$item);
			$attr.=$val;
		}
		$map	=	array();
		$map['id']	=	$product_id;
		$map['attr_value']=$attr;
		$row = M('ProductAttr')->where($map)->find();
		if (!$row){
			$map	=	array();
			$map['id']	=	$product_id;
			$row=M('Product')->where($map)->find();
			$row['price'] = $row['gprice'];
			if (!empty($gzk)) $row['price'] = $row['gprice']*$gzk;
		}
		$map1 = array();
		$map1['user_id']=$userid;
		$map1['product_id']=$product_id;
		$map1['status'] =$status;
		$map1['product_attr'] = $product_attr;
		$cart=M('Cart')->where($map1)->find();
		if($cart)
		{
			M('Cart')->where('id='.$cart['id'])->setInc('product_num',$product_num);
			$cartid = $cart['id'];
		}else{
			$data['user_id']	=	$userid;
			$data['product_id']	=	$product_id;
			$data['status'] = $status;
			$data['product_num']=	$product_num;
			$data['product_price']=	$row['price'];
			$data['share_user_id']=	$share_user_id;
			$data['product_attr']=	$product_attr;
			$data['addtime']=	time();
			$id = M('Cart')->add($data);
			$cartid = $id;
			//echo M('Cart')->getlastsql();exit;
		}
		$this->success($cartid);
		//var_dump($row);
	}
	//减少数量
	public function reduce()
	{
		$cart_id=I('post.cart_id');
		$cart=M('Cart')->where('id='.$cart_id)->find();
		if($cart['product_num']<2)
		{
			$this->error('再减就删除了');
		}
		M('Cart')->where('id='.$cart_id)->setDec('product_num',1);
	}
	//增加数量
	public function addnum()
	{
		$cart_id=I('post.cart_id');
		$cart=M('Cart')->where('id='.$cart_id)->find();
		M('Cart')->where('id='.$cart_id)->setInc('product_num',1);
	}
	//改变数量
	public function updatenum($cart_id)
	{
		$cart_id = I('post.cart_id');
		$data['product_num']=I('post.num');
		if (M('Cart')->where('id='.$cart_id)->save($data)){
			$this->error('操作成功');
		}else{
			$this->error('操作失败');
		}
	}
	//删除某个商品
	public function del()
	{
		$cart_id=I('post.cart_id');
		$map['id']=array('in',$cart_id);
		M('Cart')->where($map)->delete();
	}
	//确认订单
	public function step2()
	{
		$max_total = getOrderMoney();			//免运费的订单总价上限
		$expenses = getExpense();	//运费
		//获取用户信息
		$user	=	M('User')->where('id='.$_SESSION['user']['id'])->find();
		//用户可享受的折扣
		$ugrade = M('grade')->where('id='.$user['lv'])->find();
		if($ugrade)$zk = $ugrade['gzk'];
		if(!$zk)$zk = 1;
		$this->assign('zk',$zk);

		$class_nav['cart']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$paytype = I('paytype');
		//if ($paytype=="")$paytype=0;
		$sendtype = I('sendtype');
		//if ($sendtype=="") $sendtype=0;
		$this->assign('paytype',$paytype);
		$this->assign('sendtype',$sendtype);
		//获取网站基本设置
		$record=M('WebSite')->find();
		
		$cart_id = I('cart_id');
		$map['c.user_id']=$_SESSION['user']['id'];
		$map['c.id']=array('in',$cart_id);
		$field	=	'c.*,p.title,p.image,p.market_price';
		$join	=	' as c inner join onethink_product as p on c.product_id=p.id';
		$list=M('Cart')->field($field)->join($join)->where($map)->select();
//echo M('Cart')->getlastsql();exit;
		$express_money = 0;
		$promoney = 0;
		$product_num = 0;
		$total_price = 0;
		$depot_ids	=	array();
		$integral_price=0;//积分金额
		foreach($list as $k=>$v)
		{
			$product = M('product')->where('id='.$v['product_id'])->find();
			$price = $product['gprice'];
			$gprice = $product['market_price'];
			if($v['product_attr']){
				$attr = "";
				$atr1 = explode(',', $v['product_attr']);
				foreach ($atr1 as $key){
					$atr2 = explode('=', $key);
					$attr.=$atr2[1];
				}
				$pro = M('product_attr')->where('product_id='.$v['product_id'].' and attr_value="'.$attr.'"')->find();
				$price = $pro['price'];
				$gprice = $pro['oldprice'];
			}
			//$express_money = $express_money+$product['express_money'];
			$list[$k]['price'] = round($price*$zk,2);
			$list[$k]['gprice'] = round($gprice*$zk,2);
			$promoney += $v['product_num']*$price;
		}
		$promoney = $promoney*$zk;
		$total_price = $promoney;
		
		//商品数量
		$this->assign('product_num',$product_num);
		
		//echo M('Cart')->getlastsql();exit;
		//var_dump($list);exit;
		$this->assign('list',$list);
		
		$this->assign('integral_price',$integral_price);
		//可以使用积分支付
		//echo $integral_price;exit;
		if($integral_price>0){
			//if($user['integral']>=$integral_price*$siteset['rate'])
			//{
				//echo $integral_price.'='.$record['rate'];exit;
				$user_integral=$integral_price*$record['rate'];
			//}
		}else{
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
		$map['status'] = 1;
		$useraddress	=	M('UserAddress')->where($map)->order('is_default desc,id desc')->find();
		$this->assign('useraddress',$useraddress);
		//获取仓库
		$map	=	array();
		$map['status'] = 1;
		//$map['id']	=	array('in',implode(',',$depot_ids));
		$depotlist	=	M('store')->where($map)->select();
		$this->assign('depotlist',$depotlist);
		$depot_id = (int)I('depot_id');
		$map = array();
		$map['status'] = 1;
		if($depot_id>0)$map['id'] = $depot_id;
		$store	=	M('store')->where($map)->find();
		$this->assign('store',$store);
		
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
		//$map['c.pid'] = array(array('eq',$proid),array('eq',0), 'or');
		$couponnum=M('CouponDetail')->join($join)->where('c.start_date<="'.date("Y-m-d H:i:s").'" and c.end_date>="'.date("Y-m-d H:i:s").'" and d.is_ply=0')->where($map)->count();
		//print_r(M('CouponDetail')->getLastsql());die;
		$this->assign('couponnum',$couponnum);
		$coupon_id	=	intval(I('coupon_id'));
		if($coupon_id>0)
		{
			$coupondetail = M('CouponDetail')->where('id='.$coupon_id)->find();
			$coupon = M('Coupon')->where('id='.$coupondetail['coupon_id'])->find();
			if($promoney>$coupon['lowest']){
				$total_price = ($promoney-$coupon['money']);
				$this->assign('coupon',$coupon);
				$this->assign('coupondetail',$coupondetail);
			}else{
				$this->assign('coupon','');
				$this->assign('coupondetail','');
			}
			
		}
		
		if ($promoney<=0) $promoney=0;

		if ($total_price<=0) $total_price=0;
		
		if ($total_price < $max_total){
			$express_money = $expenses;
		}
		$total_price = $total_price+$express_money;
		//运费
		$this->assign('express_money',round($express_money,2));
		//商品总额
		$this->assign('promoney',round($promoney,2));
		//订单总额
		$this->assign('total_price',round($total_price,2));
		cookie('forward',$_SERVER['REQUEST_URI']);
		
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
		$paytype = (int)I('paytype');
// 		if($type==0)
// 		{
			if($address_id<1)
			{
				$this->error('请选择您的收货地址');
			}
// 		}
		/*else
		{
			if($depot_id<1)
			{
				$this->error('请选择仓库');
			}
		}*/
		//地址ID
		$cart_ids	=	I('post.cart_ids');//获取购物车内容
		$userid = $_SESSION['user']['id'];
		$map['user_id']=$_SESSION['user']['id'];	//用户id
		$map['id']	=	array('in',I('post.cart_ids'));
		$list	=	M('Cart')->where($map)->select();
		$user = M('user')->where('id='.$userid)->find();
		$grade = M('grade')->where('id='.$user['lv'])->find();
		if($grade)$zk = $grade['gzk'];
		if(!$zk) $zk = 1;
		if(!$list)
		{
			$this->error('订单已生成');
		}
		$coupon_detail_id=intval(I('coupon_id'));	//优惠券id
		$coupon_money=0;		//优惠券金额
		if($coupon_detail_id>0)
		{
			$coupondetail=M('CouponDetail')->where('id='.$coupon_detail_id)->find();
			$coupon=M('Coupon')->where('id='.$coupondetail['coupon_id'])->find();
			$coupon_money=$coupon['money'];
			$datad['plytime']	=	time();
			$datad['is_ply']	=	1;
			M('CouponDetail')->where('id='.$coupon_detail_id)->save($datad);
		}
		
		$express_money = I('express_money');		//运费
		$total_price=0;	//订单总价
		foreach($list as $item)
		{
			$product = M('product')->where('id='.$item['product_id'])->find();
			$price = $product['market_price'];
			if($item['product_attr']){
				$attr = "";
				$attr1 = explode(',', $item['product_attr']);
				foreach ($attr1 as $key){
					$atr2 = explode('=', $key);
					$attr .= $atr2[1];
				}
				$product = M('product_attr')->where('product_id='.$item['product_id'].' and attr_value="'.$attr.'"')->find();
				$price = $product['price'];
			}
			$total_price +=round($item['product_num']*$price*$zk,2);
		}
		//$total_price +=$express_money;
		//if ($coupon_money>0) $total_price = ($total_price-$coupon_money);
		//if ($cash_money>0) $total_price = ($total_price-$cash_money);
		if ($total_price<0)$total_price=0;
		//$this->assign('total_price',$total_price);
		$integral	=	intval(I('post.integral'));
		$user	=	M('User')->where('id='.$_SESSION['user']['id'])->find();
		/*if($user['integral']<$integral)
		{
			$this->error('您的积分不足');
		}*/
		if($paytype==1&&$user['money'] < $total_price){
			$this->error('您的余额不足');
		}
		$data['sn']			=	date('YmdHis').rand(0,999);
		$data['user_id']	=	$_SESSION['user']['id'];
		$data['money']		=	 $total_price+$express_money;
		$data['pay_money']		=	 round(I('total_price'),2);		//I('post.total_price');//总金额 
		$data['express_money']=	$express_money;//运费
		$data['type']		=	$type;			//送货方式，0送货上门  1仓库自取
		$data['address_id']	=	$address_id;//地址ID
		$data['depot_id']	=	$depot_id;//自提点ID
		$data['integral']	=	$integral;//积分
		$data['addtime']	=	time();
		$data['coupon_id']	=	$coupon_detail_id;
		$data['coupon_money']=	$coupon_money;
// 		$data['cashcoup_id'] = $cash_id;
// 		$data['cashcoup_money'] = $cash_money;
		$data['paytype'] = $paytype;
		$data['note'] = I('note');
		
		$order_id=M('Order')->add($data);
		if($order_id<1){
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
			$proprice = M('product')->where('id='.$item['product_id'])->getField('gprice');

			//查找商品信息
			$pro = M('product')->where('id='.$item['product_id'])->find();
			$attrs = "";
			if ($item['product_attr']!=""){
				$at1 = explode(',', $item['product_attr']);
				foreach ($at1 as $k1){
					$at2 = explode('=', $k1);
					$attrs .= $at2[1];
				}
				$proprice = M('product_attr')->where('product_id='.$item['product_id'].' and attr_value="'.$attrs.'"')->getField('price');
			}
			$datam['product_price']	=	round($proprice*$zk,2);
			$datam['product_vipprice']=	$item['product_vipprice'];
			$datam['share_user_id']	=	$item['share_user_id'];
			$datam['share_money'] = $pro['share_money'];
			M('OrderDetail')->add($datam);
			//下单成功，增加销量，增加购买人数，减少库存
			$prod = array();
			$prod['depot_num'] = $pro['depot_num']-$item['product_num'];
			$prod['sell_num'] = $pro['sell_num']+$item['product_num'];
			$prod['buyer_num'] = $pro['buyer_num']+1;
			M('product')->where('id='.$item['product_id'])->save($prod);
			//echo M('OrderDetail')->getlastsql();exit;
		}
		
		//如果选择余额支付
		if ($paytype==1){
			//减少用户的账户余额
			$total_price =  round(I('total_price'),2);
			M('user')->where('id='.$user['id'])->save(array('money'=>($user['money']-$total_price)));
			
			//增加支出记录
			$rec['user_id'] = $user['id'];
			$rec['type'] = 0;
			$rec['title'] = "支付订单";
			$rec['money'] = $total_price;
			$rec['addtime'] = time();
			M('account_record')->add($rec);
			//订单状态改为已支付
			M('order')->where('id='.$order_id)->save(array('status'=>1,'paytime'=>time()));
		}
		
		$this->assign('order',$data);
		M('Cart')->where($map)->delete();
// 		$map['id']	=	$_SESSION['user']['id'];
// 		M('User')->where($map)->setDec($integral);//减少用户积分
		header('content-type:application/json;charset=utf8');
		$arr['order_id']=	$order_id;
		$arr['status']	=	1;
		echo json_encode($arr);
		exit;
		//header('Location:/Member/Order?order_id='.$order_id);
		//$this->display();
	}

	// {'pro_id':pro_id,'address_id':address_id,'total_price':total_price,'express_money':express_money,'coupon_id':$('#coupon_id').val()},  

	//团购加入订单
	public function addspellorder()
	{
		$spe_id = (int)I('spe_id');					//拼团id
		$smap['id'] = $spe_id;
		$spell = M('spell')->where($smap)->find();
		if ($spell['state']==1){
			$ret['status'] = -1;
			$ret['info'] = '拼团未开始';
			$this->ajaxReturn($ret);exit;
		}
		if ($spell['state']==3){
			$ret['status'] = -1;
			$ret['info'] = '拼团已结束';
			$this->ajaxReturn($ret);exit;
		}
		
		$userid = $_SESSION['user']['id'];
		//查看用户信息
		$umap['id'] = $userid;
		$user = M('user')->where($umap)->find();
		
		$addressid = (int)I('address_id');
		if (!$addressid){
			$this->error('请选择收货地址');
		}
		$team_id = (int)I('team_id');
		
		$str = "参团";
		if (!$team_id){
			$item = array();
			$item['user_id'] = $userid;
			$item['spell_id'] = $spe_id;
			$item['addtime'] = time();
			$team_id = M('spell_teams')->add($item);
			$str = "开团";
		}else{
			$this->teamIsFull($team_id);
		}
		
		$paytype = (int)I('paytype');					//支付方式，0微信支付，1余额支付
        $data['sn']			=	date('YmdHis').rand(0,999);
        $data['user_id']	=	$userid;
        $data['team_id']	=	$team_id;//拼团团队id
        $data['spell_id'] = $spe_id;
        $data['spell_num'] = (int)I('product_num');
        $data['money']		=	I('post.total_price');//总金额
        $data['express_money']=	I('post.express_money');//运费
        $data['type']		=	(int)I('type');//0送货上门  1仓库自取
        $data['address_id']	=	$addressid;//地址ID
        $data['note'] = I('note'); //买家留言
        $data['paytype'] = $paytype;
        $data['addtime']	=	time();

        $order_id = M('spellorder')->add($data);
		if ($order_id>0) {
			$ret['status'] = 1;
			$ret['info'] = $str."成功！";
			$ret['order_id'] =$order_id;
			
			if ($paytype==1){
				//如果选择余额支付，下单成功后，要从余额中减去相应的金额
				$yue = $user['money']-$data['money'];
				M('user')->where($umap)->save(array('money'=>$yue));
				M('spellorder')->where(array('id'=>$order_id))->save(array('paytime'=>time(),'status'=>1));
				//参团人数加1
				M('spell_teams')->where('id='.$team_id)->setInc('join_num',1);
				//拼团的销量增加
				M('spell')->where('id='.$spe_id)->setInc('sell_num',$data['product_num']);
				//增加支出记录
				$rec['user_id'] = $userid;
				$rec['type'] = 0;
				$rec['title'] = "支付拼团订单，订单编号：".$data['sn'];
				$rec['money'] = $data['money'];
				$rec['order_type'] = 2;
				$rec['order_id'] = $order_id;
				$rec['addtime'] = time();
				M('AccountRecord')->add($rec);

				$this->updateSpellState();
			}
			
		}else{
			$ret['status'] = -1;
			$ret['info'] = $str."失败！";
			$ret['order_id'] =$order_id;
			
		}
			
		$this->ajaxReturn($ret);
	}
	/**
	 * 判断拼团人数是否已满，批量更改订单状态，
	 */
	public function checkJoinSpellNum($id){
		//拼团信息
		$spell = M('spell')->where(array('id'=>$id))->find();
		if($spell['join_num']>=$spell['num']){
			//查找所有参加当前拼团且已支付的订单
			$omap['spell_id'] = $id;
			$omap['paystate'] = 1;
			$omap['status'] = 0;
			//将订单状态更改为已完成
			//M('spellorder')->where($omap)->save(array('status'=>1));
			return true;
		}
		return false;
		//$orders = M('spellorder')->where($omap)->select();
	}
	/**
	 * 拼团人数未满，拼团已到期
	 */
	public function checkSpelltime($id){
		//拼团信息
		$spell = M('spell')->where(array('id'=>$id))->find();
		$now = date('Y-m-d');
		$userid = $_SESSION['user']['id'];
		if ($now>$spell['end_date']){
			M('sepll')->where(array('id'=>$id))->save(array('state'=>4));
			//查找商品库存
			$depot = (int)M('product')->where('id='.$spell['pid'])->getField('depot_num');
			//查找所有参加当前拼团且已支付的订单
			$omap['spell_id'] = $id;
			$omap['paystate'] = 1;
			$omap['status'] = 0;
			$orders = M('spellorder')->where($omap)->select();
			$stock = 0;
			foreach ($orders as $k=>$v){
				//执行退款操作
				$user1 = M('user')->where('id='.$v['user_id'])->find();
				M('user')->where('id='.$v['user_id'])->save(array('money'=>$user1['money']+$v['money']));
				//添加收入记录
				$rec['user_id'] = $userid;
				$rec['type'] = 1;
				$rec['title'] = "拼团失败退款";
				$rec['money'] = $v['money'];
				$rec['addtime'] = time();
				M('AccountRecord')->add($rec);
				//更改订单状态
				M('spellorder')->where('id='.$v['id'])->save(array('status'=>4));
				//查找购买数量
				$pronum = (int)M('spellorder_detail')->where('order_id='.$v['id'])->getField('product_num');
				$stock += $pronum;
			
			}
			//商品库存还原
			M('product')->where('id='.$spell['pid'])->save(array('depot_num'=>$depot+$stock));
			
			return true;
		}
		
		return false;
	}


	//选择优惠券
	public function couponlist()
	{
		//$url = $_SERVER['REQUEST_URI'];
		$url = cookie('forward');
		$this->assign('url',$url);
		
		$cart_id	=	I('cart_id');
		$this->assign('cart_id',$cart_id);
		
		$now = date('Y-m-d H:i:s');
		$field='c.*,d.id as did';
		$join=' as d inner join onethink_coupon as c on d.coupon_id=c.id';
		//$map['user_id']	=	$_SESSION['user']['id'];
		$map	=	array();
		$proid =M('cart')->where("id =".$cart_id)->getField('product_id');
		//$map['c.pid'] =array('in',$proid.",0");
		$map['d.user_id']=$_SESSION['user']['id'];
		$map['_string'] = ' start_date<="'.$now.'" and end_date>="'.$now.'" and is_ply=0';
		$list = M('CouponDetail')->field($field)->join($join)->where($map)->select();
// 		print_r(M('CouponDetail')->getLastsql());
// 		echo M('CouponDetail')->getlastsql();exit;
		$this->assign('list',$list);
// 		print_r($list);die;
		$this->display();
	}
	
	//团购订单生成页面
	public function step3(){
		$this->updateSpellState();
		$team_id = (int)I('team_id');
		$this->assign('team_id',$team_id);
		//获取用户信息
		$user	=	M('User')->where('id='.$_SESSION['user']['id'])->find();
		
		$spell_id = I('spell_id');		//拼团id
		$paytype = I('paytype');
		$this->assign('paytype',$paytype);
		//查找拼团信息
		$spell = M('spell')->where(array('id'=>$spell_id))->find();
		$this->assign('spell',$spell);
		
		$expense = $spell['express_money'];
// 		$class_nav['cart']='weui_bar_item_on';
// 		$this->assign('class_nav',$class_nav);
		//获取网站基本设置
		$record=M('WebSite')->find();

		$this->assign('spell_id',$spell_id);	//拼团id
		$product_num = 1;
		$express_money = $expense;
		$total_price = 0;
		$promoney = 0;
		$depot_ids	=	array();
		$promoney = $spell['price']*$product_num;
		
		$total_price = $express_money+$promoney;
		//运费
		$this->assign('express_money',$express_money);
		//商品数量
		$this->assign('product_num',$product_num);
		//商品总额
		$this->assign('promoney',$promoney);
		//订单总额
		$this->assign('total_price',$total_price);
		
		$this->assign('user',$user);
		//获取用户地址
		$map	=	array();
		$map['user_id']	=	$user['id'];
		$uaddress_id	=	intval(I('uaddress_id'));
		if($uaddress_id>0)
		{
			$map['id']	=	$uaddress_id;
		}
		$map['status'] = 1;
		$useraddress	=	M('UserAddress')->where($map)->order('is_default desc,id desc')->find();
		$this->assign('useraddress',$useraddress);
		
		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->display();
	}
	
	/**
	 * 判断拼团人数是否已满
	 */
	public function teamIsFull($team_id){
		//$team_id = (int)I('team_id');
		$team = M('spell_teams')->where('id='.$team_id)->find();
		$spell = M('spell')->where('id='.$team['spell_id'])->find();
		$userId = $_SESSION['user']['id'];
		$order = M('spellorder')->where('team_id='.$team_id.' and user_id='.$userId)->find();
		if ($order){
			$this->error('您已经参加当前拼团');
		}
		if($team['join_num']>=$spell['num']||$team['status']==1){
			$this->error('拼团人数已满');
		}elseif ($team['status']==2){
			$this->error('拼团已结束');
		}
	}
	

	/**
	 * 选择自提点信息
	 */
	public function stores(){
	
		$areas = M('areas')->where('pid=0')->select();
		$this->assign('areas',$areas);

		$map = array();
		$area0 = (int)I('area0');
		if ($area0>0){
			$map['area_0'] = $area0;
			$this->assign('area0',$area0);
		}
		$area1 = (int)I('area1');
		if ($area1>0){
			$map['area_1'] = $area1;
			$this->assign('area1',$area1);
			$areas1 = M('areas')->where('pid='.$area0)->select();
			$this->assign('areas1',$areas1);
		}
		$area2 = (int)I('area2');
		if ($area2>0){
			$map['area_2'] = $area2;
			$this->assign('area2',$area2);
			$areas2 = M('areas')->where('pid='.$area1)->select();
			$this->assign('areas2',$areas2);
		}
		//print_r($area0."\r\t".$area1."\r\t".$area2);
		$map['status'] = 1;
		$stores = M('store')->where($map)->select();
		// 		print_r( M('store')->getLastsql());die;
		$this->assign('stores',$stores);
	
	
		$this->display();
	}
	

	/**
	 * ajax多级联动
	 */
	public function getareas(){
		$id = intval(I('id'));
		if($id){
			$data = M('areas')->where("pid='$id'")->select();
			if($data){
				$str='[';
				foreach ($data as $k=>$v){
					$tmp_str .='{"val":"'.$v['id'].'","text":"'.$v['title'].'"},';
				}
				$str.=substr($tmp_str,0,-1).']';
			}else{
				$str='';
			}
	
			echo $str;exit;
		}
	}
	
	
	
	
	/**
	 * 验证支付密码是否正确
	 */
	public function checkPaypwd(){
		$userid = $_SESSION['user']['id'];
		if (!$userid){
			$this->redirect('/Member/Login/index');
		}
		$user = M('user')->where('id='.$userid)->find();
		if (!$user){
			$data = array('status'=>-1,'info'=>'用户不存在');
			$this->ajaxReturn($data);exit;
		}
		if (!$user['paypwd']){
			$data = array('status'=>0,'info'=>'您还未设置支付密码','url'=>U('/Member/Index/editpaypwd'));
			$this->ajaxReturn($data);exit;
		}
		$pwd = I('pwd');
		if (empty($pwd)){
			$data = array('status'=>-1,'info'=>'支付密码不能为空');
			$this->ajaxReturn($data);exit;
		}elseif ($pwd!=$user['paypwd']){
			$data = array('status'=>-1,'info'=>'支付密码不正确');
			$this->ajaxReturn($data);exit;
		}else{
			$data = array('status'=>1,'info'=>'密码正确');
			$this->ajaxReturn($data);exit;
		}
		
	}

}