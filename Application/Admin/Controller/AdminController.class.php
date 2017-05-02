<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Think\Controller;
use Admin\Model\AuthRuleModel;
use Admin\Model\AuthGroupModel;
/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class AdminController extends Controller {

    /**
     * 后台控制器初始化
     */
    protected function _initialize(){
        // 获取当前用户ID
        define('UID',is_login());
        if( !UID ){// 还没登录 跳转到登录页面
            $this->redirect('Public/login');
        }
        /* 读取数据库中的配置 */
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
        }
        C($config); //添加配置

        // 是否是超级管理员
        define('IS_ROOT',   is_administrator());
        if(!IS_ROOT && C('ADMIN_ALLOW_IP')){
            // 检查IP地址访问
            if(!in_array(get_client_ip(),explode(',',C('ADMIN_ALLOW_IP')))){
                $this->error('403:禁止访问');
            }
        }
        // 检测访问权限
        $access =   $this->accessControl();
        if ( $access === false ) {
            $this->error('403:禁止访问');
        }elseif( $access === null ){
            $dynamic        =   $this->checkDynamic();//检测分类栏目有关的各项动态权限
            if( $dynamic === null ){
                //检测非动态权限
                $rule  = strtolower(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME);
                if ( !$this->checkRule($rule,array('in','1,2')) ){
                    $this->error('未授权访问!');
                }
            }elseif( $dynamic === false ){
                $this->error('未授权访问!');
            }
        }
        $this->assign('__MENU__', $this->getMenus());
    }

    /**
     * 权限检测
     * @param string  $rule    检测的规则
     * @param string  $mode    check模式
     * @return boolean
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final protected function checkRule($rule, $type=AuthRuleModel::RULE_URL, $mode='url'){
        if(IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        static $Auth    =   null;
        if (!$Auth) {
            $Auth       =   new \Think\Auth();
        }
        if(!$Auth->check($rule,UID,$type,$mode)){
            return false;
        }
        return true;
    }

    /**
     * 检测是否是需要动态判断的权限
     * @return boolean|null
     *      返回true则表示当前访问有权限
     *      返回false则表示当前访问无权限
     *      返回null，则会进入checkRule根据节点授权判断权限
     *
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    protected function checkDynamic(){
        if(IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        return null;//不明,需checkRule
    }


    /**
     * action访问控制,在 **登陆成功** 后执行的第一项权限检测任务
     *
     * @return boolean|null  返回值必须使用 `===` 进行判断
     *
     *   返回 **false**, 不允许任何人访问(超管除外)
     *   返回 **true**, 允许任何管理员访问,无需执行节点权限检测
     *   返回 **null**, 需要继续执行节点权限检测决定是否允许访问
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final protected function accessControl(){
        if(IS_ROOT){
            return true;//管理员允许访问任何页面
        }
		$allow = C('ALLOW_VISIT');
		$deny  = C('DENY_VISIT');
		$check = strtolower(CONTROLLER_NAME.'/'.ACTION_NAME);
        if ( !empty($deny)  && in_array_case($check,$deny) ) {
            return false;//非超管禁止访问deny中的方法
        }
        if ( !empty($allow) && in_array_case($check,$allow) ) {
            return true;
        }
        return null;//需要检测节点权限
    }

    /**
     * 对数据表中的单行或多行记录执行修改 GET参数id为数字或逗号分隔的数字
     *
     * @param string $model 模型名称,供M函数使用的参数
     * @param array  $data  修改的数据
     * @param array  $where 查询时的where()方法的参数
     * @param array  $msg   执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     * @author 朱亚杰  <zhuyajie@topthink.net>
     */
    final protected function editRow ( $model ,$data, $where , $msg ){
        $id    = array_unique((array)I('id',0));
        $id    = is_array($id) ? implode(',',$id) : $id;
        $where = array_merge( array('id' => array('in', $id )) ,(array)$where );
        $msg   = array_merge( array( 'success'=>'操作成功！', 'error'=>'操作失败！', 'url'=>'' ,'ajax'=>IS_AJAX) , (array)$msg );
        if( M($model)->where($where)->save($data)!==false ) {
            $this->success($msg['success'],$msg['url'],$msg['ajax']);
        }else{
            $this->error($msg['error'],$msg['url'],$msg['ajax']);
        }
    }

    /**
     * 禁用条目
     * @param string $model 模型名称,供D函数使用的参数
     * @param array  $where 查询时的 where()方法的参数
     * @param array  $msg   执行正确和错误的消息,可以设置四个元素 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     * @author 朱亚杰  <zhuyajie@topthink.net>
     */
    protected function forbid ( $model , $where = array() , $msg = array( 'success'=>'状态禁用成功！', 'error'=>'状态禁用失败！')){
        $data    =  array('status' => 0);
        $this->editRow( $model , $data, $where, $msg);
    }

    /**
     * 恢复条目
     * @param string $model 模型名称,供D函数使用的参数
     * @param array  $where 查询时的where()方法的参数
     * @param array  $msg   执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     * @author 朱亚杰  <zhuyajie@topthink.net>
     */
    protected function resume (  $model , $where = array() , $msg = array( 'success'=>'状态恢复成功！', 'error'=>'状态恢复失败！')){
        $data    =  array('status' => 1);
        $this->editRow(   $model , $data, $where, $msg);
    }

    /**
     * 还原条目
     * @param string $model 模型名称,供D函数使用的参数
     * @param array  $where 查询时的where()方法的参数
     * @param array  $msg   执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     * @author huajie  <banhuajie@163.com>
     */
    protected function restore (  $model , $where = array() , $msg = array( 'success'=>'状态还原成功！', 'error'=>'状态还原失败！')){
        $data    = array('status' => 1);
        $where   = array_merge(array('status' => -1),$where);
        $this->editRow(   $model , $data, $where, $msg);
    }

    /**
     * 条目假删除
     * @param string $model 模型名称,供D函数使用的参数
     * @param array  $where 查询时的where()方法的参数
     * @param array  $msg   执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     * @author 朱亚杰  <zhuyajie@topthink.net>
     */
    protected function delete ( $model , $where = array() , $msg = array( 'success'=>'删除成功！', 'error'=>'删除失败！')) {
        $data['status']         =   -1;
        $data['update_time']    =   NOW_TIME;
        $this->editRow(   $model , $data, $where, $msg);
    }

    /**
     * 设置一条或者多条数据的状态
     */
    public function setStatus($Model=CONTROLLER_NAME){

        $ids    =   I('request.ids');
        $status =   I('request.status');
        if(empty($ids)){
            $this->error('请选择要操作的数据');
        }

        $map['id'] = array('in',$ids);
        switch ($status){
            case -1 :
                $this->delete($Model, $map, array('success'=>'删除成功','error'=>'删除失败'));
                break;
            case 0  :
                $this->forbid($Model, $map, array('success'=>'禁用成功','error'=>'禁用失败'));
                break;
            case 1  :
                $this->resume($Model, $map, array('success'=>'启用成功','error'=>'启用失败'));
                break;
            default :
                $this->error('参数错误');
                break;
        }
    }

    /**
     * 获取控制器菜单数组,二级菜单元素位于一级菜单的'_child'元素中
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final public function getMenus($controller=CONTROLLER_NAME){
        // $menus  =   session('ADMIN_MENU_LIST'.$controller);
        if(empty($menus)){
            // 获取主菜单
            $where['pid']   =   0;
            $where['hide']  =   0;
            if(!C('DEVELOP_MODE')){ // 是否开发者模式
                $where['is_dev']    =   0;
            }
            $menus['main']  =   M('Menu')->where($where)->order('sort asc')->select();

            $menus['child'] = array(); //设置子节点

            //高亮主菜单
            $current = M('Menu')->where("url like '%{$controller}/".ACTION_NAME."%'")->field('id')->find();
            if($current){
                $nav = D('Menu')->getPath($current['id']);
                $nav_first_title = $nav[0]['title'];

                foreach ($menus['main'] as $key => $item) {
                    if (!is_array($item) || empty($item['title']) || empty($item['url']) ) {
                        $this->error('控制器基类$menus属性元素配置有误');
                    }
                    if( stripos($item['url'],MODULE_NAME)!==0 ){
                        $item['url'] = MODULE_NAME.'/'.$item['url'];
                    }
                    // 判断主菜单权限
                    if ( !IS_ROOT && !$this->checkRule($item['url'],AuthRuleModel::RULE_MAIN,null) ) {
                        unset($menus['main'][$key]);
                        continue;//继续循环
                    }

                    // 获取当前主菜单的子菜单项
                    if($item['title'] == $nav_first_title){
                        $menus['main'][$key]['class']='current';
                        //生成child树
                        $groups = M('Menu')->where("pid = {$item['id']}")->distinct(true)->field("`group`")->select();
                        if($groups){
                            $groups = array_column($groups, 'group');
                        }else{
                            $groups =   array();
                        }

                        //获取二级分类的合法url
                        $where          =   array();
                        $where['pid']   =   $item['id'];
                        $where['hide']  =   0;
                        if(!C('DEVELOP_MODE')){ // 是否开发者模式
                            $where['is_dev']    =   0;
                        }
                        $second_urls = M('Menu')->where($where)->getField('id,url');

                        if(!IS_ROOT){
                            // 检测菜单权限
                            $to_check_urls = array();
                            foreach ($second_urls as $key=>$to_check_url) {
                                if( stripos($to_check_url,MODULE_NAME)!==0 ){
                                    $rule = MODULE_NAME.'/'.$to_check_url;
                                }else{
                                    $rule = $to_check_url;
                                }
                                if($this->checkRule($rule, AuthRuleModel::RULE_URL,null))
                                    $to_check_urls[] = $to_check_url;
                            }
                        }
                        // 按照分组生成子菜单树
                        foreach ($groups as $g) {
                            $map = array('group'=>$g);
                            if(isset($to_check_urls)){
                                if(empty($to_check_urls)){
                                    // 没有任何权限
                                    continue;
                                }else{
                                    $map['url'] = array('in', $to_check_urls);
                                }
                            }
                            $map['pid'] =   $item['id'];
                            $map['hide']    =   0;
                            if(!C('DEVELOP_MODE')){ // 是否开发者模式
                                $map['is_dev']  =   0;
                            }
                            $menuList = M('Menu')->where($map)->field('id,pid,title,url,tip')->order('sort asc')->select();
                            $menus['child'][$g] = list_to_tree($menuList, 'id', 'pid', 'operater', $item['id']);
                        }
                        if($menus['child'] === array()){
                            //$this->error('主菜单下缺少子菜单，请去系统=》后台菜单管理里添加');
                        }
                    }
                }
            }
            // session('ADMIN_MENU_LIST'.$controller,$menus);
        }
        return $menus;
    }

    /**
     * 返回后台节点数据
     * @param boolean $tree    是否返回多维数组结构(生成菜单时用到),为false返回一维数组(生成权限节点时用到)
     * @retrun array
     *
     * 注意,返回的主菜单节点数组中有'controller'元素,以供区分子节点和主节点
     *
     * @author 朱亚杰 <xcoolcc@gmail.com>
     */
    final protected function returnNodes($tree = true){
        static $tree_nodes = array();
        if ( $tree && !empty($tree_nodes[(int)$tree]) ) {
            return $tree_nodes[$tree];
        }
        if((int)$tree){
            $list = M('Menu')->field('id,pid,title,url,tip,hide')->order('sort asc')->select();
            foreach ($list as $key => $value) {
                if( stripos($value['url'],MODULE_NAME)!==0 ){
                    $list[$key]['url'] = MODULE_NAME.'/'.$value['url'];
                }
            }
            $nodes = list_to_tree($list,$pk='id',$pid='pid',$child='operator',$root=0);
            foreach ($nodes as $key => $value) {
                if(!empty($value['operator'])){
                    $nodes[$key]['child'] = $value['operator'];
                    unset($nodes[$key]['operator']);
                }
            }
        }else{
            $nodes = M('Menu')->field('title,url,tip,pid')->order('sort asc')->select();
            foreach ($nodes as $key => $value) {
                if( stripos($value['url'],MODULE_NAME)!==0 ){
                    $nodes[$key]['url'] = MODULE_NAME.'/'.$value['url'];
                }
            }
        }
        $tree_nodes[(int)$tree]   = $nodes;
        return $nodes;
    }


    /**
     * 通用分页列表数据集获取方法
     *
     *  可以通过url参数传递where条件,例如:  pay.html?name=asdfasdfasdfddds
     *  可以通过url空值排序字段和方式,例如: pay.html?_field=id&_order=asc
     *  可以通过url参数r指定每页数据条数,例如: pay.html?r=5
     *
     * @param sting|Model  $model   模型名或模型实例
     * @param array        $where   where查询条件(优先级: $where>$_REQUEST>模型设定)
     * @param array|string $order   排序条件,传入null时使用sql默认排序或模型属性(优先级最高);
     *                              请求参数中如果指定了_order和_field则据此排序(优先级第二);
     *                              否则使用$order参数(如果$order参数,且模型也没有设定过order,则取主键降序);
     *
     * @param array        $base    基本的查询条件
     * @param boolean      $field   单表模型用不到该参数,要用在多表join时为field()方法指定参数
     * @author 朱亚杰 <xcoolcc@gmail.com>
     *
     * @return array|false
     * 返回数据集
     */
    protected function lists ($model,$where=array(),$order='',$base = array('status'=>array('egt',0)),$field=true){
        $options    =   array();
        $REQUEST    =   (array)I('request.');
        if(is_string($model)){
            $model  =   M($model);
        }

        $OPT        =   new \ReflectionProperty($model,'options');
        $OPT->setAccessible(true);

        $pk         =   $model->getPk();
        if($order===null){
            //order置空
        }else if ( isset($REQUEST['_order']) && isset($REQUEST['_field']) && in_array(strtolower($REQUEST['_order']),array('desc','asc')) ) {
            $options['order'] = '`'.$REQUEST['_field'].'` '.$REQUEST['_order'];
        }elseif( $order==='' && empty($options['order']) && !empty($pk) ){
            $options['order'] = $pk.' desc';
        }elseif($order){
            $options['order'] = $order;
        }
        unset($REQUEST['_order'],$REQUEST['_field']);

        $options['where'] = array_filter(array_merge( (array)$base, /*$REQUEST,*/ (array)$where ),function($val){
            if($val===''||$val===null){
                return false;
            }else{
                return true;
            }
        });
        if( empty($options['where'])){
            unset($options['where']);
        }
        $options      =   array_merge( (array)$OPT->getValue($model), $options );
        $total        =   $model->where($options['where'])->count();

        if( isset($REQUEST['r']) ){
            $listRows = (int)$REQUEST['r'];
        }else{
            $listRows = C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        }
        $page = new \Think\Page($total, $listRows, $REQUEST);
        if($total>$listRows){
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        }
        $p =$page->show();
        $this->assign('_page', $p? $p: '');
        $this->assign('_total',$total);
        $options['limit'] = $page->firstRow.','.$page->listRows;

        $model->setProperty('options',$options);

        return $model->field($field)->select();
    }
	
	// ================查询数据======================
    public function index() {
		$model_name	=	$this->model_name?$this->model_name:CONTROLLER_NAME;
        $model = D($model_name);
		$this->_list($model);
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
		//取得满足条件的记录数
		if(!isset($join) or empty($join))
		{
			$count = $model->where ( $map )->count ();
		}
		else
		{
			$count = $model->where ( $map )->join($join)->count ();
		}
// 		echo $model->getlastsql();exit;
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
// 			echo $model->getLastSQL();exit;
			
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
			$filelist=$this->getUploads();
			foreach($filelist as $item)
			{
				$model->__set($item['key'],$item['savepath'].$item['savename']);
			}
			if(!empty($data))
			{
				foreach($data as $key=>$value)
				{
					$model->__set($key,$value);
				}
			}
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
			$filelist=$this->getUploads();
			if(count($filelist)>0)
			{
				$row	=	$model->where(array($model->getPk()=>intval($_POST[$model->getPk()])))->find();
				if(!$row)
				{
					$error=$model->getError();
					$this->error(empty($error) ? '未知错误！' : $error);
				}
				foreach($filelist as $item)
				{
					@unlink(C('SAVEPATH').$row[$item['key']]);
					$model->__set($item['key'],$item['savepath'].$item['savename']);
				}
			}
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
		$config['maxSize']	=	C('MAXSIZE') ;// 设置附件上传大小
		$config['exts']		=	C('ALLOWEXTS') ;// 设置附件上传大小
		$config['rootPath']	=	C('SAVEPATH').'imgs/'; // 设置附件上传目录
		$upload = new \Think\Upload();// 实例化上传类
		// 上传单个文件     
		$info   =   $upload->uploadOne($_FILES[$file_name]);    
		if(!$info)return false;
		// 上传成功 获取上传文件信息         
		return 'imgs/'.$info['savepath'].$info['savename'];    
	}
	/**
	* 上传多图片
	* 参数：无
	* 返回：Array
	*/
	protected function getUploads()
	{
		$config['maxSize']	=	C('MAXSIZE') ;// 设置附件上传大小
		$config['exts']		=	C('ALLOWEXTS') ;// 设置附件上传大小
		$config['rootPath']	=	C('SAVEPATH').'imgs/'; // 设置附件上传目录
		$upload = new \Think\Upload($config);// 实例化上传类
		$thumbPrefix='m_';
		$thumbMaxWidth='120';
		$thumbMaxHeight='140';
		$upload->thumb = true;
		//设置需要生成缩略图的文件后缀
		$upload->thumbPrefix = $thumbPrefix; //生产2张缩略图
		//设置缩略图最大宽度
		$upload->thumbMaxWidth = $thumbMaxWidth;
		//设置缩略图最大高度
		$upload->thumbMaxHeight = $thumbMaxHeight;
		// 上传文件 
		$list   =   $upload->upload();
		//var_dump($list);exit;
		if(!$list) return array();
		$image = new \Think\Image(); 
		foreach($list as $key=>$item)
		{
			$image->open(C('SAVEPATH').'imgs/'.$item['savepath'].$item['savename']);
			//将图片裁剪为400x400并保存为corp.jpg
			$savenamearr	=	explode('.',$item['savename']);
			$image->thumb(100, 100)->save(C('SAVEPATH').'imgs/'.$item['savepath'].$savenamearr[0].'_thumb'.'.'.$savenamearr[1]);
			$list[$key]['savename']=$savenamearr[0].'_thumb'.'.'.$savenamearr[1];
		}
		return $list;
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

}
