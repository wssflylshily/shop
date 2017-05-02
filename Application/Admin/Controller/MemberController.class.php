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
 * 会员管理控制器
 * @author huajie <banhuajie@163.com>
 */
class MemberController extends AdminController {
	public $model_name='User';
	public function _before_index()
	{
		$typearr[0]='普通';
		$typearr[1]='VIP';
		$this->assign('typearr',$typearr);
		$registarr[0] = "管理员添加";
		$registarr[1] = "手机";
		$registarr[2] = "微信";
		$this->assign('registarr',$registarr);
		$statusarr[0] = "禁用";
		$statusarr[1] = "启用";
		$this->assign('statusarr',$statusarr);
		$sql = "UPDATE onethink_user SET card_num=(10000000+id)";
		M()->execute($sql);
		$users = M('user')->order('id DESC')->select();
		foreach($users as $k=>$v){
			updateUserLevel($v['id']);
		}
		
	}
	public function _before_add()
	{
		$arealist=M('Area')->select();
		$this->assign('arealist',$arealist);
	}
	public function _before_edit()
	{
		$arealist=M('Area')->select();
		$this->assign('arealist',$arealist);

		$user_id=I('get.id');
		$map['parent_user_id']=$user_id;
		$list = M('user')->where($map)->field('id,login_user,name,mobile')->order('id DESC')->select();
		foreach ($list as $k=>$v){
			$where['parent_id'] = $user_id;
			$where['user_id'] = $v['id'];
			$list[$k]['total'] = M('brokerage_record')->where($where)->getField("sum(money)");
		}
		$this->assign('list',$list);
		
		$addrlist = M('user_address')->where('user_id='.$user_id.' and status=1')->select();
		$this->assign('addrlist',$addrlist);
// 		var_dump($list);die;
// 		print_r($list);die;
       // $this->_list(M('User'), $map);
        
        //查询当前用户的地址列表
        /*$where['user_id'] = $user_id;
        $addrlist = M('user_address')->where($where)->order('is_default DESC')->select();
        $this->assign('addrlist',$addrlist);*/
        
	}
	/**
	 * 会员列表
	 */
	public function index(){
		$m = M('user');
		$stat = I('time_start');
		$end = I('time_end');
		$title = I('title');
		$map = array();
		$map['status'] = array('neq',-1);
		$excel_url = U('exportList');
		if ($stat){
			$start = strtotime($stat);
			$map['register_time'] = array('egt',$start);
			$excel_url .= "&stime=".$start;
		}
		if ($end){
			$endt = strtotime($end);
			$map['register_time'] = array('elt',$endt);
			$excel_url .= "&etime=".$endt;
		}
		if ($stat&&$end){
			$start = strtotime($stat);
			$endt = strtotime($end);
			$map['register_time'] = array('between',$start.",".$endt);
		}
		if ($title){
			$map['login_user|name|mobile'] = array('like',"%$title%");
			$excel_url .= "&title=".$title;
		}
		
		$count = $m->where($map)->count();
		$p = new \Think\Page($count, C('PAGE_NUM'));
		$voList = $m->order('id DESC')->where($map)->limit($p->firstRow.','.$p->listRows)->select();
		foreach ($voList as $k=>$v){
			$voList[$k]['grade'] = M('grade')->where('id='.$v['lv'])->getField('gname');
		}
		$page = $p->show ();
		
		$this->assign ( 'list', $voList );
		$this->assign ( "page", $page );
		$this->assign ( 'totalcount', $count );
		$this->assign ( 'numPerPage', C('PAGE_NUM') );
		$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
		$this->assign('excel_url',$excel_url);
		
		
		$this->display();
	}
	/**
	 * 设置一条或者多条数据的状态
	 */
	public function setStatus(){
	
		$ids    =   I('request.ids');
		$status =   I('request.status');
		if(empty($ids)){
			$this->error('请选择要操作的数据');
		}
	
		$map['id'] = array('in',$ids);
		switch ($status){
			case -1 :
				M('user')->where($map)->delete();
				$where['user_id'] = array('in',$ids);
				M('order')->where($where)->save(array('is_del'=>1));
				M('spellorder')->where($where)->save(array('is_del'=>1));
				$this->success('删除成功');
				//$this->delete('user', $map, array('success'=>'删除成功','error'=>'删除失败'));
				break;
			case 0  :
				$this->forbid('user', $map, array('success'=>'禁用成功','error'=>'禁用失败'));
				break;
			case 1  :
				$this->resume('user', $map, array('success'=>'启用成功','error'=>'启用失败'));
				break;
			default :
				$this->error('参数错误');
				break;
		}
	}
	
