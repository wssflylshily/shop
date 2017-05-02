<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: yangweijie <yangweijiester@gmail.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 优选快报管理
 * @author yuanshao
 */
class NewsflashController extends AdminController {
	/**
	 * 快报列表
	 */
	public function index(){
		$count = M('newsflash')->count();
		$p = new \Think\Page($count, C('PAGE_NUM'));
		$list = M('newsflash')->order('oid asc,id asc')->limit($p->firstRow.','.$p->listRows)->select();
		$page = $p->show ();
		$this->assign ( 'list', $list );
		$this->assign ( "page", $page );
		$this->assign ( 'totalcount', $count );
		$this->assign ( 'numPerPage', C('PAGE_NUM') );
		$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
		
		$this->display();
	}
	/**
	 * 添加/修改
	 */
	public function doedit(){
		$id = (int)I('id');
		$data['title'] = I('title');
		$data['link_url'] = I('link_url');
		$data['oid'] = (int)I('oid');
		if (!$id){
			//新增
			$data['addtime'] = time();
			$res = M('newsflash')->add($data);
			if ($res){
				$this->success('新增成功',U('Newsflash/index'));
			}else{
				$this->error('新增失败');
			}
		}else{
			//修改
			//查找信息
			$map['id'] = $id;
			$m = M('newsflash');
			$info = $m->where($map)->find();
			if (!$info){
				$this->error('快报信息不存在');
			}
			if ($m->where($map)->save($data)){
				$this->success('编辑成功',U('Newsflash/index'));
			}else{
				$this->error('编辑失败');
			}
		}
	}
	
}
