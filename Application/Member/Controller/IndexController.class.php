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
use Home\Tool\JssdkController;
/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {
	protected $wappid = "wx73f8f21829bef9c6";
    protected $wappsecret = "00ea7e3072f302d457e88b7402dc6429";

	var $backurl='javascript:history.go(-1);';
	var $x_title='我的';

	//个人中心首页
	public function index(){
// 		print_r($_SESSION['user']['id']);die;
		$this->checkMobile();
		$jssdk = new JssdkController();
		$signPackage = $jssdk->getSignPackage();
		$this->assign('signPackage',$signPackage);
	
		$userid = $_SESSION['user']['id'];
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$map = array();
		$map['id'] =$_SESSION['user']['id'];
		$user=M('user')->where($map)->find();
// 		print_r($user);die;
		$user['level'] = M('grade')->where('id='.$user['lv'])->getField('glv');
		if (!$user){
			$_SESSION['user'] = null;
			$this->error('账户不存在',U('/Home/Index/index'));
		}
		if ($user['status']==0){
			$_SESSION['user'] = null;
			$this->error('您的账户被禁用，请联系客服',U('/Home/Index/index'));
		}
		$hexiao =M('hexiao')->where('admin_id ='.$userid)->find();
		if ($hexiao!="") {
			# code...
			$this->is_hexiao =1;
		}
		//判断用户当天是否已经签到过了
		$is_sign = 0;
		$startime = strtotime(date('Y-m-d'));
		$endtime = strtotime(date('Y-m-d')." 23:59:59");
		if ($user['signtime']>$startime&&$user['signtime']<($endtime+1)){
			$is_sign = 1;
		}
		$this->assign('is_sign',$is_sign);
	
		$this->grade =M('grade')->where('id ='.$user['lv'])->getField('gname');
		$this->user =$user;
	
		//查询用户订单数量
		$map = array();
		$map['user_id'] = $userid;
		$map['is_del'] = 0;
		$map['is_drawback'] = 0;
		$map['status'] = 0;
		//待付款订单数量
		$num0 = M('order')->where($map)->count();
		$this->assign('num0',$num0);
		//代发货订单数量
		$map['status'] = 1;
		$num1 = M('order')->where($map)->count();
		$this->assign('num1',$num1);
		//待收货订单数量
		$map['status'] = 2;
		$num2 = M('order')->where($map)->count();
		$this->assign('num2',$num2);
		//待评价订单数量
		$map['status'] = 3;
		$orderid = M('order')->where($map)->getField('id',true);//所有状态已收货的订单的id
		$where['order_id'] = array('in',$orderid);
		//已评价的订单
		$eva = M('evaluate')->where($where)->select();
		if ($eva){
			$idss = "";
			foreach ($eva as $k=>$v){
				$idss .= $v['order_id'].",";
			}
			$ids = rtrim($idss,',');
			$map['id'] = array('not in',$ids);
		}
		$num3 = M('order')->where($map)->count();
		$this->assign('num3',$num3);
		//已退款订单数量
		$map['is_drawback'] = 1;
		$map['status'] = 4;
		$num4 = M('order')->where($map)->count();
		$this->assign('num4',$num4);
	
		$this->assign('member_active','active');
		$this->display();
	}
	public function checkMobile(){
		$user = M('User')->where('id='.$this->user['id'])->find();
		//判断用户是否绑定手机号
		if($user&&!$user['mobile']){
			$this->redirect('/Member/Index/addmobile');
		}
	}
	public function upmobile()
	{
		$user=M('User')->where('id='.$this->user['id'])->find();
		if ($user['mobile']){
			$title = "修改手机号";
			$state = 1;
		}else{
			$title = "绑定手机号";
			$state = 0;
		}
		$this->assign('title',$title);
		$this->assign('state',$state);
		$this->assign('user',$user);
		$this->display();
	}
	
	/**
	 * 绑定手机号
	 */
	public function addmobile(){
		$user = M('user')->where('id='.$_SESSION['user']['id'])->find();
		if (IS_POST){
			$mobile = I('mobile');
			$sms = I('sms');
			$pass = I('pass');
			$repass = I('repass');
			if (!$mobile){
				$this->error('手机号不能为空');
			}
			if (!$sms){
				$this->error('请输入短信验证码');
			}
			if (!$pass){
				$this->error('请输入密码');
			}
			if (!$repass){
				$this->error('请确认密码');
			}
			if ($pass!=$repass){
				$this->error('两次输入的密码不同，请确认');
			}

			if($sms!=$_SESSION['mobile_code'])
			{
				$this->error('验证码不正确');
			}
			/*$info = M('user')->where('login_user="'.$mobile.'" or mobile="'.$mobile.'"')->find();
			if ($info){
				$this->error('手机号已被使用');
			}*/
			$data = array();
			$data['mobile'] = $mobile;
			$data['login_pass'] = md5($pass);
			if(cookie('forward'))$url = cookie('forward');
			else $url = U('/Member/Index/index');
			if(M('user')->where('id='.$user['id'])->save($data)){
				$this->success('绑定成功',$url);
			}else{
				$this->error('绑定失败');
			}
		}
		
		$this->display();
	}

	public function checkcode()
	{
		$code=I('post.code');
		$verify = new \Think\Verify();
		$r=$verify->check($code);
		if($r)
		{
			$this->success(1);
		}
		else
		{
			$this->error(0);
		}
	}
	//上传头像
	public function uploadimg()
	{
		$data['image']=$this->getOneUpload('img');
		$map['id']=$this->user['id'];
		M('User')->where($map)->save($data);
		//var_dump($map);exit;
		/*$this->ajaxReturn(array(
			'img' => $data['img']
		));*/
		echo json_encode(array('img'=>$data['image']));exit;
		//echo M('Student')->getlastsql();exit;
		//$this->success('上传成功');
	}

	public function verify()
	{
		$config =    array(
			'fontSize'		=>	14,    // 验证码字体大小
			'length'		=>	4,     // 验证码位数
			'useNoise'		=>	false, // 关闭验证码杂点
			'useCurve'		=>	false,
			'imageW'		=>	77,
			'imageH'		=>	32,
		);
		$Verify = new \Think\Verify($config);
		$Verify->entry();
	}
	//发送短消息
	public function sendsms()
	{
		$target = "http://cf.lmobile.cn/submitdata/Service.asmx/g_Submit";
		$mobile = $_POST['mobile'];
		//$send_code = $_POST['send_code'];

		$mobile_code = random(6,1);
		if(empty($mobile)){
			$this->error('手机号码不能为空');
			//exit('手机号码不能为空');
		}

		/*if(empty($_SESSION['send_code']) or $send_code!=$_SESSION['send_code']){
			//防用户恶意请求
			exit('请求超时，请刷新页面后重试');
		}*/
		$str = "您的验证码是：".$mobile_code."（5分钟内有效），请勿告诉他人【蜜罐儿优选】";
		//替换成自己的测试账号,参数顺序和wenservice对应
		$post_data = "sname=dlssbw10&spwd=lMk3X0Uu&scorpid=&sprdid=1012818&sdst=".$mobile."&smsg=".rawurlencode($str);
		$gets = Post($post_data, $target);
		//密码可以使用明文密码或使用32位MD5加密
		$result = xml_to_array($gets);
		if ($result['CSubmitState']['state']==0) {
			$_SESSION['mobile'] = $mobile;
			$_SESSION['mobile_code'] = $mobile_code;
			$rs = array('status'=>1,'info'=>$mobile_code);
		}else{
			$rs = array('status'=>-1,'info'=>'发送失败');
		}
		//echo $gets['SubmitResult']['msg'];
	}

	//基本信息
	public function baseinfo()
	{
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$this->assign('x_title','基本信息');
		$this->backurl='/Member';
		$model=M('User');
		$map['id']=$this->user['id'];
		$user=$model->where($map)->find();
		$user['image']=str_replace('./','/',$user['image']);
		//var_dump($user);exit;
		$this->assign('user',$user);
		//var_dump($_SESSION);exit;
		$sexarr[0]='保密';
		$sexarr[1]='男';
		$sexarr[2]='女';
		$this->assign('sexarr',$sexarr);
		$arealist=M('Area')->select();
		foreach($arealist as $item)
		{
			$areaarr[$item['id']]=$item['title'];
		}
		$areaarr[0]='未知';
		$this->assign('areaarr',$areaarr);
		$this->assign('backurl',$this->backurl);
		$this->assign('member_active','active');
		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->display();
	}
	public function edit()
	{
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$this->assign('x_title','我的');
		$this->backurl='/Member/Index/baseinfo';
		$this->assign('backurl',$this->backurl);
		$model=M('User');
		$map['id']=$this->user['id'];
		$user=$model->where($map)->find();
		//var_dump($student);exit;
		$this->assign('user',$user);
		$type=intval(I('type'));
		switch($type)
		{
			case 0://姓名
				$field_name='name';
				$placeholder='请输入姓名';
				$ts='姓名格式不正确';
				$minlen = '2';
				$maxlen = '20';
				$title = "姓名";
			break;
			case 1://邮箱
				$field_name='zip_code';
				$placeholder='请输入邮政编码';
				$ts='';
				$minlen = '';
				$maxlen = '邮编格式不正确';
				$title = "邮编";
			break;
			case 2://邮箱
				$field_name='paypwd';
				$placeholder='请输入支付密码';
				$ts='6-10个字符，可由中英文、数字组成';
				$minlen = '6';
				$maxlen = '10';
				$title = "余额支付密码";
			break;
			case 3://手机
				$field_name='mobile';
				$placeholder='填写手机号';
				$ts='';
			break;
		}
		$user	=	M('user')->where('id='.$this->user['id'])->find();
		//$this->assign('student',$student);
		if(empty($user[$field_name]))
		{
			$value='';
		}
		else
		{
			$value=$user[$field_name];
		}
		//var_dump($user);exit;
		//echo $filed_name;exit;
		$this->assign('save',1);
		$this->assign('value',$value);
		$this->assign('field_name',$field_name);
		$this->assign('placeholder',$placeholder);
		$this->assign('ts',$ts);
		$this->assign('title',$title);
		$this->assign('minlen',$minlen);
		$this->assign('maxlen',$maxlen);
		//echo $this->backurl;exit;
		$this->assign('backurl',$this->backurl);
		$this->assign('member_active','active');
		$this->display();
	}
	public function updatemobile()
	{
		$sms			=	I('post.sms');
		if(empty($sms))
		{
			$this->error('请输入验证码');
		}
		if($sms!=$_SESSION['mobile_code'])
		{
			$this->error('验证码不正确');
		}
		$data['mobile']	=	I('post.mobile');
		$map['id']		=	$this->user['id'];
		M('User')->where($map)->save($data);
		$this->success('修改成功');
	}
	public function save()
	{
		$model=D('User');
		$url = cookie('forward');
		if ($model->create())
		{
			$model->save();
			$this->success('保存成功',$url);
		}
		else
		{
			$error=$model->getError();
            $this->error(empty($error) ? '未知错误！' : $error);
		}
	}
	
	/**
	 * 余额支付密码
	 */
	public function editpaypwd(){
		$userid = $_SESSION['user']['id'];
		$url = cookie('forward');
		
		$map['id'] = $userid;
		$user = M('user')->where($map)->find();
		$this->assign('user',$user);
		if(IS_POST){
			$oldpwd = I('oldpwd');
			$pwd1 = I('pwd1');
			$pwd2 = I('pwd2');
			if ($user['paypwd']&&$oldpwd=="") $this->error('原密码不能为空');
			if ($user['paypwd']&&$oldpwd!=$user['paypwd']){
				$this->error('原密码不正确');
			}
			if ($pwd1=="")$this->error('新密码不能为空');
			if($pwd2=="")$this->error('确认密码不能为空');
			if ($pwd1!=$pwd2)$this->error('两次输入的密码不同，请确认');
			if($user['paypwd']==$pwd2)$this->error('新密码不能与原密码相同');
			if (M('user')->where($map)->save(array('paypwd'=>$pwd1))){
				$this->success('保存成功',$url);
			}else{
				$this->error('保存失败',$url);
			}
		}
		
		$this->display();
	}

	public function sex()
	{
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$this->assign('x_title','编辑性别');
		$model=M('User');
		$map['id']=$this->user['id'];
		$user=$model->where($map)->find();
		$this->assign('user',$user);
		$this->assign('backurl',$this->backurl);
		$this->assign('member_active','active');
		$this->display();
	}

	public function area()
	{
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		if(IS_POST)
		{
			$data['area_id']	=	intval(I('post.area_id'));
			M('User')->where('id='.$this->user['id'])->save($data);
			$this->success('修改成功');
		}
		$arealist	=	M('Area')->select();
		$this->assign('arealist',$arealist);
		$this->assign('x_title','编辑地址');
		$model=M('User');
		$map['id']=$this->user['id'];
		$user=$model->where($map)->find();
		foreach($arealist as $item)
		{
			if($user['area_id']==$item['id'])
			{
				$user['area_name']=$item['title'];
				break;
			}
		}
		$this->assign('user',$user);
		$this->assign('backurl',$this->backurl);
		$this->assign('member_active','active');
		$this->display();
	}
	//编辑密码
	public function editpass()
	{
		$user = M('user')->where('id='.$_SESSION['user']['id'])->find();
		$this->assign('user',$user);
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$this->assign('member_active','active');
		$this->display();
	}
	//修改密码
	public function updatepass()
	{
		$old_pass	=	I('post.old_pass');
		$new_pass	=	I('post.new_pass');
		$new_pass1	=	I('post.newpass1');
		//var_dump($this->user);exit;
		$user	=	M('User')->where('id='.$this->user['id'])->find();
		if($user['login_pass']&&md5($old_pass)!=$user['login_pass'])
		{
			$this->error('原密码不正确');
		}
		if ($new_pass!=$new_pass1){
			$this->error('两次输入的密码不同');
		}
		$data['login_pass']=md5($new_pass);
		M('User')->where('id='.$this->user['id'])->save($data);
		$this->success('修改成功',U('baseinfo'));
	}
	
	//二维码
	public function qrcode()
	 {
		$wappid = $this->wappid;
        $wappsecret = $this->wappsecret;
        $uid = $_SESSION['user']['id']?$_SESSION['user']['id']:0;
        $resurl = "http://www.miguaner.cn//";
        $state = $uid.$resurl;
        $redirect = urlencode("http://www.miguaner.cn/index.php?s=/Member/Login/wback.html");
        $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={$wappid}&redirect_uri={$redirect}&response_type=code&scope=snsapi_userinfo&state={$state}#wechat_redirect";
        $this->assign('reurl',$url);
		$this->assign('user_id',$_SESSION['user']['id']);
		$this->assign('member_active','active');
		$this->display();
	}
	//帐户余额
	public function balance()
	{
		$map['id']=$this->user['id'];
		$user=M('User')->where($map)->find();
		$this->assign('user',$user);
		//获取充值明细
		$map	=	array();
		$map['user_id']	=	$this->user['id'];
		$map['type']	=	1;
		$map['is_pay'] = 1;
		$list=M('AccountRecord')->where($map)->order('id desc')->select();
		
		$this->assign('list',$list);
		$this->assign('member_active','active');
		$this->display();
	}
	//支出明细
	public function outlist()
	{
		$userid = $this->user['id'];
		$map['id'] = $userid;
		$user=M('User')->where($map)->find();
		$this->assign('user',$user);
		//查询支出明细
		$map = array();
		$map['user_id'] = $userid;
		$map['type'] = 0;
		$list = M('AccountRecord')->where($map)->order('id desc')->limit(10)->select();
		
		/*$map	=	array();
		$map['user_id']	=	$this->user['id'];
		$map['status']	=	array('gt',0);
		$list=M('Order')->where($map)->order('id desc')->select();*/
		$this->assign('list',$list);
// 		print_r(M('AccountRecord')->getLastsql());die;
		$this->assign('member_active','active');
		$this->display();
	}
	/**
	 * ajax加载更多的收入、支出列表
	 */
	public function ajaxGetMoreIncome(){
		$p = (int)I('page')?(int)I('page'):2;
		$per = 10;
		$start = ($p-1)*$per;
		$type = (int)I('type');
		$map['user_id'] = $this->user['id'];
		$map['type'] = $type;
		if($type==1){
			$map['is_pay'] = 1;
		}
		
		$list = M('AccountRecord')->where($map)->order('id desc')->limit($start,$per)->select();
		foreach($list as $k=>$v){
			$list[$k]['time'] = date('Y-m-d',$v['addtime']);
		}
		if (!$list) $list = array();
		
		echo json_encode($list);
	}
	
	//充值
	public function recharge()
	{
		/*if(IS_POST)
		{
			$money	=	I('post.money');
			if($money<1)
			{
				$this->error('充值金额必须大于0');
			}
			$data['user_id']=	$this->user['id'];
			$data['title']	=	'充值所得';
			$data['money']	=	$money;
			$data['type']	=	1;
			$data['recharge_type']=I('post.recharge_type');
			$data['addtime']=	time();
			M('AccountRecord')->add($data);
			M('User')->where('id='.$this->user['id'])->setInc('money',$money);
			$this->success('充值成功');
		}*/
		$map['id']=$this->user['id'];
		$user=M('User')->where($map)->find();
		$this->assign('user',$user);
		$this->assign('member_active','active');
		$this->display();
	}
	/**
	 * 充值操作
	 */
	public function addRecharge(){
		$userid = $this->user['id'];
		$money	=	I('post.money');
		if($money<1){
			$res['status'] = -1;
			$res['info'] = "充值金额需大于1元";
			$this->ajaxReturn($res);exit;
		}
		$data['user_id']=	$userid;
		$data['title']	=	'充值所得';
		$data['money']	=	$money;
		$data['type']	=	1;
		$data['recharge_type'] = 0;
		$data['addtime']=	time();
		$recid = M('AccountRecord')->add($data);
		if ($recid){
			$res['status'] = 1;
			$res['id'] = $recid;
			$res['info'] = "保存成功";
			$this->ajaxReturn($res);exit;
		}else{
			$res['status'] = -1;
			$res['info'] = "保存失败";
			$this->ajaxReturn($res);exit;
		}
		//M('User')->where('id='.$this->user['id'])->setInc('money',$money);
	}
	/**
	 * 充值成功页面
	 */
	public function rechargeok(){
		$id = (int)I('id');
		//修改订单状态
		//M('AccountRecord')->where('id='.$id)->save(array('is_pay'=>1,'paytime'=>time()));
		$info = M('AccountRecord')->where('id='.$id)->find();
		$this->assign('info',$info);
		$user = M('user')->where('id='.$info['user_id'])->find();
		
		$jifenrat = getChargeRatio();
		$jifen = $jifenrat*$info['money'];
		//增加积分
		if ($jifen) M('user')->where('id='.$info['user_id'])->save(array('integral'=>$user['integral']+$jifen));
		//添加积分记录
		$data['user_id'] = $info['user_id'];
		$data['title'] = "会员充值，充值金额：".$info['money']."元";
		$data['integral'] = $jifen;
		$data['type'] = 5;
		$data['addtime'] = time();
		M('integral_record')->add($data);
		
		$this->display();
	}
	//已结佣金
	public function brokerage()
	{
		//获取充值明细
		$map	=	array();
		$map['user_id']	=	$this->user['id'];
		$list=M('BrokerageRecord')->where($map)->order('id desc')->select();
		$this->assign('list',$list);
		$user	=	M('User')->where('id='.$this->user['id'])->find();
		$this->assign('user',$user);
		$this->assign('member_active','active');
		$this->display();
	}
	//提现
	public function withdraw()
	{
		$limit = (int)M('integrate')->getField('withdraw_limit');
		$this->assign('limit',$limit);
		if(IS_POST)
		{
			$user	=	M('User')->where('id='.$this->user['id'])->find();
			$money	=	$user['money'];
			$data['bank_id']=	I('post.bank_id');
			$data['money']	=	I('post.money');
			$data['user_id']=	$this->user['id'];
			$data['status']	=	0;
			$data['addtime']=	time();
			if($data['money']>$money)
			{
				$this->error('余额不足');
			}
			if($data['money']<$limit){
				$this->error('提现金额不能小于'.$limit.'元');
			}
			$insert_id=M('BrokerageWithdrawRecord')->add($data);
			if($insert_id<1){
				$this->error('申请失败');
			}
			M('User')->where('id='.$this->user['id'])->setDec('money',$data['money']);
			$this->success('申请成功');
		}
		//获取银行卡类型
		$banktypelist=M('BankType')->select();
		foreach($banktypelist as $item)
		{
			$banktype[$item['id']]=$item['img'];
		}
		//获取用户银行卡列表
		$bank=M('Bank')->where('user_id='.$this->user['id'])->order('id desc')->find();
		$bankid = I('bank_id');
		if ($bankid){
			$bank = M('Bank')->where('id='.$bankid)->find();
		}
		if(!$bank)
		{
			redirect(U('Bank/add',array('tx'=>1)));
			//$this->error('请添加银行卡');
		}
		$this->assign('bank',$bank);
		$banktype=M('BankType')->where('id='.$bank['type_id'])->find();
		
		$this->assign('banktype',$banktype);
		$this->assign('member_active','active');
		$this->display();
	}
	/**
	 * 提现选择银行卡
	 */
	public function selectbank(){
		$userid = $_SESSION['user']['id'];
		$map['user_id'] = $userid;
		$map['status'] = 1;
		$list = M('bank')->where($map)->select();
		
		$this->assign('list',$list);
		$typelist=M('BankType')->order('order_num desc,id asc')->select();
		foreach($typelist as $item)
		{
			$typearr[$item['id']]=$item;
		}
		$this->assign('typearr',$typearr);
		
		$this->display();
	}
	//提现记录
	public function drawrecord()
	{
		$user	=	M('User')->where('id='.$this->user['id'])->find();
		$this->assign('user',$user);
		$statusarr[0]='审核中';
		$statusarr[1]='已打款';
		$statusarr[2]='已驳回';
		$this->assign('statusarr',$statusarr);
		$map	=	array();
		$map['user_id']	=	$this->user['id'];
		$list=M('BrokerageWithdrawRecord')->where($map)->order('id desc')->select();
		$this->assign('list',$list);
		$this->assign('member_active','active');
		$this->display();
	}
	
	//我的返利
	public function rebatelist()
	{
		$statusarr[0]='待返还';
		$statusarr[1]='已返还';
		$this->assign('statusarr',$statusarr);
		$map['id']=$this->user['id'];
		$user=M('User')->where($map)->find();
		$this->assign('user',$user);
		$status	=	intval(I('status'));
		$map	=	array();
		$map['user_id']	=	$this->user['id'];
		$map['status']	=	$status;	$list=M('RebateRecord')->where($map)->order('id desc')->select();
		$this->assign('list',$list);
		$this->assign('status',$status);
		$this->assign('member_active','active');
		$this->display();
	}
	//我的优惠券
	public function couponlist()
	{
		$field='c.*,d.id as did';
		$join=' as d inner join onethink_coupon as c on d.coupon_id=c.id';
		$map['d.user_id']	=	$this->user['id'];
		$map['d.is_ply']	=	0;
		$day	=	date('Y-m-d');
		$type	=	intval(I('type'));//0未过期 1已过期
		$this->assign('type',$type);
		if($type==0)
		{
			$map['c.end_date']=array('egt',$day);
		}
		else
		{
			$map['c.end_date']=array('lt',$day);
		}
		$list	=	M('CouponDetail')->field($field)->join($join)->where($map)->order('d.id desc')->select();
		//echo M('CouponDetail')->getlastsql();exit;
		$this->assign('list',$list);
		$this->assign('member_active','active');
		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->display();
	}


	/**
	 * 添加优惠券,用户领取优惠券
	 */
	public function addcouponlist(){
		$userid = $_SESSION['user']['id'];
		$id = I('id');
		//查看优惠券信息
		$info = M('coupon')->where('id='.$id)->find();
		//查看优惠券是否已领取完
		$list = M('coupon_detail')->where('user_id=0 and coupon_id='.$id)->select();
		if (!$list){
			$data = array('status'=>-1,'info'=>'优惠券已领取完');
			$this->ajaxReturn($data);exit;
		}
		$pernum = $info['pernum'];	//限制每人可领取的优惠券数量
		//查看用户已领取的优惠券数量
		$num = M('coupon_detail')->where('coupon_id='.$id.' and user_id='.$userid)->count();
		if ($pernum>0&&num>=$pernum){
			$data = array('status'=>-1,'info'=>'您领取的优惠券数量已达到上限');
			$this->ajaxReturn($data);exit;
		}
		if ($pernum==0&&$num>0){
			$data = array('status'=>-1,'info'=>'您已领取过优惠券');
			$this->ajaxReturn($data);exit;
		}
		$detail = M('coupon_detail')->where('user_id=0 and coupon_id='.$id)->find();
		$item['user_id'] = $userid;
		$item['addtime'] = time();
		$rs = M('coupon_detail')->where('id='.$detail['id'])->save($item);
		if ($rs){
			$data = array('status'=>1,'info'=>'领取成功');
			$this->ajaxReturn($data);exit;
		}else{
			$data = array('status'=>-1,'info'=>'领取失败');
			$this->ajaxReturn($data);exit;
		}
		
		/*$db =m('coupon_detail');
		$sn =I('sn');

		$info =$db ->where('sn ='.$sn)->find();
		if ($info>0) {
			# code...
			if ($info['user_id']>0) {
				# code...
				$data['msg'] ="卡号已被使用！";
				$data['status'] ="-1";
				$data['desc'] = "";
			}else{
				$map['user_id'] =$this->user['id'];
				$db->where('sn ='.$sn)->save($map);
				$data['msg'] ="卡券添加成功！";
				$data['status'] ="1";
			}
		}else{
			$data['msg'] ="卡号不存在！";
			$data['status'] ="0";
			$data['desc'] = "";
		}
		$this->ajaxReturn($data);*/
	}
	
	/**
	 * 我的代金券列表
	 */
	public function cashcoupon(){
		$type = (int)I('type');		//0未使用，1已使用
		$map['is_ply'] = $type;
		$map['user_id'] = $this->user['id'];
		$list = M('cashcoupon_detail')->where($map)->order('id DESC')->select();
		
		$this->assign('list',$list);
		$this->assign('type',$type);
		
		$this->display();
	}
	/**
	 * 添加代金券(ajax)
	 */
	public function addcashcoupon(){
		$code = I('sn');
		//查看代金券是否存在
		$where['code'] = $code;
		$coupon = M('cashcoupon')->where($where)->find();
		if (!$coupon) {
			$data['status'] = -1;
			$data['msg'] = "代金券不存在";
		}else{
			if ($coupon['state']==1){
				$data['status'] = 1;
				$data['msg'] = "代金券已被使用";
				$this->ajaxReturn($data);
			}
			if ($coupon['permoney']>0){
				$count = $coupon['money']/$coupon['permoney'];
				for ($i=0;$i<$count;$i++){
					$item['user_id'] = $this->user['id'];
					$item['codeId'] = $coupon['id'];
					$item['money'] = $coupon['permoney'];
					$item['addtime'] = time();
					M('cashcoupon_detail')->add($item);
				}
			}else{
				$items['user_id'] = $this->user['id'];
				$items['codeId'] = $coupon['id'];
				$items['money'] = $coupon['money'];
				$items['addtime'] = time();
				M('cashcoupon_detail')->add($items);
			}
			/*if(!$coupon['addtime']){
				for ($i=0;$i<5;$i++){
					$item['user_id'] = $this->user['id'];
					$item['codeId'] = $coupon['id'];
					$item['money'] = $coupon['money']/5;
					$item['addtime'] = time();
					M('cashcoupon_detail')->add($item);
				}
			}else{
				$items['user_id'] = $this->user['id'];
				$items['codeId'] = $coupon['id'];
				$items['money'] = $coupon['money'];
				$items['addtime'] = time();
				M('cashcoupon_detail')->add($items);
			}*/
			M('cashcoupon')->where(array('id'=>$coupon['id']))->save(array('state'=>1));
			$data['status'] = 1;
			$data['msg'] = "代金券添加成功";
			
		}
		$this->ajaxReturn($data);
	}
	

	//系统首页
    public function index1(){
		$class_nav['member']='weui_bar_item_on';
		$this->assign('class_nav',$class_nav);
		$map['id'] =$_SESSION['user']['id'];
		$user=M('user')->where($map)->find();
		$this->grade =M('grade')->where('glv ='.$user['lv'])->getField('gname');
		$this->user =$user;
		$this->assign('member_active','active');
        $this->display();
    }

    /**
     * 核销页面，要核销的订单信息
     */
    public function hexiao(){
    	if(!isset($_SESSION['user']))
    	{
    		$this->redirect("/Member/Login");
    	}

    	$user_id = $_SESSION['user']['id'];
    	//判断当前用户是否是核销员
    	$hexiao =M('hexiao')->alias('h')->join('onethink_store as s on s.id=h.store_id')->field('h.*,s.sname,s.sadd')->where('admin_id ='.$user_id)->find();
    	$this->assign('hexiao',$hexiao);
    	$is_hexiao = 0;
    	if ($hexiao) $is_hexiao=1;
    	$this->assign('is_hexiao',$is_hexiao);
    	
    	$userinfo =M('user')->where('id ='.$user_id)->find();
    	
    	$order_id  = I('order_id');		//订单编号
    	//查找订单信息
    	$orderinfo =M('order')->where('sn ='.$order_id)->find();
    	if (!$orderinfo){
    		$orderinfo = "";
    	}
    	$userAddress =M('user_address')->where('user_id='.$orderinfo['user_id'])->find();
    	$orderDetail =M("order_detail")->where('order_id ='.$orderinfo['id'])->select();
			
    	$this->assign('userAddress',$userAddress);
    	$this->assign('orderDetail',$orderDetail);
    	$this->assign('orderinfo',$orderinfo);
    	
    	$this->display();
    	
    	
    }

    /**
     * 核销操作(ajax修改订单状态)
     */
    public function updateorder(){
    	$user_id = $_SESSION['user']['id'];
    	$hexiao =M('hexiao')->where('admin_id ='.$user_id)->find();
    	if ($hexiao=="") {
    		$data['status'] = "-1";
    		$data['msg'] ="您没有该权限！";
    		$this->ajaxReturn($data);
    	}
    	
    	$order_id =I('sn');
    	//查找订单，判断订单状态，避免重复操作
    	$map['sn'] = $order_id;
    	$order = M('order')->where($map)->find();
    	
    	if (!$order){
    		$data['status'] = "-1";
    		$data['msg'] ="订单不存在！";
    		$this->ajaxReturn($data);
    	}
    	if ($order['status']==3){
    		$data['status'] = "-1";
    		$data['msg'] ='此订单已经核销';
    		$this->ajaxReturn($data);
    	}
    	$res =M('order')->where($map)->setField('status','3');
    	if ($res>0) {
    		$data['status'] = "1";
    		$data['msg'] ='核销成功';
    	}else{
    		$data['status'] ='0';
    		$data['msg'] ='系统繁忙';
    	}
    	$this->ajaxReturn($data);
    }


    //消息
    public function infolist(){
    	$user_id =$_SESSION['user']['id'];
    	$data =M('msg')->where('user_id='.$user_id)->order('addtime DESC')->select();
    	$this->assign('list',$data);
    	$this->display();
    }
    
    /**
     * 点击签到
     */
    public function ajaxSign(){
    	$user_id =$_SESSION['user']['id'];
    	$m = M('user');
    	$map['id'] = $user_id;
    	$user = $m->where($map)->find();
    	$startime = strtotime(date('Y-m-d'));
    	$endtime = strtotime(date('Y-m-d')." 23:59:59");
    	$integral = getSignRatio();
    	//判断用户当天是否已签到过
    	if ($user['signtime']>$startime&&$user['signtime']<($endtime+1)){
    		echo json_encode(array('status'=>-1,'msg'=>'您今天已经签到过了！'));exit;
    	}
    	$jifen = $user['integral']+$integral;
    	$rs = $m->where($map)->save(array('integral'=>$jifen,'signtime'=>time()));
    	if ($rs){
    		//添加积分记录
    		$data['user_id'] = $user_id;
    		$data['title'] = "会员签到";
    		$data['integral'] = $integral;
    		$data['type'] = 2;
    		$data['operate_type'] = 2;
    		$data['addtime'] = time();
    		M('integral_record')->add($data);
    		echo json_encode(array('status'=>1,'msg'=>'签到成功','jifen'=>$jifen));exit;
    	}else{
    		echo json_encode(array('status'=>-1,'msg'=>'签到失败','jifen'=>$user['integral']));exit;
    	}
    }
    
    /**
     * 门店地址列表
     */
    public function stores(){
    	$jssdk = new JssdkController();
    	$signPackage = $jssdk->getSignPackage();
    	$this->assign('signPackage',$signPackage);
    	
    	$list = M('store')->select();
    	
    	$mylat = I('lat');		//我的纬度
    	$mylng = I('lng');	//我的精度
    	foreach ($list as $k=>$v){
    		$list[$k]['distance'] = $this->getDistance($v['sweidu'], $v['sjingdu'], $mylat, $mylng,2);
    	}
    	$this->assign('list',$list);
    	
    	$this->display();
    }
    
    /**
     * 根据两点之间的经纬度计算距离
     */
    function getDistance($lat1, $lng1, $lat2, $lng2, $len_type = 1, $decimal = 0){
    	$earth = 6378.137;
    	$radLat1 = $lat1 * PI ()/ 180.0;   //PI()圆周率
    	$radLat2 = $lat2 * PI() / 180.0;
    	$a = $radLat1 - $radLat2;
    	$b = ($lng1 * PI() / 180.0) - ($lng2 * PI() / 180.0);
    	$s = 2 * asin(sqrt(pow(sin($a/2),2) + cos($radLat1) * cos($radLat2) * pow(sin($b/2),2)));
    	$s = $s * $earth;
    	$s = round($s * 1000);
    	if ($len_type == 1)
    	{
    		$s /= 1000;
    	}
    	return round($s, $decimal);
    }
    /**
     * 获取用户可领取的优惠券列表
     */
    public function allcouponlist(){
    	$userid = $_SESSION['user']['id'];
    	//获取当前用户的会员信息
    	$user = M('user')->where('id='.$userid)->find();
    	$grade = array('elt',$user['lv']);//当前用户的会员等级
    	$now = date('Y-m-d H:i:s');
    	$map['grade_id'] = $grade;
    	$map['start_date'] = array('elt',$now);
    	$map['end_date'] = array('gt',$now);
    	$map['status'] = 1;
    	$list = M('coupon')->order('id DESC')->where($map)->select();
//     	print_r(M('coupon')->getLastsql());die;
    	$this->assign('list',$list);
    	
    	$this->display();
    }
    
    /**
     * 积分记录明细
     */
    public function integralrecord(){
    	$userid = $_SESSION['user']['id'];
    	$map['user_id'] = $userid;
    	$list = M('integral_record')->where($map)->order('id DESC')->select();
    	
    	$this->assign('list',$list);
    	
    	$this->display();
    }
    
    /**
     * 提现申请明细
     */
    public function withdrawlist(){
    	$userid = $_SESSION['user']['id'];
    	$map['user_id'] = $userid;
    	$list = M('brokerage_withdraw_record')->where($map)->order('id DESC')->select();
    	$this->assign('list',$list);
    	
    	$statarr[0] = "待审核";
    	$statarr[1] = "已转账";
    	$statarr[2] = "已驳回";
    	$this->assign('statarr',$statarr);
    	
    	$this->display();
    }
    
    
}