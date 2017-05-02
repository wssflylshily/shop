<?php
namespace Admin\Controller;
use OT\DataDictionary;

/**
 * 优惠券
 */
class CouponController extends AdminController {

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
		$is_ply	=	I('is_ply');
		$map = array();
		if($is_ply!='')$map['is_ply'] = $is_ply;
		$model	=	M('CouponDetail');
		//$join = "onethink_user as u on u.id=d.user_id";
		//$field = "d.*,u.name";
		$count = $model->where($map)->count();
		$p = new \Think\Page($count, 20);
		$list = $model->limit($p->firstRow.','.$p->listRows)->where($map)->select();
		foreach ($list as $k=>$v){
			$list[$k]['name'] = M('user')->where('id='.$v['user_id'])->getField('name');
		}
		
		$page = $p->show ();
		$this->assign ( 'list', $list );
		$this->assign ( "page", $page );
		$this->assign ( 'totalcount', $count );
		$this->assign ( 'numPerPage', 20 );
		$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
// 		$this->_list($model,$map);
		$this->display();
	}
	
	/**
	 * 优惠券信息
	 */
	public function info(){
		$id = (int)I('id');
		if (!$id){
			$this->error('优惠券不存在');
		}
		$info = M('coupon')->where('id='.$id)->find();
		if (!$info) {
			$this->error('优惠券不存在');
		}
		$grade = M('grade')->where('id='.$info['grade_id'])->getField('gname');
		$this->assign('grade',$grade);
		$this->assign('vo',$info);
		
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
		$status = I('status');
		if ($status=="0") $map['user_id'] = 0;
		if($status==1) $map['user_id'] = array('gt',0);
		$isply = I('isply');
		if (!empty($isply)) $map['is_ply'] = $isply;
// 		var_dump($status);die;
		$count = M('CouponDetail')->where($map)->count();
		$p = new \Think\Page($count, 20);
		$list	=	M('CouponDetail')->where($map)->limit($p->firstRow.','.$p->listRows)->select();
		foreach ($list as $k=>$v){
			$user = M('user')->where('id='.$v['user_id'])->find();
			if($user['name'])$list[$k]['name'] = $user['name'];
			else $list[$k]['name'] = $user['login_user'];
// 			 = M('user')->where('id='.$v['user_id'])->getField('name');
		}
		$page = $p->show ();
		$this->assign('list',$list);
		$this->assign ( "page", $page );
		$this->assign ( 'totalcount', $count );
		$this->assign ( 'numPerPage', 20);
		$this->assign ( 'currentPage',$p->firstRow/20+1);
		
		$plyarr[0]='未使用';
		$plyarr[1]='已使用';
		$this->assign('plyarr',$plyarr);
		$this->assign('top_card_class','active');
		$this->assign('left_card_list','active');
		$this->assign('id',$id);
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
		M('Coupon')->where('id='.$coupon['id'])->save($data);
		/*if($card['shop_member_id']!=$this->shopmember['id'])
		{
			$this->error('卡券不属于您');
		}*/
		$this->success('删除成功');
	}


	//添加优惠券
	public function adddetail(){
		$db =M('coupon');
		$this->catevalue =$db->where('status =1')->select();
		$this->display();
	}
	public function insdetail(){
		$db =M('coupon_detail');
		$data['sn'] =I('sn');
		$data['coupon_id'] =I('coupon_id');
		$rel =$db->where('sn ='.$data['sn'] )->find();

		if($rel>0){
			$this->error('卡券已存在！');
		}else{
			$r =$db->add($data);
			$this->success('添加卡券成功',U('detaillist'));
		}

	}
}