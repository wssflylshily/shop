<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;

/**
 * 拼团产品模型控制器
 * 拼团产品模型列表和详情
 */
class SpellController extends HomeController {
	protected $wappid = "wx73f8f21829bef9c6";
    protected $wappsecret = "00ea7e3072f302d457e88b7402dc6429";
	
	/**
	 * 拼团列表
	 */
	public function index(){
		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->updateSpellState();
		//查询banner
		$banners = M('focus')->where('pos_id=6')->order('order_num DESC,id asc')->select();
		$this->assign('bannerlist',$banners);
		$map = array();
		$map['status'] = 1;
		$list = M('spell')->where($map)->order('order_num asc,id DESC')->limit(10)->select();
		
		$this->assign('list',$list);
		$statearr[1] = "拼团未开始";
		$statearr[2] = "拼团分享中";
		$statearr[3] = "拼团已结束";
// 		$statearr[3] = "拼团已完成";
// 		$statearr[4] = "拼团已结束";
		$this->assign('statearr',$statearr);
		
		$this->assign('spell_active','active');
		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->display();
	}
	
	/**
	 * 拼团列表下拉加载更多（ajax)
	 */
	public function ajaxlist(){
		$this->updateSpellState();
		$page	=	intval(I('page'));
		$per = 10;
		$star = ($page-1)*$per;
		$model	=	M('spell');
		$map['status'] = 1;
		
		$list = $model->where($map)->order('id desc,order_num asc')->limit($star,$per)->select();
		foreach ($list as $k=>$v){
			$states = "";
			switch ($v['state']){
				case 1:
					$states = '拼团未开始';
					break;
				case 2:
					$states = '拼团分享中';
					break;
				case 3:
					$states = '拼团已结束';
					break;
			}
			$list[$k]['states'] = $states;
		}
	
		if(!$list)$list=array();
		header('Content-Type: text/plain; charset=utf-8');
		echo json_encode($list);
	}
	
	/**
	 * 拼团商品详情
	 */
	public function detail(){
		$this->updateSpellState();
		//查询所有一级分类
		//查找所有一级分类
		$map = array();
		$map['status'] = 1;
		$map['pid'] = 0;
		$this->all_cates = M('category')->where($map)->order('sort ASC,id ASC')->field('id,title')->select();
		
		$is_login=0;
		if(isset($_SESSION['user'])){
			$is_login=1;
			$user=M('User')->where('id='.$_SESSION['user']['id'])->find();
		}
		if($user['name'])$user['username']=$user['name'];
		else $user['username'] = $user['login_user'];
		$this->assign('user',$user);
		$this->assign('is_login',$is_login);
		$id = (int)I('id');
		$spell = M('spell')->where('id='.$id)->find();

		$pic = explode(',', $spell['imglist']);
		$share_img = M('picture')->where('id='.$pic[0])->getField('path');
		if(!$share_img)$share_img = $spell['image'];
		$this->assign('share_img',$share_img);
		
		if (!$spell)$this->error('拼团信息不存在');
		$this->assign('spell',$spell);
		
		$ids = explode(',', $spell['imglist']);
		$map = array();
		$map['id'] = array('in',$ids);
		$piclist = M('picture')->where($map)->select();
		$this->assign('piclist',$piclist);

		$share_user_id	=	intval(I('share_user'));//获取分享人
		$this->assign('share_user_id',$share_user_id);

		$share_desc = cookie('spell_'.$id);
		if (!$share_desc)
			$share_desc = $spell['describe'];
		if (!$share_desc)$share_desc = $spell['title'];
		
		$qian=array("\t","\n","\r");
		$share_desc = str_replace($qian, '', $share_desc);
		$this->assign('share_desc',$share_desc);
		
		//查询所有已开团还未成团的团
		$teams = M('spell_teams')->where('spell_id='.$id.' and status=0 and join_num>0')->order('join_num DESC')->select();
// 		print_r(M('spell_teams')->getLastsql());die;
		foreach ($teams as $k=>$v){
			$teamuser = M('user')->where('id='.$v['user_id'])->find();
			$teams[$k]['nickname'] = $teamuser['name'];
			if (!$teamuser['name'])$teams[$k]['nickname'] = $teamuser['login_user'];
			$teams[$k]['headimg'] = $teamuser['image'];
			$teams[$k]['nums'] = $spell['num']-$v['join_num'];
		}
		$this->assign('teams',$teams);
		
		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->display();
	}
	
