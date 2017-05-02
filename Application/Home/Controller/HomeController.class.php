<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Controller;

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {
	protected $wappid = "wx73f8f21829bef9c6";
    protected $wappsecret = "00ea7e3072f302d457e88b7402dc6429";

	public function __construct(){
		parent::__construct();
		// 分享地址
		$wappid = $this->wappid;
        $wappsecret = $this->wappsecret;
        $uid = $_SESSION['user']['id']?$_SESSION['user']['id']:0;
        $redirect = urlencode("http://www.miguaner.cn/index.php?s=/Member/Login/wback.html");
        $beurl = 'http://';
		$target = urlencode($beurl.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
		$state = $uid.$target;
        $resurl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={$wappid}&redirect_uri={$redirect}&response_type=code&scope=snsapi_userinfo&state={$state}#wechat_redirect"; 
	 	
	 	$this->assign('weiurl',$resurl);
	 	
	 	$userid = $_SESSION['user']['id'];
	 	$user = M('user')->where('id='.$userid)->find();
	 	if($user['name'])$user['username'] = $user['name'];
	 	else $user['username'] = $user['login_user'];
	 	$this->assign('nowuser',$user);
	 	
	 	$grade = M('grade')->where('id='.$user['lv'])->find();
	 	if (!$grade) $grade="";
	 	$this->assign('grade',$grade);
	}

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}
	/**
	 * 更改拼团状态
	 */
	public function updateSpellState(){
	$now = time();
		// 		print_r($now);die;
		//将未开始但状态不正确的拼团状态改为未开始
		$where1 = "start_date > $now and join_num < num and state<>1 and `status`=1";
		M('spell')->where($where1)->save(array('state'=>1));
	
		//将已超过开始时间、未结束且状态显示不正确的拼团改为拼团中
		$where2 = "start_date <= $now and end_date > $now and state<>2 and `status`=1";
		M('spell')->where($where2)->save(array('state'=>2));
	
		//将已到时间未结束的拼团状态改为已结束
		$where3 = "end_date <= $now and state<>3 and status=1";
		$spells = M('spell')->where($where3)->select();
		foreach ($spells as $k=>$v){
			$team = M('spell_teams')->where('spell_id='.$v['id'])->find();
			if($team['join_num']<$v['num']){
				M('spell_teams')->where('spell_id='.$v['id'])->save(array('status'=>2));
			}
			M('spell')->where('id='.$v['id'])->save(array('state'=>3));
		}
		//查询所有未成团的拼团，检查人数是否已满
		$list = M('spell')->where('state=2 and status=1')->select();
		foreach ($list as $key=>$val){
			M('spell_teams')->where('spell_id='.$val['id'].' and join_num >= '.$val['num'])->save(array('status'=>1));
		}
		
		/*//将未到期人数已满的拼团改为已完成
			$where3 = "start_date <= '$now' and end_date > '$now' and state=2 and `status`=1 and join_num >= num";
		M('spell')->where($where3)->save(array('state'=>3));
			
		//将已到期，人数未满的拼团改为失败的状态
		$where4 = "end_date < '$now' and join_num < num";
		M('spell')->where($where4)->save(array('state'=>4));*/
	
	}

    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置

        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }
    }

	/* 用户登录检测 */
	protected function login(){
		/* 用户登录检测 */
		is_login() || $this->error('您还没有登录，请先登录！', U('User/login'));
	}

	/* 获取焦点图 */
	protected function getfocuslist($pos_id,$num=5)
	{
		$map['pos_id']	=	$pos_id;
		return M('Focus')->where($map)->order('order_num desc,id desc')->limit($num)->select();
	}

}
