<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: yangweijie <yangweijiester@gmail.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;

/**
 * 订单管理
 * @author yuanshao
 */
class OrderController extends AdminController {
    /**
     * 显示左边菜单，进行权限控制
     * @author huajie <banhuajie@163.com>
     */
//     protected function getMenu(){
//         //获取动态分类
//         $cate_auth  =   AuthGroupModel::getAuthCategories(UID);	//获取当前用户所有的内容权限节点
//         $cate_auth  =   $cate_auth == null ? array() : $cate_auth;
//         $cate       =   M('Category')->where(array('status'=>1))->field('id,title,pid,allow_publish')->order('pid,sort')->select();

//         //没有权限的分类则不显示
//         if(!IS_ROOT){
//             foreach ($cate as $key=>$value){
//                 if(!in_array($value['id'], $cate_auth)){
//                     unset($cate[$key]);
//                 }
//             }
//         }

//         $cate           =   list_to_tree($cate);	//生成分类树

//         //获取分类id
//         $cate_id        =   I('param.cate_id');
//         $this->cate_id  =   $cate_id;

//         //是否展开分类
//         $hide_cate = false;
//             $hide_cate  =   true;
// //var_dump($cate);exit;
//         //生成每个分类的url
//         foreach ($cate as $key=>&$value){
//             $value['url']   =   'Product/index?cate_id='.$value['id'];
//             if($cate_id == $value['id'] && $hide_cate){
//                 $value['current'] = true;
//             }else{
//                 $value['current'] = false;
//             }
//             if(!empty($value['_child'])){
//                 $is_child = false;
//                 foreach ($value['_child'] as $ka=>&$va){
//                     $va['url']      =   'Product/index?cate_id='.$va['id'];
//                     if(!empty($va['_child'])){
//                         foreach ($va['_child'] as $k=>&$v){
//                             $v['url']   =   'Product/index?cate_id='.$v['id'];
//                             $v['pid']   =   $va['id'];
//                             $is_child = $v['id'] == $cate_id ? true : false;
//                         }
//                     }
//                     //展开子分类的父分类
//                     if($va['id'] == $cate_id || $is_child){
//                         $is_child = false;
//                         if($hide_cate){
//                             $value['current']   =   true;
//                             $va['current']      =   true;
//                         }else{
//                             $value['current'] 	= 	false;
//                             $va['current']      =   false;
//                         }
//                     }else{
//                         $va['current']      =   false;
//                     }
//                 }
//             }
//         }
// 		//var_dump($cate);exit;
//         $this->assign('nodes',      $cate);
//         $this->assign('cate_id',    $this->cate_id);

//         //获取面包屑信息
//         $nav = get_parent_category($cate_id);
//         $this->assign('rightNav',   $nav);

//         //获取回收站权限
//         $show_recycle = $this->checkRule('Admin/article/recycle');
//         $this->assign('show_recycle', IS_ROOT || $show_recycle);
//         //获取草稿箱权限
//         $this->assign('show_draftbox', C('OPEN_DRAFTBOX'));
//     }

	public function _filter(&$map)
	{
		$status=I('status');
		if($status!='')$map['status']=$status;
	}

	public function _before_index()
	{
        //获取左边菜单
        // $this->getMenu();
		$statusarr[0]='待付款';
		$statusarr[1]='待发货';
		$statusarr[2]='已发货';
		$statusarr[3]='已完成';
		$statusarr[4]='已取消';
		$this->assign('statusarr',$statusarr);
		$typearr[0]='送货上门';
		$typearr[1]='门店自提';
		$this->assign('typearr',$typearr);
        $userids = M('user')->getField('id',true);
        $map['user_id'] = array('in',$userids);
        $map['is_del'] = 0;
		$statusnum['total']=M('Order')->where($map)->count();
        $map['is_drawback'] = 0;
		$list	=	M('Order')->where($map)->select();
		$statusnum[0]=0;
		$statusnum[1]=0;
		$statusnum[2]=0;
		$statusnum[3]=0;
		$statusnum[4]=0;
		//$statusnum['total']=count($list);
		foreach($list as $item)
		{
			$statusnum[$item['status']]++;
		}
		$this->assign('statusnum',$statusnum);
	}

