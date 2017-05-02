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
 * 订单数据
 */
class OrderController extends HomeController {
	public function delorder()
	{
		$id=	intval(I('post.id'));
		if($id<1)$this->error('error');
		M('Order')->where('id='.$id)->save(array('is_del'=>1));
		$this->success('删除成功');
	}
	public function index()
	{
		cookie('forward',$_SERVER['REQUEST_URI']);
		$website=M('WebSite')->find();
		$this->assign('website',$website);
		$class_nav['order']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$userid = $this->user['id'];
		$user = M('user')->where('id='.$userid)->find();
		$grade = M('grade')->where('id='.$user['lv'])->find();
		if($grade)$zk = $grade['gzk'];
		if(!$zk) $zk = 1;
		$this->assign('zk',$zk);
		$map['user_id']	=	$userid;
		$map['is_del']	=	0;
		$status	=	I('status');
		if($status!='')
		{
			$map['status']=	$status;
			switch($status)
			{
				case 0://待付款
					$statustitle=	'待付款';
					$statuscss[0]=	'active';
				break;
				case 1://待发货
					$statustitle=	'待发货';
					$statuscss[1]=	'active';
				break;
				case 2://待收货
					$statustitle=	'已发货';
					$statuscss[2]=	'active';
				break;
				case 3://交易成功
					$statustitle=	'交易成功';
					$statuscss[3]=	'active';
				break;
				case 4://交易关闭
					$statustitle=	'交易取消';
					$statuscss[4]=	'active';
				break;
			}
		}
		else
		{
			$statuscss[-1]=	'active';
			$statustitle	='全部订单';
		}
		$this->assign ( 'statuscss', $statuscss );
		$this->assign ( 'statustitle', $statustitle );
		$model	=	M('Order');
		//$this->_list($model,$map);
		$count = $model->where ( $map )->count ();
		if ($count > 0) {
			$p = new \Think\Page($count, C('PAGE_NUM'));
			$list = $model->where($map)->order('id desc')->limit($p->firstRow.','.$p->listRows)->select();
			$page = $p->show ();
				//var_dump($list);exit;
			foreach($list as $key=>$item)
			{
				$map	=	array();
				$map['product_id']=intval(I('post.product_id'));
				$map['user_id']=$_SESSION['user']['id'];
				$map	=	array();
				$map['order_id']=$item['id'];
				$join	=	' as d inner join onethink_product as p on d.product_id=p.id';
				$field	=	'p.image,p.title,d.*,p.market_price,p.gprice';
				$list[$key]['list']=M('OrderDetail')->where($map)->field($field)->join($join)->order('id desc')->select();
				//echo M('OrderDetail')->getlastsql();exit;
				foreach($list[$key]['list'] as $k=>$v)
				{
					if ($v['product_attr']){
						$attr = "";
						$atr1 = explode(',', $v['product_attr']);
						foreach ($atr1 as $k1){
							$atr2 = explode('=', $k1);
							$attr .= $atr2[1];
						}
						$pro = M('product_attr')->where('product_id='.$v['product_id'].' and attr_value="'.$attr.'"')->find();
						$list[$key]['list'][$k]['gprice'] = round($pro['oldprice']*$zk,2);
					}
					if($item['status']==3)
					{
						$map	=	array();
						//$map['product_id']=$v['product_id'];
						$map['order_detail_id']=$v['id'];
						$map['user_id']=$_SESSION['user']['id'];
						$evaluate=M('Evaluate')->where($map)->find();
						//echo M('Evaluate')->getlastsql();exit;
						if($evaluate)
						{
							$list[$key]['list'][$k]['pl']=1;
						}
						else
						{
							$list[$key]['list'][$k]['pl']=0;
						}
					}
					else
					{
						$list[$key]['list'][$k]['pl']=2;
					}
				}
			}
			//var_dump($list);exit;
			$this->assign ( 'list', $list );
		}
		$statusarr[0]='待付款';
		$statusarr[1]='待发货';
		$statusarr[2]='已发货';
		$statusarr[3]='交易完成';
		$statusarr[4]='取消交易';
		$this->assign ( 'statusarr', $statusarr );
		$this->assign('order_active','active');
		$this->assign('status',$status);
		$this->display();
	}
	