	/**
	 * 分享打开的拼团详情
	 */
	public function detail_share(){
		$this->updateSpellState();
		cookie('forward',$_SERVER['REQUEST_URI']);
		
		$team_id = (int)I('team_id');
		$this->assign('team_id',$team_id);
		$userId = $_SESSION['user']['id'];
		//$share_user = (int)I('share_user');
		$id = (int)I('id');
		$this->assign('id',$id);
		$team = M('spell_teams')->where('id='.$team_id)->find();
		$spell = M('spell')->where('id='.$team['spell_id'])->find();

		$pic = explode(',', $spell['imglist']);
		$share_img = M('picture')->where('id='.$pic[0])->getField('path');
		if(!$share_img) $share_img=$spell['image'];
		$this->assign('share_img',$share_img);
		
		$share_desc = cookie('spell_'.$spell['id']);
		if (!$share_desc)$share_desc=$spell['describe'];
		if (!$share_desc)$share_desc=$spell['title'];
		$this->assign('share_desc',$share_desc);
		$this->assign('spell',$spell);
		$order = M('spellorder')->where('team_id='.$team_id.' and user_id='.$team['user_id'])->find();
		
		if ($team['user_id']==$userId){
			$url = U('Spell/payok',array('order_id'=>$order['id']));
			header("location:".$url);
			//$this->redirect('Spell/payok/order_id/'.$order['id']);
		}
		$this->assign('team',$team);
		$users = M('spellorder')->alias('o')->join('onethink_user as u on u.id=o.user_id')->where('o.team_id='.$team_id.' and o.status>0')->select();
		$this->assign('users',$users);
		//剩余名额数量
		$num = $spell['num']-count($users);
		$this->assign('num',$num);
		//推荐拼团
		$spells = M('spell')->where('status=1 and is_home=1 and state<3')->select();
		$this->assign('spelllist',$spells);
		$statearr[1] = "拼团未开始";
		$statearr[2] = "拼团分享中";
		$statearr[3] = "拼团已结束";
		$this->assign('statearr',$statearr);
		
		$this->assign('user_id',$_SESSION['user']['id']);
		
		//中间广告
		$ads = M('focus')->where('pos_id=7')->find();
		$this->assign('ads',$ads);
		
		$this->display();
	} 
	
	/**
	 * 编辑推荐语
	 */
	public function editdes(){
		$this->updateSpellState();
		$id = (int)I('id');
		$spell = M('spell')->where('id='.$id)->find();
		$this->assign('spell',$spell);
		$share_desc = cookie('spell_'.$id);
		if (!$share_desc)
			$share_desc = $spell['describe'];
		if (!$share_desc)
			$share_desc = $spell['title'];
		//file_put_contents('ddd.txt', $share_desc."\r\n".$spell['describe']."\r\n".$id);
		$this->assign('share_desc',$share_desc);
		if (IS_POST){
			$content = trim(I('content'));
			$qian=array("\t","\n","\r");
			$content = str_replace($qian, '', $content);
			$id = (int)I('id');
			if ($content){
				cookie('spell_'.$id,$content);
			}else{
				cookie('spell_'.$id,null);
			}
			$this->success('',U('Spell/detail',array('id'=>$id)));
		}
		
		$this->display();
	}
	
	/**
	 * 检查用户是否参加过指定拼团
	 */
	public function checkUserjoin(){
		$this->updateSpellState();
		$userid = (int)I('userid');
		$spellid = (int)I('spellid');
		$team = M('spell_teams')->where('spell_id='.$spellid.' and user_id='.$userid)->find();
		$order = M('spellorder')->where('team_id='.$team['id'].' and user_id='.$team['user_id'])->find();
		//$info = M('spellorder')->where('spell_id='.$spellid.' and user_id='.$userid)->find();
		if($order['status']>0&&$team['status']==0){
			$this->error('您已参加当前拼团');
		}else{
			$this->success('未开团');
		}
		/*if(!$team){
			$this->success('未开团');
		}else{
			$this->error('您已开团过当前拼团');
		}*/
	}
	
