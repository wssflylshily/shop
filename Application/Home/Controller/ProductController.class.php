<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Home\Tool\JssdkController;

/**
 * 产品模型控制器
 * 产品模型列表和详情
 */
class ProductController extends HomeController {
	
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

    /* 产品模型频道页 */
	public function index(){
		cookie('forward',$_SERVER['REQUEST_URI']);
		if ($_SESSION['user']['id']!="") {
        	# code...
        	$lv =M('user')->where('id= '.$_SESSION['user']['id'])->getField('lv');
        	$gzk =M('grade')->where('id ='.$lv)->getField('gzk');
        
        	$this->assign('gzk',$gzk);
        }/*else{
        	$lv =0;
        	$gzk =1;
        
        	$this->assign('gzk',$gzk);
        }*/
        if (!$gzk) $gzk=1;
        $this->assign('gzk',$gzk);
		/* 分类信息 */
		/*$category = $this->category();

		//频道页只显示模板，默认不读取任何内容
		//内容可以通过模板标签自行定制
		
		/* 模板赋值并渲染模板 */
		//$this->assign('category', $category);
		//$this->display($category['template_index']);*/
		$this->assign('category_active','active');
		//获取幻灯片
		$focuslist=$this->getfocuslist(6,100);
		$this->assign('focuslist',$focuslist);
		//所有的一级分类
		$catelist=M('Category')->where('pid=0 and status=1')->order('sort asc,id asc')->select();
		$this->assign('catelist',$catelist);
		$model	=	M('Product');
		$cat_id	=	intval(I('id'));
		$this->assign('cat_id',$cat_id);
		if($cat_id>0)
		{
			//$map['category_id']=$cat_id;
			$categorylist=M('Category')->where('pid='.$cat_id)->select();
			$cat_ids[]=$cat_id;
			foreach($categorylist as $item)
			{
				$cat_ids[]=$item['id'];
			}
			$map['category_id']=array('in',implode(',',$cat_ids));
		}else{
			$cateids=M('Category')->where('pid=0 and status=1')->order('sort asc,id asc')->getField('id',true);
			$map['category_id'] = array('in',$cateids);
		}
		$map['status']=1;
		$keywords=	I('keywords');
		if(!empty($keywords))
		{
			$map['title']	=	array('like','%'.$keywords.'%');
		}
		$this->assign('keywords',$keywords);
		
		$order=intval(I('order'));
		$desc=I('desc');
		$this->assign('order',$order);
		if($desc=='desc')$desc='asc';
		else $desc='desc';
		switch($order)
		{
			case 1://销量最高
				$orderstr='category_id asc,is_cat desc,sell_num desc,id desc';
			break;
			case 2://价格
				$orderstr='category_id asc,is_cat desc,gprice desc,id desc';
			break;
			case 3://最新
				$orderstr='category_id asc,is_cat desc,id desc';
			break;
			default://综合排序
				$orderstr='category_id asc,is_cat desc,order_num desc,id desc';
		}
		$is_new = I('is_new');
		if ($is_new) $map['is_cat'] = 1;
		$is_share = I("is_share");
		if ($is_share) $map['share_money'] = array('gt',0);
		$list = M('Product')->where($map)->order($orderstr)->limit(10)->select();
		
		foreach ($list as $key => $value) {
			# code...
			$list[$key]['gprice'] = round($list[$key]['gprice']*$gzk,2);
			$list[$key]['market_price'] = round($value['market_price']*$gzk,2);
		}
		//print_r($gzk);die;
		//echo M('Product')->getlastsql();exit;
		$this->assign('list',$list);
		$this->assign('cat_id',$cat_id);

		//$this->assign('curclass',$curclass);
		$this->assign('desc',$desc);

		$this->display();
	}