	/**
	 * 导出excel表格
	 */
	public function exportList(){
		$ids    =  rtrim(I('ids'),',');
		$title = I('title');
		$stime = I('stime');
		$etime = I('etime');
		$map = array();
		$map['status'] = array('neq',-1);
		if (!empty($ids)){
			$map['id'] = array('in',$ids);
		}
		if ($title){
			$map['login_user|name|mobile'] = array('like','%'.$title.'%');
		}
		if ($stime) $map['register_time'] = array('egt',$stime);
		if ($etime) $map['register_time'] = array('elt',$etime);
		if ($stime&&$etime) $map['register_time'] = array('between',$stime.','.$etime);
		$m = M('user');
		$list = $m->where($map)->order('id DESC')->select();
// 		print_r($list);die;
		$str = '
		<table border="1">
		<tr style="background-color:#ccffcc;min-height:30px;">
		<th align="center">ID</th>
		<th align="center">会员卡号</th>
		<th align="center">用户名</th>
		<th align="center">姓名</th>
		<th align="center">手机号</th>
		<th align="center">会员等级</th>
		<th align="center">积分</th>
		<th align="center">余额</th>
		<th align="center">注册类型</th>
		<th align="center">注册时间</th>
		<th align="center">状态</th>
		</tr>
		';
		foreach ($list as $k => $v) {
			//查看会员的等级名称
			$grade = M('grade')->where('id='.$v['lv'])->getField('gname');
			//判断会员注册类型
			$registype = "";
			if($v['regist_type']==0){
				$registype = '管理员添加';
			}elseif ($v['regist_type']==1){
				$registype = '手机';
			}elseif ($v['regist_type']==2){
				$registype = '微信';
			}
			
			if (($k%2)==0){
				$str .='<tr align="center" style="background-color:#fdffcc;min-height:30px;">';
			}else{
				$str .='<tr align="center" style="min-height:30px;">';
			}
			$str .= '
			<td>'.$v['id'].'&nbsp;</td>
			<td>'.$v['card_num'].'</td>
			<td>'.$v['login_user'].'</td>
			<td>'.$v['name'].'</td>
			<td>'.$v['mobile'].'</td>
			<td>'.$grade.'</td>
			<td>'.$v['integral'].'</td>
			<td>'.$v['money'].'</td>
			<td>'.$registype.'</td>';
			if($v['register_time']){
				$str .= '<td>'.date("Y-m-d",$v['register_time']).'</td>';
			}else{
				$str .= '<td></td>';
			}
			if($v['status']==1){
				$str .= '<td>启用</td>';
			}elseif($v['status']==0){
				$str .= '<td>禁用</td>';
			}
			$str .= '</tr>';
		}
			
		$str .="</table>";
// 		print_r($str);die;
		//输出
		header('Content-Length: '.strlen($str));
		header("Content-type:application/vnd.ms-excel;charset=UTF-8");
		header("Content-Disposition:filename=members.xls");
		echo $str;
	}
	//升级
	public function upgrade()
	{
		$ids	=	$_POST['ids'];//I('post.ids');
		$map['id']=	array('in',implode(',',$ids));
		$data['type']=1;
		M('User')->where($map)->save($data);
		//echo M('User')->getlastsql();exit;
		$this->success('操作成功');
	}
	//取消升级
	public function cancelupgrade()
	{
		$ids	=	$_POST['ids'];//I('post.ids');
		$map['id']=	array('in',implode(',',$ids));
		$data['type']=0;
		M('User')->where($map)->save($data);
		$this->success('操作成功');
	}

	//会员等级
	public function grade()
	{

		$db =M('grade');
		$info =$db->order('glv ASC')->select();

		foreach ($info as $key => $value) {
			# code...
			if ($value['glimit']) {
				# code...
			}
			$arr[] =$value['glimit'];
		}
		$this->assign('info',$info);
		$this->display();
	}


	public function addgrade(){
		$id =I('id');
		if ($id!='') {
			# code...
			$db=M('grade');
			$info =$db->where('id='.$id)->find();
			$this->assign('info',$info);
		}
		$this->display();
	}

	public function insertgrade(){
		$db =D('grade');
		$id =I('id');
		if (I('gname')=='') {
				# code...
			$this->error('等级名称不能为空！');
			}
		if ($id) {
			# code...
			$data['glimit'] =I('glimit');
			$data['gname'] =I('gname');
			$data['glv'] =I('glv');
			$data['gzk'] =I('gzk');
			$rel = $db->where('id='.$id)->save($data);
			if ($rel!=0) {
				# code...
				$this->success('修改成功',U('grade'));
			}
		}else{

			$data['glimit'] =I('glimit');
			$data['gname'] =I('gname');
			$data['glv'] =I('glv');
			$rel = $db->add($data);
			if ($rel>0) {
				# code...
				$this->success('添加成功！',U('grade'));
			}
		}
		
	}
	//删除会员等级
	public function delgrade(){
		$db =M('grade');
		$id =I('id');
		$rel =$db->where('id= '.$id)->delete();
		if ($rel>0) {
			# code...
			$this->success('删除成功！');
		}else{
			$this->error('删除失败！');
		}
	}



	/**
	 * 门店管理列表
	 */
	public function store(){
		$db = M('store');
		$map['status'] = 1;
		$count = $db->where($map)->count();
		$p = new \Think\Page($count, 20);
		$voList = $db->where($map)->limit($p->firstRow.','.$p->listRows)->select();
		//$info =$db->where($map)->select();
		$page = $p->show ();
		
		$this->assign ( 'list', $voList );
		$this->assign ( "page", $page );
		//$this->assign('info',$info);
		$this->display();
	}