	/**
	 * 拼团支付成功
	 */
	public function payok(){
		$this->updateSpellState();
// 		cookie('forward',$_SERVER['REQUEST_URI']);
		$order_id = (int)I('order_id');
		$order = M('spellorder')->where('id='.$order_id)->find();
		
		$spell = M('spell')->where('id='.$order['spell_id'])->find();
		$team = M('spell_teams')->where('id='.$order['team_id'])->find();
		
		$pic = explode(',', $spell['imglist']);
		$share_img = M('picture')->where('id='.$pic[0])->getField('path');
		$this->assign('share_img',$share_img);
		
		$users = M('spellorder')->alias('o')->join('onethink_user as u on u.id=o.user_id')->where('o.team_id='.$order['team_id'].' and o.status=1')->select();
		$this->assign('users',$users);
		
		$this->assign('order',$order);
		$this->assign('spell',$spell);
		$this->assign('team',$team);
// 		print_r($team);die;
		$this->assign('user_id',$_SESSION['user']['id']);
// 		//订单状态改为已支付
// 		M('order')->where('id='.$order_id)->save(array('status'=>1));
		$num = $spell['num']-($team['join_num']);
		if($num<=0) $num=0;
// 		$num=1;
		$this->assign('num',$num);
		
		//推荐拼团
		$spells = M('spell')->where('status=1 and is_home=1 and state<3')->select();
		$this->assign('spelllist',$spells);
		$statearr[1] = "拼团未开始";
		$statearr[2] = "拼团分享中";
		$statearr[3] = "拼团已结束";
		$this->assign('statearr',$statearr);
		
		//中间广告
		$ads = M('focus')->where('pos_id=7')->find();
		$this->assign('ads',$ads);
		
		//分享描述
		$share_desc = cookie('spell_'.$spell['id']);
		if (!$share_desc)
			$share_desc = $spell['describe'];

		$qian=array("\t","\n","\r");
		$share_desc = str_replace($qian, '', $share_desc);
		$this->assign('share_desc',$share_desc);
		
		$user_id = $_SESSION['user']['id'];
		$wappid = $this->wappid;
		$wappsecret = $this->wappsecret;
		$uid = $_SESSION['user']['id']?$_SESSION['user']['id']:0;
		$redirect = urlencode("http://www.miguaner.cn/index.php?s=/Member/Login/wback.html");
		$beurl = 'http://';
		$target = urlencode("http://www.miguaner.cn/index.php?s=/Home/Spell/detail_share/id/{$spell['id']}/share_user/{$user_id}/team_id/{$team['id']}");//urlencode($beurl.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
		$state = $uid.$target;
		$resurl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={$wappid}&redirect_uri={$redirect}&response_type=code&scope=snsapi_userinfo&state={$state}#wechat_redirect";
			
		$this->assign('share_url',$resurl);
		
		
		$this->display();
	}
	
	/**
	 * 判断拼团人数是否已满
	 */
	public function teamIsFull(){
		$team_id = (int)I('team_id');
		$team = M('spell_teams')->where('id='.$team_id)->find();
		$spell = M('spell')->where('id='.$team['spell_id'])->find();
		$userId = $_SESSION['user']['id'];
		$order = M('spellorder')->where('team_id='.$team_id.' and user_id='.$userId)->find();
		if ($order){
			$this->error('您已经参加当前拼团');
		}
		if($team['join_num']>=$spell['num']||$team['status']==1){
			$this->error('拼团人数已满');
		}elseif ($team['status']==2){
			$this->error('拼团已结束');
		}else{
			$this->success();
		}
	}
	
	
	public function evaluatelist()
	{
		$arr	=	array();
		$product_id	=	intval(I('product_id'));
		$list	=	M('Evaluate')->where('product_id='.$product_id)->order('id desc')->select();
		if(!$list)
		{
			$arr['count']=0;
			$arr['sumScore']=0;
			$arr['lists'][]=array();
			echo json_encode($arr);
			exit;
		}
		$i=1;
		$sumScore=0;
		foreach($list as $item)
		{
			$user=M('User')->where('id='.$item['user_id'])->find();
			$sumScore+=$item['score'];
			$i++;
			$arr['lists'][]=array('id'=>$item['id'],'touxiang'=>'','tel'=>substr_replace($user['login_user'],'******','3','6'),'time'=>date('Y-m-d',$item['addtime']),'score'=>$item['score'],'word'=>$item['desc']);
		}
		$arr['sumScore']=$sumScore;
		/*$sumScore=ceil($sumScore/$i);
		$arr['count']=$i;
		$list['sumScore']=$sumScore;
		$list['lists'][]=array('id'=>1,'touxiang'=>'img/proDetail/touxiang.png','tel'=>13821264212,'time'=>"2016-08-04",'score'=>"4.9",'word'=>'ddd');*/
		echo json_encode($arr);
	}


	/**
	 * 下拉加载更多评论
	 */
	public function ajaxGetEvaluate(){
		$page = (int)I('page',2);
		$per = 10;
		$start = ($page-1)*$per;
		$state = (int)I('state');
		$proid = (int)I('proid');
		$map = array();
		$map['product_id'] = $proid;
		$map['status'] = 1;
		if ($state==1){
			//好评
			$map['score'] =	array('gt','3');
		}
		if ($state==2){
			//差评
			$map['score'] =	array('lt','4');
		}
		$list = M('Evaluate')->where($map)->order('id desc')->limit($start,$per)->select();
		if ($list){
			foreach ($list as $k=>$v){
				$user = M('user')->where('id='.$v['user_id'])->find();
				$list[$k]['name'] = $user['login_user'];
				$list[$k]['image'] = $user['image'];
				$list[$k]['time'] = date('Y-m-d',$v['addtime']);
			}
		}else{
			$list = array();
		}
	
		$this->ajaxReturn($list);exit;
	}

}