	//付款成功
	public function addpoint($order_id){
		$order_id =24;
		if ($order_id=='') {
			# code...
			$this->error('订单号不存在！');
		}else{
			$user =M('user');
			$user_id =$_SESSION['user']['id'];
			$order =M('order') ->where('id ='.$order_id)->find();
			if ($order['status']!=0) {
				# code...
				$this->error('订单已支付！');
			}else{
				$r =M('order')->where('id ='.$order_id)->setField('status','1');
				$userArr =M('user') ->where('id ='.$order['user_id'])->find();
				$userArr['points'] =$userArr['points']+$order['money'];
				$grade =M('grade')->order('glv ASC')->select();

				$gcount =M('grade')->count();
				for($i =0;$i<$gcount;$i++){
					if ($userArr['points']>$grade[$i]['glimit']) {
						$glv =$grade[$i]['glv'];
					}
				}
				if ($glv==null) {
					$glv =0;
				}
				$rel =M('user')->where('id ='.$order['user_id'])->setField('lv',$glv);
				$res =M('user')->where('id ='.$order['user_id'])->setField('points',$userArr['points']);
				var_dump($glv) ;
				var_dump($userArr['points']);
				echo M('user')->getLastSql();
			}
			
		}
		

	}

	public function ajaxlist()
	{
		$zk = 1;
		$user = M('user')->where('id='.$_SESSION['user']['id'])->find();
		$grade = M('grade')->where('id='.$user['lv'])->find();
		if($grade)$zk = $grade['gzk'];
		if(!$zk) $zk = 1;
		$order	=	intval(I('order'));
		switch($order)
		{
			case 1://销量最高
				$orderstr='category_id asc,sell_num desc,id desc';
			break;
			case 2://好评最多
				$orderstr='category_id asc,hao_num desc,id desc';
			break;
			case 3://最新
				$orderstr='category_id asc,id desc';
			break;
			default://综合排序
				$orderstr='category_id asc,is_cat desc,order_num desc,id desc';
		}
		$page	=	intval(I('page'));
		$per = 10;
		$star = ($page-1)*$per;
		/*$page=$page-1;
		if($page<0)$page=0;*/
		$model	=	M('Product');
		$cat_id	=	(int)I('cat_id');
		
		if($cat_id>0)
		{
			//$map['category_id']=$cat_id;
			$categorylist=M('Category')->where('pid='.$cat_id)->select();
			$cat_ids[]=$cat_id;
			foreach($categorylist as $item)
			{
				$cat_ids[]=$item['id'];
			}
			$map['category_id']=array('in',implode(',',$cat_ids));
		}else{
			$cateids=M('Category')->where('pid=0 and status=1')->getField('id',true);
			$map['category_id'] = array('in',$cateids);
		}
		$map['status']=1;
		$keywords=	I('keywords');
		if(!empty($keywords))
		{
			$map['title']	=	array('like','%'.$keywords.'%');
		}
		$field='id,title,gprice,market_price,sell_num,image,buyer_num,category_id';
		$list=M('Product')->field($field)->where($map)->order($orderstr)->limit($star,$per)->select();
		foreach ($list as $k=>$v){
			$list[$k]['gprice'] = $v['gprice']*$zk;
			$list[$k]['market_price'] = $v['market_price']*$zk;
		}
// 		echo M('Product')->getLastSql();die;
		if(!$list)$list=array();
		header('Content-Type: text/plain; charset=utf-8');
		echo json_encode($list);
		
	}


	public function ajaxevlist()
	{
		$order	=	intval(I('order'));
		switch($order)
		{
			case 1://销量最高
				$orderstr='sell_num desc,id desc';
			break;
			case 2://好评最多
				$orderstr='hao_num desc,id desc';
			break;
			case 3://最新
				$orderstr='id desc';
			break;
			default://综合排序
				$orderstr='order_num desc,id desc';
		}
		$page	=	intval(I('page'));
		$page=$page-1;
		if($page<0)$page=0;
		$model	=	M('Product');
		$cat_id	=	intval(I('cat_id'));
		echo $cat_id;
		if($cat_id>0)$map['category_id']=$cat_id;
		$map['status']=1;
		$keywords=	I('keywords');
		if(!empty($keywords))
		{
			$map['title']	=	array('like','%'.$keywords.'%');
		}
		$field='id,title,gprice,market_price,sell_num,image';
		$list=M('Product')->field($field)->order($orderstr)->limit($page*20,($page+1)*20)->select();
		if(!$list)$list=array();
		header('Content-Type: text/plain; charset=utf-8');
		echo json_encode($list);
		// var_dump($list);
		//$this->assign('list',$list);
		//$this->display();
	}