	//
	 public function index() {
		$model_name	=	$this->model_name?$this->model_name:CONTROLLER_NAME;
        $model = D($model_name);
        $userid = I('user_id');
       
        $status = I('status');
        $isdraw = I('isdraw');
       	$map = array();
       	$map['is_del'] = 0;
        $id = I('title');
        if (!empty($id)) $map['sn'] = array('like',"%$id%");
        $stat = I('time_start');
        $end = I('time_end');
        if ($stat){
        	$start = strtotime($stat);
        	$map['addtime'] = array('egt',$start);
        }
        if ($end){
        	$endt = strtotime($end);
        	$map['addtime'] = array('elt',$endt);
        }
        if ($stat&&$end){
        	$start = strtotime($stat);
        	$endt = strtotime($end);
        	$map['addtime'] = array('between',$start.",".$endt);
        }
        if ($status!="") {
        	$map['status'] = (int)$status;
        }
        $userids = M('user')->getField('id',true);
        $map['user_id'] = array('in',$userids);
        $where['user_id'] = array('in',$userids);
        if ($userid!=""){
        	$map['user_id'] = $userid;
        }
        if($status!=""&&$isdraw=="") $map['is_drawback'] = 0;
       
        if ($isdraw!="") $map['is_drawback'] = $isdraw;
        $count = M('order')->where($map)->count();
        
        $p = new \Think\Page($count, 20);
        $list = M('order')->limit($p->firstRow.','.$p->listRows)->where($map)->order('id DESC')->select();
        foreach ($list as $k=>$v){
        	$list[$k]['name'] = M('user')->where('id='.$v['user_id'])->getField('name');
        }
        
        //已退款订单数量
        $where['is_drawback'] = 1;
        $where['is_del'] = 0;
        $drawbacknum = M('order')->where($where)->count();
        $this->assign('drawbacknum',$drawbacknum);
        
        $page = $p->show ();
        $this->assign ( 'list', $list );
        $this->assign ( "page", $page );
        $this->assign ( 'totalcount', $count );
        $this->assign ( 'numPerPage', 20 );
        $this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
        
		$this->display();
    }


	//改变状态
	public function upstatus()
	{
		$order_id	=	intval(I('id'));
		$data['status']=intval(I('status'));
		if ($data['status']==2){
	        $data['sendtime'] = time();
        }
		$map['id']	=	$order_id;
		M('Order')->where($map)->save($data);
		if ($data['status']=='3') {
			# code...
			$this->enddeal($order_id);
		}
		
		$this->success('改变成功');
	}
	public function views()
	{  
        //获取左边菜单
        // $this->getMenu();
		$order_id=	intval(I('id'));
		$order=M('Order')->where('id='.$order_id)->find();
		$this->assign('order',$order);
		$list=M('OrderDetail')->where('order_id='.$order_id)->select();
		foreach($list as $key=>$item)
		{
			//$list[$key]['product'] = M('Product')->where('id='.$item['product_id'])->find();
			$product = M('Product')->where('id='.$item['product_id'])->find();
			$list[$key]['title'] = $product['title'];
			
		}
		$this->assign('list',$list);
// 		print_r($list);die;
		$typearr[0]='送货上门';
		$typearr[1]='门店自提';
		$this->assign('typearr',$typearr);
		//送货地址
		$address	=	M('UserAddress')->where('id='.$order['address_id'])->find();
		$this->assign('address',$address);
		/*if($address)
		{
			$area=M('Area')->where('id='.$address['area_id'])->find();
			$this->assign('area',$area);
		}*/
		//自提点
		$store	=	M('store')->where('id='.$order['depot_id'])->find();
		$this->assign('store',$store);
		
		//查看订单所得积分
		$jifen = M('integral_record')->where('type=3 and orderid='.$order_id)->getField('integral');
		$this->assign('integral',$jifen);
		//
		$invoicearr[0]='否';
		$invoicearr[1]='是';
		$this->assign('invoicearr',$invoicearr);
		$this->display();
	}


	//交易完成
	public function enddeal($order_id ="1"){

		$grade =M('grade');
		$user =M('user');
		$info =M('Order')->where('id ='.$order_id)->find();
		$userid =$info['user_id'];
		$ordercost =floatval($info['money']);

		$userpoints =$user->where('id='.$userid)->getField('points');
		$gradeinfo =$grade->order('id ASC')->select();
		$userpoints =floatval($userpoints)+$ordercost;
		$gradeArr =$grade->order('glv ASC')->select();
		foreach ($gradeArr as $key => $value) {
			# code...
			if ($userpoints>$gradeArr[$key]['glimit']) {
				# code...
				M('user')->where('id='.$userid)->setField('glv',$gradeArr[$key]['glv']);
			}
		}
		$rel =$user->where('id='.$userid)->setField('points',$userpoints);
	}
}
