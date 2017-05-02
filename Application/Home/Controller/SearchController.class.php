<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;

class SearchController extends HomeController {
	//清空
	function emptyall()
	{
		unset($_SESSION['keywordlist']);
	}
	//搜索首页
	function pageindex()
	{
		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->display();
	}
	function index()
	{
		cookie('forward',$_SERVER['REQUEST_URI']);
		$model	=	M('Product');
		$orderstr=	'id desc';
		$share	=	intval(I('get.share'));
		$map	=	array();
		$map['status']=1;
		if($share>0)
		{
			$map['share_money']=array('gt',0);
		}
		$this->assign('share',$share);
		$keywords=	I('keywords');
		if(!empty($keywords))
		{
			$map['title']	=	array('like','%'.$keywords.'%');
			$flag=false;
			if(isset($_SESSION['keywordlist']))
			{
				$keywordslist=unserialize($_SESSION['keywordlist']);
				foreach($keywordslist as $item)
				{
					if($item==$keywords)
					{
						$flag=true;
					}
				}
			}
			if(!$flag)
			{
				$keywordslist[]=$keywords;
			}
			$_SESSION['keywordlist']=serialize($keywordslist);
		}
		$this->assign('keywords',$keywords);
		$category_id=intval(I('id'));
		$this->assign('category_id',$category_id);
		
		$cateids = M('category')->where('status=1')->getField('id',true);
		$map['category_id'] = array('in',$cateids);
		
		/*if($category_id>0)
		{
			//$map['category_id']=$category_id;
			$categorylist=M('Category')->where('pid='.$category_id)->select();
			$cat_ids[]=$category_id;
			foreach($categorylist as $item)
			{
				$cat_ids[]=$item['id'];
			}
			$map['category_id']=array('in',implode(',',$cat_ids));
		}
		$min_price	=	intval(I('min_price'));
		$max_price	=	intval(I('max_price'));
		if($min_price>0)
		{
			$map['gprice']=array('egt',$min_price);
		}
		if($max_price>0)
		{
			if($min_price>0)
			{
				$map['gprice'] = array(array('egt',$min_price),array('elt',$max_price)) ;
			}
			else
			{
				$map['gprice']=array('elt',$max_price);
				//$map['gprice']=array('elt',$max_price);
			}
		}
		*/
		$order=intval(I('order'));
		$desc = I('desc');
		$this->assign('order',$order);
		if($desc=='')$desc='desc';
		elseif($desc=='desc') $desc='asc';
		elseif($desc=='asc') $desc='desc';
		$this->assign('desc',$desc);
		switch($order)
		{
			case 1://销量最高
				$orderstr='sell_num '.$desc.',id '.$desc.'';
			break;
			case 2://价格
				$orderstr='gprice '.$desc.',id '.$desc.'';
			break;
			case 3://最新
				$orderstr='id '.$desc.'';
			break;
			default://综合排序
				$orderstr='order_num '.$desc.',id '.$desc.'';
		}
		$list=M('Product')->where($map)->order($orderstr)->limit(10)->select();
// 		file_put_contents("kld.txt", M('Product')->getLastsql());
		//echo M('Product')->getlastsql();exit;
		$this->assign('list',$list);
		//获取一级分类
		$onecatelist=M('Category')->field('id,title')->where('pid=0')->select();
		$this->assign('onecatelist',$onecatelist);
		
// 		$this->assign('min_price',$min_price);
// 		$this->assign('max_price',$max_price);
// 		print_r($desc);die;
		$this->display();
	}
	/**
	 * ajax获取商品列表
	 */
	public function ajaxPage(){
		$page = (int)I('page');
		$per = 10;
		$star = ($page-1)*$per;
		$model	=	M('Product');
		$orderstr=	'id desc';
		$share	=	intval(I('share'));
		$map	=	array();
		$map['status']=1;
		
		if($share>0){
			$map['share_money']=array('gt',0);
		}
		$keywords=	I('keywords');
		if(!empty($keywords)){
			$map['title']	=	array('like','%'.$keywords.'%');
			$flag=false;
			if(isset($_SESSION['keywordlist']))
			{
				$keywordslist=unserialize($_SESSION['keywordlist']);
				foreach($keywordslist as $item){
					if($item==$keywords){
						$flag=true;
					}
				}
			}
			if(!$flag){
				$keywordslist[]=$keywords;
			}
			$_SESSION['keywordlist']=serialize($keywordslist);
		}
		$cateids = M('category')->where('status=1')->getField('id',true);
		$map['category_id'] = array('in',$cateids);
		/*$category_id=intval(I('category_id'));
		if($category_id>0){
			//$map['category_id']=$category_id;
			$categorylist=M('Category')->where('pid='.$category_id)->select();
			$cat_ids[]=$category_id;
			foreach($categorylist as $item){
				$cat_ids[]=$item['id'];
			}
			$map['category_id']=array('in',implode(',',$cat_ids));
		}
		$min_price	=	intval(I('min_price'));
		$max_price	=	intval(I('max_price'));
		if($min_price>0){
			$map['gprice']=array('egt',$min_price);
		}
		if($max_price>0){
			if($min_price>0){
				$map['gprice'] = array(array('egt',$min_price),array('elt',$max_price)) ;
			}else{
				$map['gprice']=array('elt',$max_price);
			}
		}*/
		
		$order=intval(I('order'));
		$desc=I('desc');
		if($desc=='')$desc='desc';
		/*elseif($desc=='desc') $desc='asc';
		elseif($desc=='asc') $desc='desc';*/
		switch($order){
			case 1://销量最高
				$orderstr='sell_num '.$desc.',id '.$desc.'';
				break;
			case 2://价格
				$orderstr='gprice '.$desc.',id '.$desc.'';
				break;
			case 3://最新
				$orderstr='id '.$desc.'';
				break;
			default://综合排序
				$orderstr='order_num '.$desc.',id '.$desc.'';
		}
		$list=M('Product')->where($map)->order($orderstr)->limit($star,$per)->select();
// 		file_put_contents('00.txt', M('Product')->getLastsql());
		if(!$list)$list=array();
		//echo M('Product')->getlastsql();exit;
		//获取一级分类
		$onecatelist=M('Category')->field('id,title')->where('pid=0')->select();
		$this->ajaxReturn($list);
	}
	
	public function getsecondlist()
	{
		header('content-type:application/json;charset=utf8');
		$category_id	=	intval(I('post.category_id'));
		$list=M('Category')->field('id,title')->where('pid='.$category_id)->select();
		if(!$list)$list=array();
		echo json_encode($list);
	}


}
