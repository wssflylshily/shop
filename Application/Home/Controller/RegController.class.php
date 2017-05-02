<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class RegController extends HomeController {

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
	public function sendsms(){
		$target = "http://cf.lmobile.cn/submitdata/Service.asmx/g_Submit";
		$mobile = I('mobile');//$_POST['mobile'];

		$mobile_code = random(6,1);
		if(empty($mobile)){
			$this->error('手机号码不能为空');
		}
		$user = M('user')->where('login_user="'.$mobile.'" or mobile="'.$mobile.'"')->find();
		if($user){
			$this->error('用户已存在');
		}
		$str = "您的验证码是：".$mobile_code."（注册短信验证码，5分钟内有效），请勿告诉他人".C('SMS_SIGN');
		//替换成自己的测试账号,参数顺序和wenservice对应
		$post_data = "sname=".C('SNAME')."&spwd=".C('SPWD')."&scorpid=&sprdid=".C('SPRDID')."&sdst=".$mobile."&smsg=".rawurlencode($str);
		$gets = Post($post_data, $target);
		
		$result = xml_to_array($gets);
		if ($result['CSubmitState']['state']==0) {
			$_SESSION['mobile'] = $mobile;
			$_SESSION['mobile_code'] = $mobile_code;
			$rs = array('status'=>1,'info'=>$mobile_code);
		}else{
			$rs = array('status'=>-1,'info'=>'发送失败');
		}
		
		$this->ajaxReturn($rs);
	}

	//系统首页
    public function index(){
		if(IS_POST)
		{
			$login_user	=	I('post.login_user');
			$login_pass	=	I('post.login_pass');
			$repassword	=	I('post.repassword');
			$user_id	=	intval(I('post.user_id'));
			$sms		=	I('post.sms');
			var_dump($sms);
			if(!is_mobile($login_user))
			{
				$this->error('手机号不正确');
			}
			if($_SESSION['mobile']!=$login_user)
			{
				$this->error('不得临时更换手机');
			}
			if(empty($sms))
			{
				$this->error('请输入验证码');
			}
			if($sms!=$_SESSION['mobile_code'])
			{
				$this->error('验证码不正确');
			}
			if(strlen($login_pass)<6)
			{
				$this->error('密码小于6位');
			}
			if($login_pass!=$repassword)
			{
				$this->error('两次密码不一致');
			}
			$map['login_user|mobile']=$login_user;
			$map['status'] = array('neq',-1);
			$row=M('User')->where($map)->find();
			if($row)
			{
				$this->error('手机号码已经注册过了');
			}
			$data['login_user']	=	$login_user;
			$data['login_pass']	=	md5($login_pass);
			$data['mobile'] = $login_user;
			$data['register_time'] = time();
			$data['regist_type'] = 1;
			$data['integral'] = getRegistRatio();
			$data['lv'] = getMinGrade();
			if($user_id>0)
			{
				$data['parent_user_id']	=$user_id;//推荐人
			}
			$id=M('User')->add($data);
			if($id<1)
			{
				$this->error('出现异常');
			}
			$card_num = 10000000+$id;
			M('user')->where('id='.$id)->save(array('card_num'=>$card_num));
			$_SESSION['user'] = $data;
			$_SESSION['user']['id'] = $id;
			$_SESSION['login_user'] = $login_user;
			//领取优惠券
			/*$detail=M('CouponDetail')->where('user_id=0 and is_ply=0')->order('id asc')->find();
			if($detail)
			{
				$where	=	array();
				$data	=	array();
				$data['user_id']=	$id;
				$where['id']	=	$detail['id'];
				M('CouponDetail')->where($where)->save($data);
			}*/
			//添加积分记录
			$item['user_id'] = $id;
			$item['title'] = "会员注册";
			$item['integral'] = getRegistRatio();
			$item['type'] = 1;
			$item['addtime'] = time();
			M('integral_record')->add($item);
			$this->success('注册成功',U('/Member/Index/index'));
		}
		$user_id	=	intval(I('user_id'));
		$this->assign('user_id',$user_id);
        $this->display();
    }

}