	/* 文档模型列表页 */
	public function lists($p = 1){
		/* 分类信息 */
		$category = $this->category();

		/* 获取当前分类列表 */
		$Document = D('Document');
		$list = $Document->page($p, $category['list_row'])->lists($category['id']);
		if(false === $list){
			$this->error('获取列表数据失败');
		}

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('list', $list);
		$this->display($category['template_lists']);
	}

	/* 文档模型详情页 */
	public function detail($id = 0, $p = 1){
		cookie('forward',$_SERVER['REQUEST_URI']);
		/* 标识正确性检测 */
		$cate_id = (int)I('cate_id');
		$this->assign('cate_id',$cate_id);
		if ($_SESSION['user']['id']!="") {
        	# code...
        	$lv =M('user')->where('id= '.$_SESSION['user']['id'])->getField('lv');
        	$gzk =M('grade')->where('id ='.$lv)->getField('gzk');
			
        }
        if (!$gzk)$gzk=1;
        $this->assign('gzk',$gzk);

		if(!($id && is_numeric($id))){
			$this->error('ID错误！');
		}


		/* 页码检测 */
		$p = intval($p);
		$p = empty($p) ? 1 : $p;
		
		/* 获取详细信息 */
		$Document = D('Product');
		$info = $Document->detail($id);
// 		$a = htmlspecialchars_decode($info['description']);
		if(!$info){
			$this->error($Document->getError());
		}
		//var_dump($info);exit;
		$category=M('Category')->where('id='.$info['category_id'])->find();
		$model=M('Model')->where('id='.$category['model'])->find();
		$this->assign('model', $model);
		//获取表单字段排序
        $fields = get_model_attribute($model['id']);
        $this->assign('fields',     $fields);
		//var_dump(parse_config_attr($category['model']));exit;
		//获取所有品牌
		$brandlist	=	M('Brand')->select();
		foreach($brandlist as $item)
		{
			$brandarr[$item['id']]=$item['title'];
		}
		$this->assign('brandarr', $brandarr);

		//获取幻灯片
		$map['id']=	array('in',$info['imglist']);
		$piclist=M('Picture')->where($map)->select();
		$this->assign('piclist', $piclist);

		/* 分类信息 */
		$category = $this->category($info['category_id']);

		/* 获取模板 */
		if(!empty($info['template'])){//已定制模板
			$tmpl = $info['template'];
		} elseif (!empty($category['template_detail'])){ //分类已定制模板
			$tmpl = $category['template_detail'];
		} else { //使用默认模板
			$tmpl = 'Product/'. get_document_model($info['model_id'],'name') .'/detail';
		}

		$attrs_titles_arr	=	explode(',',$info['attrs_titles']);
		$attrs_values_arr	=	explode(',',$info['attrs_values']);
		//var_dump($attrs_values_arr);exit;
		$i=0;
		foreach($attrs_titles_arr as $key=>$item)
		{
			$arr[$i]['title']=$item;
			$arr[$i]['list']=explode('=',$attrs_values_arr[$key]);
			$i++;
		}
		//var_dump($arr);exit;
		//exit;
		$this->assign('attrs_titles_arr', $arr);
		
		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');

		$is_login=0;
		$is_vip=0;
		if(isset($_SESSION['user']))
		{
			$is_login=1;
			$user=M('User')->where('id='.$_SESSION['user']['id'])->find();
			//var_dump($user);exit;
			if($user && $user['type']==1)
			{
				$is_vip=1;
			}
		}
		$this->assign('is_vip',$is_vip);
		$this->assign('is_login',$is_login);
		//if($is_vip==1)$info['gprice']=$info['gvipprice'];
		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		//print_r($info);

		if ($gzk>0) {
			$info['gprice'] = round($info['gprice']*$gzk,2);
			$info['market_price'] = round($info['market_price']*$gzk,2);
		}
		
		$this->assign('info', $info);
		$this->assign('page', $p); //页码
		//获取是否收藏过
		$is_coll=0;
		if($_SESSION['user']['id']>0)
		{
			$map	=	array();
			$map['product_id']	=	$id;
			$map['user_id']	=	$_SESSION['user']['id'];
			$collection=M('Collection')->where($map)->find();
			if($collection)
			{
				$is_coll=1;
			}
		}
		$this->assign('is_coll',$is_coll);
		if($_SESSION['user']['id']>0)
		{
			$map	=	array();
			$map['user_id']=$_SESSION['user']['id'];
			$map['product_id']=$id;
			M('History')->where($map)->delete();
			$count=M('History')->where($map)->count();
			if($count>=20)
			{
				M('History')->where('user_id='.$_SESSION['user']['id'])->order('id asc')->limit(1)->delete();
				//echo M('History')->getlastsql();exit;
			}
			$data	=	array();
			$data['user_id']	=	$_SESSION['user']['id'];
			$data['product_id']	=	$id;
			$data['addtime']	=	time();
			M('History')->add($data);
		}
		//获取总评论数
		$map=array();
		$map['product_id']=$id;
		$map['status'] = 1;
		$evaluate_num=M('Evaluate')->where($map)->count();
		$this->assign('evaluate_num',$evaluate_num);
		//获取全部评论列表
		$all_evaluate_list=M('Evaluate')->where($map)->order('id desc')->select();
		$total_score=0;
		foreach($all_evaluate_list as $item)
		{
			$total_score+=$item['score'];
		}
		$total_score=round($total_score/($evaluate_num));
		$this->assign('total_score',$total_score);
		//echo $total_score;exit;
		$all_evaluate_lists=M('Evaluate')->where($map)->order('id desc')->limit(10)->select();
		$this->assign('all_evaluate_list',$all_evaluate_lists);
		//获取好评列表
		$map['score'] =	array('gt','3');
		$hao_evaluate_list=M('Evaluate')->where($map)->order('id desc')->limit(10)->select();
		$this->assign('hao_evaluate_list',$hao_evaluate_list);
		//获取差评列表
		$map['score']	=	array('lt','4');
		$cha_evaluate_list=M('Evaluate')->where($map)->order('id desc')->limit(10)->select();
		$this->assign('cha_evaluate_list',$cha_evaluate_list);
		//获取所有用户
		$map	=	array();
		$userlist=	M('User')->where($map)->select();
		foreach($userlist as $item)
		{
			$userarr[$item['id']]=$item;
		}
		$this->assign('userarr',$userarr);
		//获取购物车数量
		$map			=	array();
		$map['user_id']	=	$_SESSION['user']['id'];
		$cart_num		=	M('Cart')->where($map)->count();
		$this->assign('cart_num',$cart_num);
		$share_user_id	=	intval(I('share_user'));//获取分享人
		$this->assign('share_user_id',$share_user_id);
		
		$sharedesc = "馋猫解馋网是馋猫（天津）网络科技有限公司打造的国内首家专业的水产品电子商务服务平台，主要从事无公害鱼、虾、蟹等水产品的批发零售以及线下体验店的联盟销售。";
		$desc = cookie('product_'.$id);
		if (trim($desc)){
			$sharedesc = $desc;
		}
		$qian=array("\t","\n","\r");
		$sharedesc = str_replace($qian, '', $sharedesc);
		
		$this->assign('sharedesc',$sharedesc);
		$this->display();
	}
	
