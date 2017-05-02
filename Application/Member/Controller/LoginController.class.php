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
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class LoginController extends \Think\Controller {
	protected $wappid = "wx73f8f21829bef9c6";
    protected $wappsecret = "00ea7e3072f302d457e88b7402dc6429";

	//系统首页
    public function index(){
    	//print_r($_SERVER['HTTP_REFERER']);
    	$forward = cookie('forward');
        if(IS_POST)
		{
			$code		=	I('post.code');
			$login_user	=	I('post.login_user');
			$login_pass	=	I('post.login_pass');
			$verify = new \Think\Verify();
			$r=$verify->check($code);
			if(!$r)
			{
				$this->error('验证码不正确');
			}
			$map['login_user|mobile']	=	$login_user;
			$user	=	M('User')->where($map)->find();
			
			if(!$user){
				$this->error('用户不存在');
			}
			if ($user['status']==0){
				$this->error('账号被禁用，请联系客服');
			}
		
			if($user['login_pass']!=md5($login_pass))
			{
				$this->error('密码不正确');
			}
			if (!$user['card_num']){
				$card_num = 1000000+$user['id'];
				M('user')->where('id='.$user['id'])->save(array('card_num'=>$card_num));
			}
			$_SESSION['user']['id']=$user['id'];
			$_SESSION['user']['login_user']=$user['login_user'];
			$_SESSION['user'] = $user;
			if (!$forward) $forward = U('/Member/Index/index');
			$this->success('登陆成功',$forward);
		}

		// 微信登录地址
		$wappid = $this->wappid;
        $wappsecret = $this->wappsecret;

        $redirect = urlencode("http://www.miguaner.cn/index.php?s=/Member/Login/wback.html");
        $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={$wappid}&redirect_uri={$redirect}&response_type=code&scope=snsapi_userinfo&state=&connect_redirect=1#wechat_redirect";
        $this->assign('reurl',$url);

        $config = api('Config/lists');
        C($config); //添加配置
        $this->display();
    }

    // 微信登录回调函数
    public function wback(){
		$tourl = cookie('forward');
		$tourl = C('WEBSITE').$tourl;
	    $code = $_GET['code'];
// 	    print_r($code);exit;
	 	//$state = $_GET['state'];
	 	$pappid = $this->wappid;
	 	$psecret = $this->wappsecret;
	 
	 	// 是否携带跳转地址 是不是分享地址 
	 	$state = $_GET['state'];
	 	if(!empty($state)){
	 		$puid = (int)$_GET['state'];
	 		$target = urldecode(strchr($_GET['state'],'http'));
	 	}
	 	
	 	// 获取用户分享来的id
	 	$uri = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={$pappid}&secret={$psecret}&code={$code}&grant_type=authorization_code";
	 	$to_res = file_get_contents($uri);
	 	$to_res = json_decode($to_res,true);
	 	if(!$to_res['errmsg']){
	 		
	 		$token = $to_res['access_token'];
			$openid = $to_res['openid'];
		 	$uurl = "https://api.weixin.qq.com/sns/userinfo?access_token={$token}&openid={$openid}&lang=zh_CN";
		 	$info_res = file_get_contents($uurl);
		 	$info_res = json_decode($info_res,true);
		 	if(!$info_res['errmsg']){
		 		/*
					Array ( [openid] => oD5xhwko-pZ-EffsZijeXmhEvfb0 [nickname] => 白猫 [sex] => 1 [language] => zh_CN [city] => [province] => 北京 [country] => 中国 [headimgurl] => http://wx.qlogo.cn/mmopen/whOJd0EbO8lOG7a1wwL9TZ3XqdR5h2VBub3wZH4s6HPWJKxJN22tn8xica1CMSWHFYeYIhC7yEHQy1eUOPyv7AHDGdI4dQNNT/0 [privilege] => Array ( ) )
		 		*/
		 		// 成功获得用户
					$openid = $info_res['openid'];
					$where['openid'] = array('eq',$openid);
					$where['status'] = array('neq',-1);
					$wuser = M('user')->where($where)->find();
					
					if(empty($wuser)){
						$data['openid'] = $info_res['openid'];
						$data['register_time'] = time();
						$data['last_login_time']=time();
						$data['name'] = $info_res['nickname'];
						$data['sex'] = $info_res['sex'];
						$data['login_user'] = $info_res['nickname'];//substr($info_res['openid'],0,11);
						$data['regist_type'] = 2;
						$data['image'] = $info_res['headimgurl'];
						$data['integral'] = getRegistRatio();
						$data['lv'] = getMinGrade();
						if(empty($state) || $puid == 0){
							$addres = M('user')->add($data);
						}else{
							$data['parent_user_id'] = $puid;
							$addres = M('user')->add($data);
							/************写入分享记录****************/
							//判断分享者id是否等于用户的id
							$shareitem['share_id'] = $puid;
							$shareitem['user_id'] = $addres;
							$shareitem['addtime'] = time();
							$shareitem['year'] = date('Y');
							$shareitem['month'] = date('m');
							$shareitem['day'] = date('d');
							M('share_record')->add($shareitem);
							M('user')->where('id='.$puid)->setInc('sharenum');
						}
						
						if($addres){
							$_SESSION['user'] = $data;
							$_SESSION['user']['id'] = $addres;
							$card_num = 10000000+$addres;
							M('user')->where('id='.$addres)->save(array('card_num'=>$card_num));
							
							//添加积分记录
							$item['user_id'] = $addres;
							$item['title'] = "会员注册";
							$item['integral'] = getRegistRatio();
							$item['addtime'] = time();
							$item['type'] = 1;
							M('integral_record')->add($item);
							
							if(empty($state)){
								// 第一次微信普通登录
								if ($tourl){
									header("location:".$tourl);
								}else{
									$this->redirect('/Member');
								}
							}else{
								// 不为空 则 第一次过来是分享链接 跳扫码关注页面
								$this->redirect('Home/Product/fenxiang');
							}
							
						}else{
							$this->error('数据库异常','/');
						}
					}else{
						$map = array();
						$map['openid'] = $info_res['openid'];
						$wuserinfo = M('user')->where($map)->find();
						if(!$wuserinfo['image']){
							$_SESSION['user']['image'] = $info_res['headimgurl'];
							M('user')->where($map)->save(array('image'=>$info_res['headimgurl']));
						}
						$_SESSION['user'] = $wuserinfo;
						/************写入分享记录****************/
						//判断分享者id是否等于用户的id
						if ($puid!=0&&$puid!=$wuserinfo['id']){
							$shareitem['share_id'] = $puid;
							$shareitem['user_id'] = $wuserinfo['id'];
							$shareitem['addtime'] = time();
							$shareitem['year'] = date('Y');
							$shareitem['month'] = date('m');
							$shareitem['day'] = date('d');
							M('share_record')->add($shareitem);
							M('user')->where('id='.$puid)->setInc('sharenum');
						}
						$_SESSION['user']['id'] = $wuserinfo['id'];
						//$_SESSION['user']['login_user']=$wuserinfo['opinid'];
						if(empty($state)){
							// 不是首次用 微信登录
							if ($tourl){
								header("location:".$tourl);
								//$this->redirect($tourl);
							}else{
								$this->redirect('/Member/Index/index');
							}
						}else{
							// 商城用户 点击分享链接
							header("Location:{$target}&share_user=".$puid);
						}		
					}
		 	}else{
		 		$this->redirect('/');
		 	}

	 	}else{
			$this->redirect("/");
	 	}
    }


	//退出
	public function logout()
	{
		session_destroy();
		cookie('forward',null);
		header('Location:/');
	}
	public function verify()
	{
		$config =    array(
			'fontSize'		=>	14,    // 验证码字体大小
			//'length'		=>	4,     // 验证码位数
			'useNoise'		=>	false, // 关闭验证码杂点
			'useCurve'		=>	false,
			'imageW'		=>	75,
			'imageH'		=>	30,
		);
		$Verify = new \Think\Verify($config);
		$Verify->length=4;
		$Verify->entry();
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
	//发送短消息


	//
	public function sendsms(){
		$target = "http://cf.lmobile.cn/submitdata/Service.asmx/g_Submit";
		$mobile = $_POST['mobile'];
		//$send_code = $_POST['send_code'];

		$mobile_code = random(6,1);
		if(empty($mobile)){
			$this->error('手机号码不能为空');
			//exit('手机号码不能为空');
		}
		//替换成自己的测试账号,参数顺序和wenservice对应
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
		echo json_encode($rs);exit;
	}

	



	public function Post($data, $target) {
	    $url_info = parse_url($target);
	    $httpheader = "POST " . $url_info['path'] . " HTTP/1.0\r\n";
	    $httpheader .= "Host:" . $url_info['host'] . "\r\n";
	    $httpheader .= "Content-Type:application/x-www-form-urlencoded\r\n";
	    $httpheader .= "Content-Length:" . strlen($data) . "\r\n";
	    $httpheader .= "Connection:close\r\n\r\n";
	    //$httpheader .= "Connection:Keep-Alive\r\n\r\n";
	    $httpheader .= $data;

	    $fd = fsockopen($url_info['host'], 80);
	    fwrite($fd, $httpheader);
	    $gets = "";
	    while(!feof($fd)) {
	        $gets .= fread($fd, 128);
	    }
	    fclose($fd);
	    if($gets != ''){
	        $start = strpos($gets, '<?xml');
	        if($start > 0) {
	            $gets = substr($gets, $start);
	        }        
	    }
	    return $gets;
	}



	public function password2()
	{
		//var_dump($_SESSION);exit;
		if(IS_POST)
		{
			if(!isset($_SESSION['mobile']))
			{
				$this->error('用户不存在');
			}
			$data['login_pass']=I('post.login_pass');
			$repassword=I('post.repassword');
			if(strlen($data['login_pass'])<6)
			{
				$this->error('密码不能小于6位');
			}
			if($data['login_pass']!=$repassword)
			{
				$this->error('两次密码不一致');
			}
			$map['login_user']=$_SESSION['mobile'];
			$user=M('User')->where($map)->find();
			if(!$user)
			{
				$this->error('用户不存在');
			}
			$data['login_pass']=md5($data['login_pass']);
			M('User')->where($map)->save($data);
			$this->success('密码重置成功');
		}
		if(!isset($_SESSION['backpass']) || $_SESSION['backpass']==0)
		{
			echo "<script>\n";
			echo "alert('非法操作!');\n";
			echo "</script>\n";
			exit;
		}
		$this->display();
	}

}