	/**
	 * 新增门店页面
	 */
	public function addstore(){
		$id =I('id');
		//查询地区
		$areas = M('areas')->where('pid=0')->select();
		$this->assign('areas',$areas);
		if ($id!='') {
			# code...
			$db =M('store');
			$info =$db->where('id='.$id)->find();
			$this->assign('info',$info);
			$city = M('areas')->where('pid='.$info['area_0'])->select();
			$this->assign('city',$city);
			$area = M('areas')->where('pid='.$info['area_1'])->select();
			$this->assign('area',$area);
		}
		$this->display();
	}

	/**
	 * 新增门店处理
	 */
	public function insertstore(){
		$db =M('store');
		$id =I('id');
		$data['sname'] =I('sname');
		$data['sadd'] =I('sadd');
		$data['mobile'] =I('mobile');
		$data['sjingdu'] =I('sjingdu');
		$data['sweidu'] =I('sweidu');
		$data['image'] = I('image');
		$data['area_0'] = (int)I('area_0');
		$data['area_1'] = (int)I('area_1');
		$data['area_2'] = (int)I('area_2');
		file_put_contents('0.txt', $data['area_0']."\r\n".$data['area_1']."\r\n".$data['area_2']);
		if ($id!='') {
			# code...
			$rel = $db->where('id='.$id)->save($data);
			if ($rel!=0) {
				# code...
				$this->success('修改成功',U('store'));
			}
		}else{
			
			$rel = $db->add($data);
			if ($rel>0) {
				# code...
				$this->success('添加成功！',U('store'));
			}
		}
		
	}

	//核销员
	public function hexiao(){
        $model = D('hexiao');
		$this->_list($model);
		$this->display();
    
	}

	//添加核销员页面
	public function addhexiao(){
		$db =M('hexiao');
		$id =I('id');
		if ($id!="") {
			# code...
			$pagename ="编辑核销员";
		}else{
			$pagename ="新增核销员";
		}
		$this->assign('pagename',$pagename);
		$info =$db->where('id ='.$id)->find();
		$this->assign('info',$info);
		$store = M('store')->order('id ASC')->select();
		$this->assign('store',$store);
		$this->display();
	}

	//添加核销员处理
	public function inserthexiao(){
		if (IS_POST) {
			# code...
			$hexiao 	=M('hexiao');
			$admin_id 	=I('admin_id');
			$card 		=I('card');
			$name 		=I('name');
			$store_id 	=I('store_id');
			if ($admin_id=="") {
				# code...
				$this->error('核销员id不能为空！');
			}
			$admin =M('user')->where('id ='.$admin_id)->find();
			if ($admin =='') {
				# code...
				$this->error('该用户不存在！');
			}
			if ($card=="") {
				# code...
				$this->error('核销员工号不能为空！');
			}
			if ($name=="") {
				# code...
				$this->error('核销员姓名不能为空！');
			}
			$data['admin_id']	= $admin_id;
			$data['card'] 		= $card;
			$data['name'] 		= $name;
			$data['store_id']   = $store_id;
			$rel =$hexiao->add($data);
			if ($rel>0) {
				# code...
				$this->success('添加核销员成功！',U('hexiao'));
			}
		}
		

	}
	
	/**
	 * 分佣明细列表
	 */
	public function brokerageList(){
		$usersid = M('user')->getField('id',true);
		$userid = (int)I('user_id');
		$m = M('brokerage_record');
		$map = array();
		$map['parent_id'] = $userid;
		$map['user_id'] = array('in',$usersid);
		$count = $m->where($map)->count();
		$p = new \Think\Page($count, C('PAGE_NUM'));
		$voList = $m->order('id DESC')->where($map)->limit($p->firstRow.','.$p->listRows)->select();
		foreach ($voList as $k=>$v){
			$user = M('user')->where('id='.$v['user_id'])->getField('name');
			if(!$user) $user = M('user')->where('id='.$v['user_id'])->getField('login_user');
			$voList[$k]['user'] = $user;
		}
		
		$page = $p->show ();
		
		$this->assign ( 'list', $voList );
		$this->assign ( "page", $page );
		
		$this->display();
	}
	

	//删除自提点
	public function delstore(){
		$db =M('store');
		$id =I('id');
		$rel =$db->where('id= '.$id)->save(array('status'=>0));
		if ($rel>0) {
			# code...
			$this->success('删除成功！',U('store'));
		}else{
			$this->error('操作失败');
		}
	}
	
	/**
	 * 删除核销员
	 */
	public function delHexiao(){
		$m = M('hexiao');
		$id = (int)I('id');
		$map['id'] = $id;
		$info = $m->where($map)->find();
		if(!$info){
			$this->error('核销员不存在');
		}
		$res = $m->where($map)->delete();
		if($res){
			$this->success('删除成功');
		}else{
			$this->error('操作失败');
		}
	}
}