	/**
	 * 编辑分享描述
	 */
	public function editdes(){
		$userid = $_SESSION['user']['id'];
		$user = M('user')->where('id='.$userid)->find();
		$grade = M('grade')->where('id='.$user['lv'])->find();
		if ($grade)$zk = $grade['gzk'];
		if(!$zk) $zk = 1;
		$id = (int)I('id');
		$product = M('product')->where('id='.$id)->find();
		$product['market_price'] = $product['market_price']*$zk;
		$product['gprice'] = $product['gprice']*$zk;
		$this->assign('pro',$product);
		$desc = cookie('product_'.$id);
		if (!$desc) $desc = "馋猫解馋网是馋猫（天津）网络科技有限公司打造的国内首家专业的水产品电子商务服务平台，主要从事无公害鱼、虾、蟹等水产品的批发零售以及线下体验店的联盟销售。";
		$this->assign('desc',$desc);
		if(IS_POST){
			$content = trim(I('content'));
			$id = (int)I('id');
			if ($content){
				cookie('product_'.$id,$content);
			}else{
				cookie('product_'.$id,null);
			}
			$this->success('',U('Product/detail',array('id'=>$id)));
		}
		
		$this->display();
	}
	/**
	 * 商品的评价
	 */
	public function pingjia(){
		$id = (int)I('id');
		//获取总评论数
		$map=array();
		$map['product_id']=$id;
		$map['status'] = 1;
		$evaluate_num=M('Evaluate')->where($map)->count();
		$this->assign('evaluate_num',$evaluate_num);
		//获取全部评论列表
		$all_evaluate_list=M('Evaluate')->where($map)->order('id desc')->select();
		$total_score=0;
		foreach($all_evaluate_list as $item)
		{
			$total_score+=$item['score'];
		}
		$total_score=round($total_score/($evaluate_num));
		$this->assign('total_score',$total_score);
		//echo $total_score;exit;
		$all_evaluate_lists=M('Evaluate')->where($map)->order('id desc')->limit(10)->select();
		$this->assign('all_evaluate_list',$all_evaluate_lists);
		//获取好评列表
		$map['score'] =	array('gt','3');
		$hao_evaluate_list=M('Evaluate')->where($map)->order('id desc')->limit(10)->select();
		$this->assign('hao_evaluate_list',$hao_evaluate_list);
		//获取差评列表
		$map['score']	=	array('lt','4');
		$cha_evaluate_list=M('Evaluate')->where($map)->order('id desc')->limit(10)->select();
		$this->assign('cha_evaluate_list',$cha_evaluate_list);
		//获取所有用户
		$map	=	array();
		$userlist=	M('User')->where($map)->select();
		foreach($userlist as $item)
		{
			$userarr[$item['id']]=$item;
		}
		$this->assign('userarr',$userarr);
		$this->assign('id',$id);
		$this->display();
	}

