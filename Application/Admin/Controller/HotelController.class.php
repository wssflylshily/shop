<?php
namespace Admin\Controller;
use OT\DataDictionary;

/**
 * 联盟酒店管理类
 */
class HotelController extends AdminController {

	public function _filter(&$map)
	{
		//$map['shop_member_id']=$this->shopmember['id'];
	}
    public function _before_index(){
		
    }
    /**
     * 酒店列表
     */
    public function index(){
    	$count = M('hotel')->count();
    	$p = new \Think\Page($count, C('PAGE_NUM'));
    	$list = M('hotel')->order('oid asc,id asc')->limit($p->firstRow.','.$p->listRows)->select();
    	$page = $p->show ();
    	$this->assign ( 'list', $list );
    	$this->assign ( "page", $page );
    	$this->assign ( 'totalcount', $count );
    	$this->assign ( 'numPerPage', C('PAGE_NUM') );
    	$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
    	
    	$this->display();
    }
    /**
     * 编辑页面
     */
    public function edit(){
    	$id = (int)I('id');
    	$info = M('hotel')->where('id='.$id)->find();
    	$this->assign('vo',$info);
    	$picid = explode(',', $info['imglist']);
    	$map['id'] = array('in',$picid);
    	$piclist = M('picture')->where($map)->select();
    	$this->assign('piclist',$piclist);
    	
    	$this->display();
    }
    /**
     * 新增酒店信息操作
     */
    public function doadd(){
    	$data = array();
    	$data['title'] = I('title');
    	$data['image'] = I('image');
    	$data['logo'] = I('logo');
    	$data['imglist'] = I('imglist');
    	$data['cookstyle'] = I('cookstyle');
    	$data['brief'] = I('brief');
    	$data['content'] = I('content');
    	$data['address'] = I('address');
    	$data['lat'] = I('sweidu');
    	$data['lng'] = I('sjingdu');
    	$data['phone'] = I('phone');
    	$data['oid'] = (int)I('oid');
     	$data['addtime'] = time();
    	$res = M('hotel')->add($data);
    	if ($res){
    		$this->success('操作成功',U('Hotel/index'));
    	}else{
    		$this->error('操作失败');
    	}
    }
    /**
     * 执行修改操作
     */
    public function doedit(){
    	$id = (int)I('id');
    	$m = M('hotel');
    	$map['id'] = $id;
    	if (!$id) {
    		$this->error('参数错误');
    	}
    	//查找酒店信息
    	$info = $m->where($map)->find();
    	if (!$info) {
    		$this->error('酒店信息不存在');
    	}
    	$data['title'] = I('title');
    	$data['image'] = I('image');
    	$data['logo'] = I('logo');
    	$data['imglist'] = I('imglist');
    	$data['cookstyle'] = I('cookstyle');
    	$data['brief'] = I('brief');
    	$data['content'] = I('content');
    	$data['address'] = I('address');
    	$data['lat'] = I('sweidu');
    	$data['lng'] = I('sjingdu');
    	$data['phone'] = I('phone');
    	$data['oid'] = (int)I('oid');
    	if ($m->where($map)->save($data)){
    		$this->success('编辑成功',U('Hotel/index'));
    	}else{
    		$this->error('编辑失败');
    	}
    }
	
}