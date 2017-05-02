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
class SpellController extends HomeController {
	
	public function delorder()
	{
		$this->updateSpellState();
		$id=	intval(I('post.id'));
		if($id<1)$this->error('error');
		M('spellorder')->where('id='.$id)->save(array('is_del'=>1));
		$this->success('删除成功');
	}
	public function index()
	{
		$this->updateSpellState();
		
		$website=M('WebSite')->find();
		$this->assign('website',$website);
		$class_nav['order']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$map['user_id']	=	$this->user['id'];
		$map['is_del']	=	0;
		$state	=	I('state');
		$status = "";
		if($state!=''){
			//$map['state']=	$state;
			switch($state)
			{
				case 2:
					$statustitle=	'拼团中';
					$statuscss[0]=	'active';
					$status = "0";
				break;
				case 3:
					$statustitle=	'已成团';
					$statuscss[1]=	'active';
					$status = "1";
				break;
				case 4:
					$statustitle=	'拼团失败';
					$statuscss[2]=	'active';
					$status = "2";
				break;
				
			}
		}else{
			$statuscss[-1]=	'active';
			$statustitle	='全部订单';
		}
		$this->assign ( 'statuscss', $statuscss );
		$this->assign ( 'statustitle', $statustitle );
		$this->assign('status',$status);
// 		$where = '1=1';
		$map = array();
		if($status!=""){
			$map['status'] = $status;
		}
		$spellids = M('spell_teams')->where($map)->getField('spell_id',true);
// 		print_r(M('spell_teams')->getLastsql());die;
		/*$model	=	M('spell');
		$where = "1=1";
		if($state!="") $where.=" and state=".$state;
		$spells = $model->where($where)->order('id DESC')->getField('id',true);*/
		
		$map = array();
		$map['spell_id'] = array('in',$spellids);
		$map['is_del'] = 0;
		$map['user_id'] = $this->user['id'];
		$list = M('spellorder')->where($map)->order('id desc')->limit(10)->select();
		
		foreach($list as $key=>$item){
			$list[$key]['spell'] = M('spell')->where('id='.$item['spell_id'])->find();
			$list[$key]['team'] = M('spell_teams')->where('id='.$item['team_id'])->find();
		}
		$this->assign ( 'list', $list );
		
// 		print_r($list);die;
		$statusarr[0]='待付款';
		$statusarr[1]='待发货';
		$statusarr[2]='待收货';
		$statusarr[3]='交易完成';
		$statusarr[4]='交易取消';
		$this->assign ( 'statusarr', $statusarr );
		$this->assign('order_active','active');
		$this->display();
	}
	
	/**
	 * ajax获取列表
	 */
	public function ajaxGetList(){
		$this->updateSpellState();
		$p = (int)I('page')?(int)I('page'):2;
		$per = 10;
		$start = ($p-1)*$per;
		$status = I('status');
		$map = array();
		if($status!=""){
			$map['status'] = $status;
		}
		$spellids = M('spell_teams')->where($map)->getField('spell_id',true);
		$map = array();
		$map['spell_id'] = array('in',$spellids);
		$map['is_del'] = 0;
		$map['user_id'] = $this->user['id'];
		$list = M('spellorder')->where($map)->order('id desc')->limit($start,$per)->select();
		
		foreach($list as $key=>$item){
			$list[$key]['spell'] = M('spell')->where('id='.$item['spell_id'])->find();
			$list[$key]['team'] = M('spell_teams')->where('id='.$item['team_id'])->find();
			if($item['status']==0){
				$list[$key]['status'] = '待付款';
			}elseif($item['status']==1){
				$list[$key]['status'] = '待发货';
			}elseif($item['status']==2){
				$list[$key]['status'] = '待收货';
			}if($item['status']==3){
				$list[$key]['status'] = '交易完成';
			}else{
				$list[$key]['status'] = '交易取消';
			}
		}
		if(!$list)$list = array();
		echo json_encode($list);exit;
	}
	
