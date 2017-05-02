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
 * 银行卡
 */
class BankController extends HomeController {
	public function _filter(&$map)
	{
		$map['user_id']	=	$_SESSION['user']['id'];
		$map['status'] = 1;
	}
	public function _before_index()
	{
		$typelist=M('BankType')->order('order_num desc,id asc')->select();
		foreach($typelist as $item)
		{
			$typearr[$item['id']]=$item;
		}
		$this->assign('typearr',$typearr);
	}
	public function _before_add()
	{
		$map	=	array();
		$type_id=	intval(I('type_id'));
		if($type_id>0)
		{
			$map['id']=$type_id;
		}
		$typelist=M('BankType')->where($map)->order('order_num desc,id asc')->select();
		$this->assign('typelist',$typelist);
	}
	public function _before_edit()
	{
		$typelist=M('BankType')->order('order_num desc,id asc')->select();
		foreach($typelist as $item)
		{
			$typearr[$item['id']]=$item;
		}
		$this->assign('typearr',$typearr);
		$this->assign('typelist',$typelist);
		$type_id	=	intval(I('type_id'));
		$this->assign('type_id',$type_id);
	}
	
	
	public function saveBankinfo(){
		$id = (int)I('id');
		$data['name'] = I('name');
		$data['card_num'] = I('card_num');
		$data['type_id'] = I('type_id');
		$data['mobile'] = I('mobile');
		$userid = $_SESSION['user']['id'];
		if ($id){
			if (M('bank')->where('id='.$id)->save($data)){
				$this->success('保存成功');
			}else{
				$this->error('保存失败');
			}
		}else{
			$data['user_id'] = $userid;
			if (M('bank')->add($data)){
				$this->success('添加成功');
			}else{
				$this->error('添加失败');
			}
		}
	}
	
	//选择银行卡
	public function seltype()
	{
		$typelist=M('BankType')->order('order_num desc,id asc')->select();
		$this->assign('typelist',$typelist);
		$type	=	intval(I('type'));//0增加 1编辑
		$this->assign('type',$type);
		$id		=	intval(I('id'));//编辑id
		$this->assign('id',$id);
		$this->display();
	}
	
	/**
	 * 删除银行卡
	 */
	public function delCard(){
		$cardid = rtrim(I('ids'),',');
		$ids = explode(',', $cardid);
		$map['id'] = array('in',$ids);
		$map['user_id'] = $_SESSION['user']['id'];
		//查找是否有信息
		$m = M('bank');
		$card = $m->where($map)->select();
		if (!$card){
			echo json_encode(array('status'=>-1,'msg'=>'银行卡不存在'));exit;
		}
		if ($m->where($map)->setField('status',0)){
			echo json_encode(array('status'=>1,'msg'=>'银行卡删除成功'));exit;
		}else{
			echo json_encode(array('status'=>-1,'msg'=>'银行卡删除失败'));exit;
		}
		
	}
	
}