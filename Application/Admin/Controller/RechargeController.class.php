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
 * 返利控制器
 * @author huajie <banhuajie@163.com>
 */
class RechargeController extends AdminController {
	public function _before_index()
	{
		$statusarr[0]='用户操作';
		$statusarr[1]='管理员操作';
		$this->assign('statusarr',$statusarr);
	}
	/**
	 * 充值记录列表
	 */
	public function index() {
		$map['c.type'] = 1;
		$map['c.is_pay'] = 1;
		$m = M('account_record');
		$count = $m->where('type=1 and is_pay=1')->count();
		$p = new \Think\Page($count, C('PAGE_NUM'));
		$join    =   ' as c inner join onethink_user as p on c.user_id=p.id';
	    $field  =   'c.*,p.login_user';
		$voList = $m->where($map)->join($join)->order('c.id DESC')->limit($p->firstRow.','.$p->listRows)->field($field)->select();
		$page = $p->show ();
		
		$this->assign ( 'list', $voList );
		$this->assign ( "page", $page );
		$this->assign ( 'totalcount', $count );
		$this->assign ( 'numPerPage', C('PAGE_NUM') );
		$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
		
		$this->display();
    }
    


	/**
    * 文档新增页面初始化
    * @author huajie <banhuajie@163.com>
    */
    public function add(){
        $this->display();
    }
    public function addChk(){
    	$db =M('account_record');
    	$user =M('user');
    	$uid =I('user_id');
    	$status =$user->where('id ='.$uid)->find();
    	if ($status=="") {
    		$this->error('该用户不存在！');

    	}else{
    		$map['user_id'] =$uid;
    		$addmoney =floatval(I('money'));
    		$oldmoney =floatval($status['money']);
    		$newmoney =$addmoney +$oldmoney;
    		var_dump($addmoney);
    		var_dump($oldmoney);
    		var_dump($newmoney);
    		$money =$user->where('id='.$uid)->setField('money',$newmoney);
    		$map['title'] =I('title');
    		$map['money'] =I('money');
    		$map['recharge_type'] = 1;
    		$map['addtime'] =time();
    		$r =$db->add($map);
    		if ($r>0) {
    			# code...
    			$this->success("充值成功！",U('index'));
    		}else{
    			$this->error();
    		}
    	}
    }
}