	//支付成功
	public function payok()
	{
		$this->updateSpellState();
		$order_id	=	intval(I('order_id'));								//订单ID
		//查找当前支付的订单信息
		$order = M('spellorder')->where('id='.$order_id)->find();
		$user = M('user')->where('id='.$order['user_id'])->find();
		if($order['status']==0){
			//更改当前订单的支付状态
			M('spellorder')->where('id='.$order_id)->save(array('paystate'=>1,'paytime'=>time(),'status'=>1));
		}
		
		//获取支付的商品id			
		$product_id =M('spellorder_detail')->where('order_id='.$order['id'])->getField('product_id');
		//$join_num = $spell['join_num'];		//参团人数
		//$join_num = $join_num+1;	
		//所有参加当前拼团的订单详情
		$arr =M('spellorder_detail')->where('product_id='.$product_id)->order('order_id ASC')->select();
		foreach ($arr as $key => $value) {
			$msg[] =M('spellorder')->where('status =1 AND id ='.$value['order_id'])->find();
			//$res[] =M('spellorder')->where('status =1 AND id ='.$value['order_id'])->save($ord);
		}	
		
		//增加参团人数
		M('spell')->where('id='.$order['spell_id'])->setInc('join_num',1);	
		$spell = M('spell')->where('id='.$order['spell_id'])->find();
		if ($spell['join_num']>=$spell['num']) {
			M('spell')->where('id='.$order['spell_id'])->save(array('state'=>3));
			//参团人数等于拼团需求人数,则拼团成功
			$ord['status'] = 1;
			
		}else{
			//参团人数未达到拼团需求人数
			$ord['status'] = 0;
			//查看当前的拼团是否已经到期
			$product = M('product')->where('id='.$product_id)->find();
			$now = date('Y-m-d');
			//拼团结束时间与现在时间做比较，查看是否过期
			
			
		}
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
		$row=	M('spellorder')->where($map)->find();
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
		$this->updateSpellState();
		$id	=	intval(I('id'));
		$status	=	intval(I('status'));
		$order=	M('spellorder')->where('id='.$id)->find();
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
		M('spellorder')->where('id='.$id)->save($data);
		if ($status==3){
			$user = M('user')->where('id='.$order['usre_id'])->find();
			$jifenrat = getPayRatio();
			$jifen = round($jifenrat*($order['money']),2);
			if ($jifen) {
				M('user')->where('id='.$order['user_id'])->save(array('integral'=>$user['integral']+$jifen));
				//添加积分记录
				$item['user_id'] = $order['user_id'];
				$item['title'] = "参加拼团，订单编号：".$order['sn'];
				$item['integral'] = $jifen;
				$item['type'] = 4;
				$item['orderid'] = $order['id'];
				$item['addtime'] = time();
				M('integral_record')->add($item);
			}
			//获取分佣比例
			$ratio = getBrokerage();//一级分佣比例
			$ratio2 = getBrokerageTwo(); 		//二级分佣比例
			$ratio3 = getBrokerageThree(); 		//三级分佣比例
			
			$money = round($order['money']*$ratio,2);
			$parent = M('user')->where('id='.$user['parent_user_id'])->find();
			if($parent&&$money>0){
				//增加分佣明细
				$item['parent_id'] = $user['parent_user_id'];
				$item['user_id'] = $order['user_id'];
				$item['order_type'] = 2;
				$item['order_id'] = $order['id'];
				$item['order_sn'] = $order['sn'];
				$item['order_money'] = $order['money'];
				$item['money'] = $money;
				$item['brokerage_level'] = 1;
				$item['ratio'] = $ratio;
				$item['addtime'] = time();
				M('brokerage_record')->add($item);
			
				//更改分销人员的账户余额和佣金总额
				M('user')->where('id='.$user['parent_user_id'])->save(array('jie_money'=>$parent['jie_money']+$money));
				//写入收入来源
				/*$items['user_id'] = $user['parent_user_id'];
				$items['money'] = $money;
				$items['recharge_type'] = 2;
				$items['type'] = 1;
				$items['title'] = "拼团分佣，订单编号：".$order['sn'];
				$items['order_type'] = 2;
				$items['order_id'] = $order['id'];
				$items['addtime'] = time();
				M('account_record')->add($items);*/
			}

			//分销第二级
			$money2 = round($order['pay_money']*$ratio2,2);
			$parentId2 = getParentUser($parent['id']);
			//$parent2 = M('user')->where('id='.$parent['parent_user_id'])->find();
			if($parentId2&&$money2>0){
				$datas = array();
				$datas['user_id'] = $user['id'];
				$datas['parent_id'] = $parentId2;
				$datas['order_type'] = 2;
				$datas['order_id'] = $order['id'];
				$datas['order_sn'] = $order['sn'];
				$datas['order_money'] = $order['money'];
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
			if($parentId3&&$money3>0){
				$datas = array();
				$datas['user_id'] = $user['id'];
				$datas['parent_id'] = $parentId3;
				$datas['order_type'] = 2;
				$datas['order_id'] = $order['id'];
				$datas['order_sn'] = $order['sn'];
				$datas['order_money'] = $order['money'];
				$datas['money'] = $money3;
				$datas['brokerage_level'] = 3;
				$datas['ratio'] = $ratio3;
				$datas['addtime'] = time();
				M('brokerage_record')->add($datas);
				//更改分销人员的佣金总额
				M('user')->where('id='.$parentId3)->setInc('jie_money',$money3);
			}
		}
		
		$this->success('操作成功',U('/Member/Spell/index'));
	}
	//详情页
	public function view($id)
	{
		$this->updateSpellState();
		$order=M('spellorder')->where('id='.$id)->find();
		$this->assign('order',$order);
		$spell = M('spell')->where('id='.$order['spell_id'])->find();
		$this->assign('spell',$spell);
		//
		$useraddress=M('UserAddress')->where('id='.$order['address_id'])->find();
		$this->assign('useraddress',$useraddress);
		$statusarr[0]='待付款';
		$statusarr[1]='待发货';
		$statusarr[2]='待收货';
		$statusarr[3]='已完成';
		//$statusarr[4]='交易取消';
		/*$statusarr[0]='待支付';
		$statusarr[1]='待发货';
		$statusarr[2]='已发货';
		$statusarr[3]='已完成';
		$statusarr[4]='交易取消';*/
		$this->assign('statusarr',$statusarr);
		$field	=	'p.title,p.market_price,p.image,d.*';
		$join	=	' as d inner join onethink_product as p on d.product_id=p.id';
		$map['order_id']	=	$id;
		$orderlist	=	M('spellorder_detail')->field($field)->join($join)->where($map)->select();
		//echo M('OrderDetail')->getlastsql();exit;
		$this->assign('orderlist',$orderlist);
		$this->assign('order_active','active');
		$this->display();
	}
}