	/**
	 * 下拉加载更多的订单列表（ajax)
	 */
	public function ajaxGetOrderList(){
		$userid = $_SESSION['user']['id'];
		$p = (int)I('page');
		$pernum = C("PAGE_NUM");
		$start = ($p-1)*$pernum;
		$m = M('order');
		$status = I('status');
		$map['user_id'] = $userid;
		if ($status!="")$map['status'] = $status;
		$map['is_del']	=	0;
		
		$list = $m->where($map)->order('id desc')->limit($start,$pernum)->select();
		foreach($list as $key=>$item)
		{
			switch($item['status']){
				case 0://待付款
					$list[$key]['statusname'] =	'待付款';
					break;
				case 1://待发货
					$list[$key]['statusname'] =	'待发货';
					break;
				case 2://待收货
					$list[$key]['statusname'] =	'已发货';
					break;
				case 3://交易成功
					$list[$key]['statusname'] =	'交易成功';
					break;
				case 4://交易取消
					$list[$key]['statusname'] =	'交易取消';
					break;
			}
			//查询订单详情
			$map	=	array();
			$map['order_id'] = $item['id'];
			//$map['user_id'] = $userid;
			$join	=	' as d inner join onethink_product as p on d.product_id=p.id';
			$field	=	'p.image,p.title,d.*,p.market_price';
			$list[$key]['list'] = M('OrderDetail')->where($map)->field($field)->join($join)->order('id desc')->select();
			//echo M('OrderDetail')->getlastsql();exit;
			$list[$key]['product_num'] = 0;
			foreach($list[$key]['list'] as $k=>$v){
				$list[$key]['product_num'] += $v['product_num'];
				if($item['status']==3){
					$map	=	array();
					//$map['product_id']=$v['product_id'];
					$map['order_detail_id']=$v['id'];
					$map['user_id']=$_SESSION['user']['id'];
					$evaluate=M('Evaluate')->where($map)->find();
					//echo M('Evaluate')->getlastsql();exit;
					if($evaluate){
						$list[$key]['list'][$k]['pl']=1;
					}else{
						$list[$key]['list'][$k]['pl']=0;
					}
				}
				else{
					$list[$key]['list'][$k]['pl']=2;
				}
			}
		}
		if (!$list)$list = array();
		$this->ajaxReturn($list);
	}
	
