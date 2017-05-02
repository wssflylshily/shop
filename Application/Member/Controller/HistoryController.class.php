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
 * 历史数据
 */
class HistoryController extends HomeController {
	public function index()
	{
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$map['h.user_id']	=	$this->user['id'];
		
		$model	=	M('History');
		$field	=	'p.title,p.image,p.gprice,h.id,p.id as product_id';
		$join	=	' as h inner join onethink_product as p on h.product_id=p.id';
		//$this->_list($model,$map);
		$count = $model->field($field)->join($join)->where($map)->count ();
		//echo $model->getlastsql();exit;
		if ($count > 0) {
			$p = new \Think\Page($count, C('PAGE_NUM'));
			$list = $model->field($field)->join($join)->where($map)->order('h.id desc')->limit($p->firstRow.','.$p->listRows)->select();
			//echo $model->getlastsql();exit;
			$page = $p->show ();
			$this->assign ( 'list', $list );
		}
		$this->display();
	}
	//删除订单
	function delhistory()
	{
		$id	=	I('post.ids');
		$map['user_id']=$this->user['id'];
		$map['id']=array('in',$id);
		M('History')->where($map)->delete();
		$this->success('删除成功');
	}
}