	// 二维码分享页
	public function fenxiang(){
		$picurl = './Public/share/img/chanmao.jpg';
		if(!file_exists($picurl)){
			$this->createtwo();
		}
		$this->display();
	}

	
	//生成二维码
	protected function createtwo($uid = 0){
		$jssdk = new \Home\Tool\JssdkController();
		 
		$access_token = $jssdk->getAccessToken();
		$tokenurl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token={$access_token}";
		
		 //{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id": 123}}}
		 $option = "{\"action_name\":\"QR_LIMIT_SCENE\",\"action_info\":{\"scene\":{\"scene_id\":{$uid}}}}";
		 $curl = curl_init($tokenurl);
		 curl_setopt($curl, CURLOPT_POST, true);
		 curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		 curl_setopt($curl, CURLOPT_POSTFIELDS , $option);
		 $res = curl_exec($curl);
		 curl_close($curl);
		 
		 // {"ticket":"gQFY8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL016bFlBZlRtOXVhUExtclQ3eFhMAAIED4MmWAMEAAAAAA==","url":"http:\/\/weixin.qq.com\/q\/MzlYAfTm9uaPLmrT7xXL"}
		 $res = json_decode($res);
		 $ticket = urlencode($res->ticket);
		 $twourl = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket={$ticket}";
		 $two = file_get_contents($twourl);
		 file_put_contents('./Public/share/img/chanmao.jpg',$two);
	}
	
