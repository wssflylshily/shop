<?php
namespace Admin\Controller;
use OT\DataDictionary;

/**
 * 优惠券
 */
class VoucherController extends AdminController {

	public function _filter(&$map)
	{
		//$map['shop_member_id']=$this->shopmember['id'];
	}
    public function _before_index(){
		$statusarr[0]='未生成';
		$statusarr[1]='已生成';
		$this->assign('statusarr',$statusarr);
    }
	//生成
	public function create($id)
	{
		$map['id']=$id;
		$coupon	=	M('Coupon')->where($map)->find();
		if(!$coupon)
		{
			$this->error('优惠券不存在');
		}
		if($coupon['status']==1)
		{
			$this->error('已经生成过了');
		}
		$data['status']=1;
		M('Coupon')->where($map)->save($data);
		$data	=	array();
		$data['coupon_id']	=	$id;
		for($i=1;$i<=$coupon['num'];$i++)
		{
			$data['sn']=(time()+rand(0,999)).$i;
			M('CouponDetail')->add($data);
		}
		$this->success('生成成功');
	}
	function detaillist()
	{
		$plyarr[0]='未使用';
		$plyarr[1]='已使用';
		$this->assign('plyarr',$plyarr);
		$is_ply	=	intval(I('is_ply'));
		if($is_ply!='')$map['is_ply']=$is_ply;
		$model	=	M('CouponDetail');
		$this->_list($model,$map);
		$this->display();
	}
	//明细
	function detail($id)
	{

		$map['id']=$id;
		$coupon	=	M('Coupon')->where($map)->find();
		if(!$coupon)
		{
			$this->error('优惠券不存在');
		}
		if($coupon['status']==0)
		{
			$this->error('优惠券尚未生成');
		}
		$this->assign('coupon',$coupon);
		$map	=	array();
		$map['coupon_id']	=	$id;
		$list	=	M('CouponDetail')->where($map)->select();
		$this->assign('list',$list);
		$plyarr[0]='未使用';
		$plyarr[1]='已使用';
		$this->assign('plyarr',$plyarr);
		$this->assign('top_card_class','active');
		$this->assign('left_card_list','active');
		$this->display();
	}
	//删除明细
	public function deldetail()
	{
		$id	=	intval($_REQUEST['id']);
		$map['id']=	$_REQUEST['id'];
		$detail	=	M('CouponDetail')->where($map)->find();
		if(!$detail)
		{
			$this->error('数据不存在');
		}
		if($detail['user_id']>0)
		{
			$this->error('此卡已经被领取了');
		}
		$map	=	array();
		$map['id']=	$detail['coupon_id'];
		$coupon	=	M('Coupon')->where($map)->find();
		if(!$coupon)
		{
			$this->error('优惠券不存在');
		}
		M('CouponDetail')->where('id='.$id)->delete();
		$couponcount=M('CouponDetail')->where('coupon_id='.$map['id'])->count();
		$data['num']=$couponcount;
		M('Coupon')->where('id='.$card['id'])->save($data);
		/*if($card['shop_member_id']!=$this->shopmember['id'])
		{
			$this->error('卡券不属于您');
		}*/
		$this->success('删除成功');
	}
}