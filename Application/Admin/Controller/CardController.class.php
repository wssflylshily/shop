<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Think\Page;

/**
 * 会员卡控制器
 * @author huajie <banhuajie@163.com>
 */
class CardController extends AdminController {
	
    public function _before_index(){

		$onarr[0]='未生成';
		$onarr[1]='已生成';
		$this->assign('onarr',$onarr);
    }
	//生成
	public function create($id)
	{
		$map['id']=$id;
		$card	=	M('Card')->where($map)->find();
		if(!$card)
		{
			$this->error('卡券不存在');
		}
		if($card['is_on']==1)
		{
			$this->error('已经生成过了');
		}
		$data['is_on']=1;
		M('Card')->where($map)->save($data);
		$data	=	array();
		$data['card_id']	=	$id;
		for($i=1;$i<=$card['num'];$i++)
		{
			$data['sn']=(time()+rand(0,999)).$i;
			M('CardDetail')->add($data);
		}
		$this->success('生成成功');
	}
	//明细
	function detail($id)
	{
		var_dump(Cookie('__forward__'));
		$map['id']=$id;
		$card	=	M('Card')->where($map)->find();
		if(!$card)
		{
			$this->error('卡券不存在');
		}
		if($card['is_on']==0)
		{
			$this->error('卡券尚未生成');
		}
		$this->assign('card',$card);
		$map	=	array();
		$map['card_id']	=	$id;
		$list	=	M('CardDetail')->where($map)->select();
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
		/*if($id<1)
		{
			$id=intval($_REQUEST['ids']);
			$map['id']=array('in',implode(',',$id));
		}
		else
		{*/
			$map['id']	=	$_REQUEST['id'];
		//}
		$detail	=	M('CardDetail')->where($map)->find();
		if(!$detail)
		{
			$this->error('数据不存在');
		}
		if($detail['user_id']>0)
		{
			$this->error('此卡已经被领取了');
		}
		$map	=	array();
		$map['id']=	$detail['card_id'];
		$card	=	M('Card')->where($map)->find();
		if(!$card)
		{
			$this->error('卡券不存在');
		}
		$cardcount=M('CardDetail')->where('card_id='.$map['id'])->count();
		$data['num']=$cardcount;
		M('Card')->where('id='.$card['id'])->save($data);
		/*if($card['shop_member_id']!=$this->shopmember['id'])
		{
			$this->error('卡券不属于您');
		}*/
		M('CardDetail')->where('id='.$id)->delete();
		$this->success('删除成功');
	}
}