	//新闻详情
	public function newsdetail($id)
	{
		$news=M('News')->where('id='.$id)->find();
		$this->assign('news',$news);
// 		print_r($news);die;
		$this->display();
	}

	/* 文档分类检测 */
	private function category($id = 0){
		/* 标识正确性检测 */
		$id = $id ? $id : I('get.category', 0);
		if(empty($id)){
			$this->error('没有指定文档分类！');
		}

		/* 获取分类信息 */
		$category = D('Category')->info($id);
		if($category && 1 == $category['status']){
			switch ($category['display']) {
				case 0:
					$this->error('该分类禁止显示！');
					break;
				//TODO: 更多分类显示状态判断
				default:
					return $category;
			}
		} else {
			$this->error('分类不存在或被禁用！');
		}
	}

	//收藏
	public function addcollection()
	{
		$product_id	=	intval(I('product_id'));
		$user_id	=	$_SESSION['user']['id'];
		if($user_id<1)
		{
			$this->error('请登陆');
		}
		$map	=	array();
		$map['product_id']	=	$product_id;
		$map['user_id']	=	$_SESSION['user']['id'];
		$collection=M('Collection')->where($map)->find();
		if($collection)
		{
			M('Collection')->where($map)->delete();
			$this->success('取消成功');
		}
		else
		{
			$data['product_id']	=	$product_id;
			$data['user_id']	=	$_SESSION['user']['id'];
			$data['addtime']	=	time();
			M('Collection')->add($data);
			$this->success('收藏成功');
		}
	}
	//商品分类列表
	public function catelist()
	{
		$list=M('Category')->order('sort desc,id asc')->where('pid=0')->select();
		foreach($list as $key=>$item)
		{
			$list[$key]['list']=M('Category')->order('sort desc,id asc')->where('pid='.$item['id'])->select();
			foreach($list[$key]['list'] as $k=>$v)
			{
				$list[$key]['list'][$k]['list']=M('Category')->order('sort desc,id asc')->where('pid='.$v['id'])->select();
			}
		}
		$this->assign('list',$list);
		$this->display();
		//var_dump($list);
	}
	public function ajaxgetlist()
	{
		$cat_id	=	intval(I('catid'));
		$list=M('Category')->order('sort desc,id asc')->where('pid='.$cat_id)->select();
		if(!$list)$list=array();
		foreach($list as $key=>$item)
		{
			$list[$key]['list']=M('Category')->order('sort desc,id asc')->where('pid='.$item['id'])->select();
		}
		header('content-type:application/json;charset=utf8');
		echo json_encode($list);exit;
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
			$map['score'] =	array('gt',3);
		}
		if ($state==2){
			//差评
			$map['score'] =	array('lt',4);
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
	
	public function getpriceattr()
	{
		$userid = $_SESSION['user']['id'];
		file_put_contents('s.txt', $userid);
		$zk = 1;
		$user = M('user')->where('id='.$userid)->find();
		$grade = M('grade')->where('id='.$user['lv'])->find();
		if($grade) $zk = $grade['gzk'];
		$product_id	=	I('post.product_id');
		$product_attr=	rtrim(I('post.attr'));
		if(empty($product_attr))
		{
			//$this->error('请选择属性');
		}
		$attrlist=explode(',',$product_attr);
		$attr='';
		foreach($attrlist as $item)
		{
			list($name,$val)=explode('=',$item);
			$attr.=$val;
		}
		
		$map['product_id'] = $product_id;
		$map['attr_value'] = $attr;
		$row = M('ProductAttr')->where($map)->find();
		if(!$row||$row['price']<=0)
		{
			$map	=	array();
			$map['id']	=	$product_id;
			$rs = M('Product')->where($map)->find();
			$row['oldprice'] = $rs['market_price'];
			$row['price']=$rs['gprice'];
		}
		$row['price'] = round($row['price']*$zk,2);
		$row['oldprice'] = round($row['oldprice']*$zk,2);
		header('content-type:application/json;charset=utf8');
		echo json_encode($row);exit;
	}

}
