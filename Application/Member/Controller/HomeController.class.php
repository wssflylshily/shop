<?php

namespace Member\Controller;
use Think\Controller;

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}


    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置

        /*if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }*/
		$this->login();
		$this->user = $_SESSION['user'];
		$user = M('user')->where('id='.$this->user['id'])->find();
		$grade = M('grade')->select();
		foreach($grade as $k=>$v){
			if ($user['integral']>=$v['glimit']){
				M('user')->where('id='.$this->user['id'])->save(array('lv'=>$v['id']));
			}
		}
		
		//批量修改订单状态，将发货7天之后未确认收货的订单改为已收货
		$where = "user_id=".$user['id']." and status=2 and is_drawback=0 and is_del=0";
		$orders = M('order')->where($where)->select();
		$time = 60*60*24*7;//604800
		foreach ($orders as $key=>$val){
			if ((time()-$val['sendtime'])>$time){
				M('order')->where('id='.$val['id'])->setField('status',3);
				$orderuser = M('user')->where('id='.$val['user_id'])->find();
				$jifenrat = getPayRatio();
				$jifen = round($jifenrat*($val['money']),2);
				M('user')->where('id='.$val['user_id'])->save(array('integral'=>$orderuser['integral']+$jifen));
				//增加积分来源记录
				$item['user_id'] = $user['id'];
				$item['integral'] = round($jifen,2);
				$item['title'] = "购买商品，订单编号：".$val['sn'];
				$item['type'] = 3;
				$item['orderid'] = $val['id'];
				$item['addtime'] = time();
				M('integral_record')->add($item);
				$parent = M('user')->where('id='.$orderuser['parent_user_id'])->find();
				//获取分佣比例
				$ratio = getBrokerage();
				$money = $val['money']*$ratio;
				if ($parent&&$money>0){
					$datas = array();
					$datas['user_id'] = $user['id'];
					$datas['parent_id'] = $parent['id'];
					$datas['order_type'] = 1;
					$datas['order_id'] = $val['id'];
					$datas['order_sn'] = $val['sn'];
					$datas['order_money'] = $val['money'];
					$datas['money'] = $money;
					$datas['addtime'] = time();
					M('brokerage_record')->add($item);
					//更改分销人员的账户余额和佣金总额
					M('user')->where('id='.$user['parent_user_id'])->save(array('money'=>$parent['money']+$money,'jie_money'=>$parent['jie_money']+$money));
					//写入上级人员的收入来源
					$items = array();
					$items['user_id'] = $user['parent_user_id'];
					$items['money'] = $money;
					$items['recharge_type'] = 2;
					$items['type'] = 1;
					$items['title'] = "购买商品分佣，订单编号：".$val['sn'];
					$items['order_type'] = 1;
					$items['order_id'] = $val['id'];
					$items['addtime'] = time();
					M('account_record')->add($items);
				}
			}
		}
		
		$spells = M('spellorder')->where($where)->select();
		foreach($spells as $k1=>$v1){
			if((time()-$v1['sendtime'])>$time){
				M('spellorder')->where('id='.$v1['id'])->setField('status',3);
				$suser = M('user')->where('id='.$v1['usre_id'])->find();
				$jifenrat = getPayRatio();
				$sjifen = round($jifenrat*($v1['money']),2);
				if ($sjifen) {
					M('user')->where('id='.$v1['user_id'])->save(array('integral'=>$suser['integral']+$sjifen));
					//添加积分记录
					$item = array();
					$item['user_id'] = $v1['user_id'];
					$item['title'] = "参加拼团，订单编号：".$v1['sn'];
					$item['integral'] = $sjifen;
					$item['type'] = 4;
					$item['orderid'] = $v1['id'];
					$item['addtime'] = time();
					M('integral_record')->add($item);
				}
				//获取分佣比例
				$ratio = getBrokerage();
				$smoney = $v1['money']*$ratio;
				$sparent = M('user')->where('id='.$suser['parent_user_id'])->find();
				if($sparent&&$smoney>0){
					//增加分佣明细
					$item = array();
					$item['parent_id'] = $suser['parent_user_id'];
					$item['user_id'] = $v1['user_id'];
					$item['order_type'] = 2;
					$item['order_id'] = $v1['id'];
					$item['order_sn'] = $v1['sn'];
					$item['order_money'] = $v1['money'];
					$item['money'] = $smoney;
					$item['addtime'] = time();
					M('brokerage_record')->add($item);
						
					//更改分销人员的账户余额和佣金总额
					M('user')->where('id='.$user['parent_user_id'])->save(array('money'=>$sparent['money']+$smoney,'jie_money'=>$parent['jie_money']+$money));
					//写入收入来源
					$items = array();
					$items['user_id'] = $suser['parent_user_id'];
					$items['money'] = $smoney;
					$items['recharge_type'] = 2;
					$items['type'] = 1;
					$items['title'] = "拼团分佣，订单编号：".$v1['sn'];
					$items['order_type'] = 2;
					$items['order_id'] = $v1['id'];
					$items['addtime'] = time();
					M('account_record')->add($items);
				}
			}
		}
		
		
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
	/* 用户登录检测 */
	protected function login(){
		/* 用户登录检测 */
		if(!isset($_SESSION['user']))
		{
			$this->redirect("/Member/Login");
		}
	}
	// ================查询数据======================
    public function index() {
		$model_name	=	$this->model_name?$this->model_name:CONTROLLER_NAME;
        $model = D($model_name);
		$this->_list($model);
		cookie('forward',$_SERVER['REQUEST_URI']);
		$this->display();
    }
	 /**
     * 通用列表函数，带分页功能
     * @param array $list 列表数据
     * 1、支持外部参数$_REQUEST['orderField']、$_REQUEST['orderDirection']
     * 2、支持内部参数$model,$map,$orderBy,$asc,$join
	 * 3、参数$join可支持字符串或数组
	 * join(array(' __WORK__ ON __ARTIST__.id = __WORK__.artist_id','__CARD__ ON __ARTIST__.card_id = __CARD__.id'))
     * join(array(' LEFT JOIN __WORK__ ON __ARTIST__.id = __WORK__.artist_id','RIGHT JOIN __CARD__ ON __ARTIST__.card_id = __CARD__.id'))
	 * join('__WORK__ ON __ARTIST__.id = __WORK__.artist_id')
	 * __WORK__和 __CARD__在最终解析的时候会转换为 prefix_work和 prefix_card
	 */
	protected function _list($model, $map=array(), $field="*",$join, $orderBy = '', $asc = TRUE ) {
		//排序字段 默认为主键名
        $REQUEST    =   (array)I('request.');
		if (isset ( $_REQUEST['orderField'] )) {
			$order = $_REQUEST['orderField'];
		} else {
			$order = ! empty( $orderBy ) ? $orderBy : $model->getPk ();
		}

		if (method_exists ( $this, '_filter' )) {
			$this->_filter ( $map );
		}
		
		//排序方式默认按照倒序排列
		if (isset ( $_REQUEST['orderDirection'] )) {
			$sort = (strtolower($_REQUEST ['orderDirection']) == 'asc') ? 'asc' : 'desc';
		} else {
			$sort = $asc ? 'desc' : 'asc';
		}
		$map['user_id']=$this->user['id'];
		//取得满足条件的记录数
		if(!isset($join) or empty($join))
		{
			$count = $model->where ( $map )->count ();
		}
		else
		{
			$count = $model->where ( $map )->join($join)->count ();
		}
		//echo $model->getlastsql();exit;
		if ($count > 0) {
			//import ( "ORG.Util.Page" );
			//import("Think/Page");//导入分页类
			//echo C('PAGE_NUM');exit;
			$p = new \Think\Page($count, C('PAGE_NUM'));
			//var_dump($p);exit;
			//分页查询数据，增加关联模型
			if(!isset($join) or empty($join))
			{
				$voList = $model->where($map)->order($order . " " . $sort)->limit($p->firstRow.','.$p->listRows)->field($field)->select();
			}
			else
			{
				$voList = $model->where($map)->join($join)->order($order . " " . $sort)->limit($p->firstRow.','.$p->listRows)->field($field)->select();
			}
			//echo $model->getLastSQL();exit;
			
			//echo $model->getlastsql();exit;
			//分页跳转的时候保证查询条件
			foreach ( $map as $key => $val ) {
				if($key=='_string')continue;
				if (! is_array ( $val )) {
					$p->parameter .= "$key=" . urlencode ( $val ) . "&";
				}
			}
			
			//分页显示
			$page = $p->show ();
			
			//列表排序显示
			$sortImg = $sort; //排序图标
			$sortAlt = $sort == 'desc' ? '升序排列' : '倒序排列'; //排序提示
			$sort = $sort == 'desc' ? 1 : 0; //排序方式
			
			//var_dump($voList);exit;
			//模板赋值显示
			$this->assign ( 'list', $voList );
			$this->assign ( 'sort', $sort );
			$this->assign ( 'order', $order );
			$this->assign ( 'sortImg', $sortImg );
			$this->assign ( 'sortType', $sortAlt );
			$this->assign ( "page", $page );
			$this->assign ( 'totalcount', $count );
			$this->assign ( 'numPerPage', C('PAGE_NUM') );
			$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
		}
		return;
	}

	// ================添加页面======================
	public function add()
	{
        $this->_add();
		$this->display();
	}
	public function _add()
	{
        $this->assign("__forward__",$_SERVER["HTTP_REFERER"]);
	}
	
	// ================写入数据======================
    public function insert() {
		$this->_insert();
    }
	//快速插入，支持post参数传递和修改
    public function _insert($data,$model) {
		if(!is_object($model))
		{
			$model_name	=	$this->model_name?$this->model_name:CONTROLLER_NAME;
			//echo $model_name;exit;
			$model = D($model_name);
			//var_dump($model);exit;
		}
        if ($model->create()) 
		{
			if(!empty($data))
			{
				foreach($data as $key=>$value)
				{
					$model->__set($key,$value);
				}
			}
			$model->__set('user_id',$this->user['id']);
			$flag = $model->add();
			//echo $model->getlastsql();exit;
            if ($flag !== false) 
			{
				if(!empty($_POST['__forward__']))
				{
					$this->success("数据保存成功!",$_POST['__forward__']);
				}
				else
				{
					$this->success("数据保存成功!");
				}
            }
			else
			{
				$error=$model->getError();
				$this->error(empty($error) ? '未知错误！' : $error);
            }
        }
		else
		{
			$error=$model->getError();
            $this->error(empty($error) ? '未知错误！' : $error);
        }
    }
	
	// ================编辑数据======================
	public function edit()
	{
		$this->_edit();
		$this->display();
	}
	//返回当前查询记录
    public function _edit($model) {
		$id=I('get.id');
        if (!empty($id)) {
			if(!is_object($model))
			{
				$model_name	=	$this->model_name?$this->model_name:CONTROLLER_NAME;
				$model = D($model_name);
			}
            $vo = $model->getById($id);
            if ($vo) {
                $this->vo   =   $vo;
				$this->assign("__forward__",$_SERVER["HTTP_REFERER"]);
                return $vo;
            } else {
				$error=$model->getError();
				$this->error(empty($error) ? '未知错误！' : $error);
				exit;
            }
        } else {
			$error=$model->getError();
			$this->error(empty($error) ? '未知错误！' : $error);
			exit;
        }
    }

	// ================更新数据======================
    public function update() {
		$this->_update();
	}
    public function _update($data,$model) {
		if(!is_object($model))
		{
			$model_name	=	$this->model_name?$this->model_name:CONTROLLER_NAME;
			$model = D($model_name);
 		}
		if ($vo = $model->create()) {
			if(!empty($data))
			{
				foreach($data as $key=>$value)
				{
					$model->__set($key,$value);
				}
			}
            $list = $model->save();
            if ($list !== false) {
				if(!empty($_POST['__forward__']))
				{
					$this->success("数据更新成功!",$_POST['__forward__']);
				}
				else
				{
					$this->success("数据更新成功!");
				}
            } else {
				$error=$model->getError();
				$this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
			$error=$model->getError();
			$this->error(empty($error) ? '未知错误！' : $error);
        }
    }

 	// ================删除数据======================
    public function del() {
		$id	=	$_REQUEST['id'];//I('post.id');
		if(empty($id))$id=$_REQUEST['ids'];
        if (!empty($id)) {
			//var_dump($id);exit;
			$model_name	=	$this->model_name?$this->model_name:CONTROLLER_NAME;
			$model = D($model_name);
			$where['id']=	is_array($id)?array('in',$id):$id;
			$where['user_id']=$this->user['id'];
			$result = $model->where($where)->delete($id);
			//echo $model->getlastsql();exit;
            if (false !== $result) {
				$this->success('删除成功！');
            } else {
				$error=$model->getError();
				$this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
 			$this->error('ID错误！');
        }
    }

	/**
	* 上传单图片
	* 参数：$file_name	上传文件类
	* 返回：上传之后路径
	*/
	protected function getOneUpload($file_name)
	{
		$config['maxSize']	=	5*1024*1024;//C('MAXSIZE') ;// 设置附件上传大小
		$config['exts']		=	'jpg,gif,png,jpeg';//C('ALLOWEXTS') ;// 设置附件上传大小
		$config['rootPath']	=	'./Uploads'; // 设置附件上传目录
		$upload = new \Think\Upload();// 实例化上传类
		// 上传单个文件     
		$info   =   $upload->uploadOne($_FILES[$file_name]);    
		if(!$info)return false;
		// 上传成功 获取上传文件信息         
		return './Uploads/'.$info['savepath'].$info['savename'];    
	}
}