	//支付成功
	public function payok()
	{
		$order_id	=	intval(I('order_id'));//订单ID
		$order=M('Order')->where('id='.$order_id)->find();
		if($order['status']>2)
		{
			$this->error('已经支付完成');
		}
		//var_dump($order);exit;
		$user	=	M('User')->where('id='.$order['user_id'])->find();
		//var_dump($user);exit;
		//给用户增加积分
		/*$jifenrat = getPayRatio();
		$jifen = $order['money']*$jifenrat;
		if ($jifen){
			M('User')->where('id='.$order['user_id'])->save(array('integral'=>$user['integral']+$jifen));
			//添加积分记录
			$item['user_id'] = $order['user_id'];
			$item['title'] = "购买商品,订单编号：".$order['sn'];
			$item['integral'] = $jifen;
			$item['type'] = 3;
			$item['orderid'] = $order['id'];
			$item['addtime'] = time();
			M('integral_record')->add($item);
		}*/
		$brokerage = getBrokerage();
		if($user['parent_user_id']>0)
		{
			//分享获得佣金
			$share_total_price=0;
			$total_price=0;//获取佣金
			$list=M('OrderDetail')->where('order_id='.$order_id)->select();
			/*foreach($list as $item)
			{
				$product=M('Product')->where('id='.$item['product_id'])->find();
				if(!$product)continue;
				$total_price += ($brokerage/100)*$item['product_price']*$item['product_num'];
				//$total_price+=$product['distribution_money']*$item['product_num'];
				/*$share_total_price=$product['share_money']*$item['product_num'];
				//写入分享记录
				if ($share_total_price>0){
					$data	=	array();
					$data['user_id']=	$item['share_user_id'];
					$data['order_id']=	$order_id;
					$data['order_sn']=	$order['sn'];
					$data['money']	=	$share_total_price;
					$data['addtime']=	time();
					M('BrokerageRecord')->add($data);
				}*/
				//写入返利记录
				/*if($product['rebate_time']>0 && $product['rebate_money']>0)
				{
					$data	=	array();
					$data['product_id']	=	$product['id'];
					$data['user_id']	=	$order['user_id'];
					$data['order_id']	=	$order_id;
					$data['order_sn']	=	$order['sn'];
					for($i=0;$i<$product['rebate_time'];$i++)
					{
						$daytime=date('Y-m-d',time()+30*86400*($i+1));
						$data['day']	=	$daytime;
						$data['money']	=	$product['rebate_money']*$item['product_num'];
						$data['status']	=	0;
						M('RebateRecord')->add($data);
					}
				}
			}*/
			$total_price = $order['money']*$brokerage;
			/*if($total_price>0)
			{
				//写入分销记录
				$data	=	array();
				$data['parent_id'] = $user['parent_user_id'];
				$data['user_id']=	$order['user_id'];
				$data['order_id']=	$order_id;
				$data['order_sn']=	$order['sn'];
				$data['money']	=	$total_price;
				$data['addtime']=	time();
				M('BrokerageRecord')->add($data);
				M('User')->where('id='.$user['parent_user_id'])->setInc('jie_money',$total_price);
				M('User')->where('id='.$user['parent_user_id'])->setInc('money',$total_price);
				//写入收入来源
				$items['user_id'] = $user['parent_user_id'];
				$items['money'] = $total_price;
				$items['type'] = 1;
				$items['title'] = "分佣所得";
				$items['addtime'] = time();
				M('account_record')->add($items);
			}*/
		}
		M('Order')->where('id='.$order_id)->save(array('status'=>1,'paytime'=>time()));
		$order = M('Order')->where('id='.$order_id)->find();
		$this->assign('order',$order);
		$this->display();
		//$this->success('支付成功');
	}
	//支付
	public function pay()
	{
		$class_nav['order']='weui_bar_item_on';
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
		$this->assign('order_active','active');
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
		if ($data['status']=='3') {
			# code...
			$grade =M('grade');
			$user =M('user');
			$info =M('Order')->where('id ='.$id)->find();
			$userid =$info['user_id'];
			$ordercost =floatval($info['money']);

			$userpoints =$user->where('id='.$userid)->getField('points');
			$gradeinfo =$grade->order('id ASC')->select();
			$userpoints =floatval($userpoints)+$ordercost;
			$rel =$user->where('id='.$userid)->setField('points',$userpoints);
			
			$prolist = M('order_detail')->where('order_id='.$id)->select();
			foreach ($prolist as $k=>$v){
				if($v['share_user_id']>0){
					$shareuser = M('user')->where('id='.$v['share_user_id'])->setInc('money',$v['share_money']);
					if($v['share_money']>0){
						$product = M('product')->where('id='.$v['product_id'])->find();
						//写入收入来源
						$items['user_id'] = $v['share_user_id'];
						$items['money'] = $v['share_money'];
						$items['recharge_type'] = 2;
						$items['type'] = 1;
						$items['title'] = "分享返现，商品名称：".$product['title'];
						$items['order_type'] = 1;
						$items['order_id'] = $order['id'];
						$items['is_pay'] = 1;
						
						$items['addtime'] = time();
						M('account_record')->add($items);
					}
				}
			}
			
			//用户确认收货，进行返佣金，加积分操作
			$user = M('user')->where('id='.$order['user_id'])->find();
			//增加用户积分
			$jifenrat = getPayRatio();
			$jifen = round($jifenrat*($order['money']),2);
			M('user')->where('id='.$order['user_id'])->save(array('integral'=>$user['integral']+$jifen));
			//增加积分来源记录
			$item['user_id'] = $user['id'];
			$item['integral'] = round($jifen,2);
			$item['title'] = "购买商品，订单编号：".$order['sn'];
			$item['type'] = 3;
			$item['orderid'] = $order['id'];
			$item['addtime'] = time();
			M('integral_record')->add($item);
			
			$parent = M('user')->where('id='.$user['parent_user_id'])->find();
			//获取分佣比例
			$ratio = getBrokerage(); 		//一级分佣比例
			$ratio2 = getBrokerageTwo(); 		//二级分佣比例
			$ratio3 = getBrokerageThree(); 		//三级分佣比例
			$money = round($order['pay_money']*$ratio,2);
			if ($parent&&$money>0){
				$datas = array();
				$datas['user_id'] = $user['id'];
				$datas['parent_id'] = $parent['id'];
				$datas['order_type'] = 1;
				$datas['order_id'] = $order['id'];
				$datas['order_sn'] = $order['sn'];
				$datas['order_money'] = $order['pay_money'];
				$datas['money'] = $money;
				$datas['brokerage_level'] = 1;
				$datas['ratio'] = $ratio;
				$datas['addtime'] = time();
				M('brokerage_record')->add($datas);
				//更改分销人员的佣金总额
				M('user')->where('id='.$user['parent_user_id'])->save(array('jie_money'=>$parent['jie_money']+$money));
				
				//写入上级人员的收入来源
				/*$items['user_id'] = $user['parent_user_id'];
				$items['money'] = $money;
				$items['recharge_type'] = 2;
				$items['type'] = 1;
				$items['title'] = "购买商品分佣，订单编号：".$order['sn'];
				$items['order_type'] = 1;
				$items['order_id'] = $order['id'];
				$items['addtime'] = time();
				M('account_record')->add($items);*/
			}
			
			//分销第二级
			$money2 = round($order['pay_money']*$ratio2,2);
			$parentId2 = getParentUser($parent['id']);
			//$parent2 = M('user')->where('id='.$parent['parent_user_id'])->find();
			if($parentId2>0&&$money2>0){
				$datas = array();
				$datas['user_id'] = $user['id'];
				$datas['parent_id'] = $parentId2;
				$datas['order_type'] = 1;
				$datas['order_id'] = $order['id'];
				$datas['order_sn'] = $order['sn'];
				$datas['order_money'] = $order['pay_money'];
				$datas['money'] = $money2;
				$datas['brokerage_level'] = 2;
				$datas['ratio'] = $ratio2;
				$datas['addtime'] = time();
				M('brokerage_record')->add($datas);
				//更改分销人员的佣金总额
				M('user')->where('id='.$parentId2)->setInc('jie_money',$money2);
			}
			
			//分销第三级
			$money3 = round($order['pay_money']*$ratio3,2);
			$parentId3 = getParentUser($parent['parent_user_id']);
			//$parent2 = M('user')->where('id='.$parent['parent_user_id'])->find();
			if($parentId3>0&&$money3>0){
				$datas = array();
				$datas['user_id'] = $user['id'];
				$datas['parent_id'] = $parentId3;
				$datas['order_type'] = 1;
				$datas['order_id'] = $order['id'];
				$datas['order_sn'] = $order['sn'];
				$datas['order_money'] = $order['pay_money'];
				$datas['money'] = $money3;
				$datas['brokerage_level'] = 3;
				$datas['ratio'] = $ratio3;
				$datas['addtime'] = time();
				M('brokerage_record')->add($datas);
				//更改分销人员的佣金总额
				M('user')->where('id='.$parentId3)->setInc('jie_money',$money3);
			}
			
		}
		
		//如果取消订单，需要判断支付类型
		
		$this->success('操作成功',U('/Member/Order/index'));
	}
	//详情页
	public function view($id)
	{
		$order=M('Order')->where('id='.$id)->find();
		$this->assign('order',$order);
		$user = M('user')->where('id='.$order['user_id'])->find();
		$grade = M('grade')->where('id='.$user['lv'])->getField('gzk');
		if($grade) $zk = $grade;
		if (!$zk) $zk = 1;
		//
		$useraddress=M('UserAddress')->where('id='.$order['address_id'])->find();
		$this->assign('useraddress',$useraddress);
		$statusarr[0]='待支付';
		$statusarr[1]='待发货';
		$statusarr[2]='已发货';
		$statusarr[3]='已完成';
		$statusarr[4]='交易取消';
		$this->assign('statusarr',$statusarr);
		$field	=	'p.title,p.market_price,p.image,d.*';
		$join	=	' as d inner join onethink_product as p on d.product_id=p.id';
		$map['order_id']	=	$id;
		$orderlist	=	M('OrderDetail')->field($field)->join($join)->where($map)->select();
		//echo M('OrderDetail')->getlastsql();exit;
		foreach ($orderlist as $k=>$v){
			$oldprice = $v['market_price'];
			if($v['product_attr']!=""){
				$attr = "";
				$at1 = explode(',', $v['product_attr']);
				foreach ($at1 as $item){
					$at2 = explode('=', $item);
					$attr .= $at2[1];
				}
				$oldprice = M('product_attr')->where('product_id='.$v['product_id'].' and attr_value="'.$attr.'"')->getField('oldprice');
			}
			$orderlist[$k]['market_price'] = round($oldprice*$zk,2);
		}
		
		if($order['depot_id']){
			$store = M('store')->where('id='.$order['depot_id'])->find();
			$this->assign('store',$store);
			
		}
		
		$this->assign('orderlist',$orderlist);
		$this->assign('order_active','active');
		$this->display();
	}
	/**
	 * 生成一个二维码
	 */
	public function orderQrcode(){
		Vendor('phpqrcode.phpqrcode');
		$orderId = I('order_id');
		$url = "http://m.chanmaojiechan.com/index.php?s=/Member/Index/hexiao/order_id/".$orderId;
		$object = new \QRcode();
		$object->png($url,false,4, 5,2);
	
	}
	/**
	 * 已退款订单列表
	 */
	public function drawback(){
		$userid = $_SESSION['user']['id'];
		$map['is_del'] = 0;
		$map['user_id'] = $userid;
		$map['status'] = 4;
		$map['is_drawback'] = 1;
		$list = M('order')->where($map)->select();
		foreach($list as $key=>$item){
			$map	=	array();
			$map['order_id'] = $item['id'];
			$join	=	' as d inner join onethink_product as p on d.product_id=p.id';
			$field	=	'p.image,p.title,d.*,p.market_price';
			$list[$key]['list'] = M('OrderDetail')->where($map)->field($field)->join($join)->order('id desc')->select();
			//echo M('OrderDetail')->getlastsql();exit;
			foreach($list[$key]['list'] as $k=>$v){
				
					$list[$key]['list'][$k]['pl']=2;
			}
		}
		$this->assign('list',$list);
// 		print_r($list);die;
		$this->display();
	}
	/**
	 * 退款操作
	 */
	public function tuikuan(){
		$id = (int)I('id');
		$userid = (int)$_SESSION['user']['id'];
		$m = M('order');
		$map['id'] = $id;
		$map['user_id'] = $userid;
		//查找订单是否存在
		$order = $m->where($map)->find();
		if (!$order){
			echo json_encode(array('status'=>-1,'msg'=>'订单不存在'));exit;
		}
		//$user = M('user')->where(array('id'=>$userid))->find();
		//产看订单是否已经支付
		if ($order['money']>0){
			//查找用户当前余额
			$money = M('user')->where(array('id'=>$userid))->getField('money');
			//增加收入来源
			$data = array();
			$data['user_id'] = $userid;
			$data['type'] = 1;
			$data['recharge_type'] = 2;
			$data['title'] = '订单退款，订单编号：'.$order['sn'];
			$data['money'] = $order['money'];
			$data['order_type'] = 1;
			$data['order_id'] = $order['id'];
			$data['addtime'] = time();
			M('account_record')->add($data);
			M('user')->where(array('id'=>$userid))->save(array('money'=>($money+$order['money'])));
			//减少积分
			/*$integral = M('integral_record')->where('user_id='.$order['user_id'].' and type=3 and orderid='.$order['id'])->getField('integral');
			$data = array();
			$data['user_id'] = $userid;
			$data['title'] = "订单退款，订单编号：".$order['sn'];
			$data['integral'] = $integral;
			$data['orderid'] = $order['id'];
			$data['addtype'] = 1;
			M('integral_record')->add($data);
			//会员积分减少
			
			
			//查看是否有订单的分佣记录
			$fenyong = M('brokerage_record')->where('user_id='.$userid.' and order_type=1 and order_id='.$order['id'])->find();
			if ($fenyong){
				M('user')->where('user_id='.$fenyong['parent_user_id'])->
			}*/
		}
		$rd = $m->where($map)->save(array('status'=>4,'is_drawback'=>1));
		if($rd){
			echo json_encode(array('status'=>1,'msg'=>'退款成功'));exit;
		}else{
			echo json_encode(array('status'=>-1,'msg'=>'退款失败'));exit;
		}
		
	}
}