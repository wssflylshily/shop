<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: yangweijie <yangweijiester@gmail.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;

/**
 * 订单管理
 * @author yuanshao
 */
class SpellController extends AdminController {
   

    public function _filter(&$map)
    {
        $status=I('status');
        if($status!='')$map['status']=$status;
    }
    public function _before_index()
    {
    	$statusarr[1]='未开始';
    	$statusarr[2]='拼团中';
    	$statusarr[3] = '已结束';
//     	$statusarr[3]='已成团';
//     	$statusarr[4]='拼团失败';
    	$this->assign('statusarr',$statusarr);
    	
    	$this->updateSpellstate();
    }

    public function _before_order()
    {
    	$this->updateSpellstate();
        //获取左边菜单
        // $this->getMenu();
        $statusarr[0]='待支付';
        $statusarr[1]='待发货';
        $statusarr[2]='待收货';
        $statusarr[3]='交易完成';
        $this->assign('statusarr',$statusarr);
        $typearr[0]='送货上门';
        $typearr[1]='门店自提';
        $this->assign('typearr',$typearr);
        $list   =   M('spellorder')->select();
        $statusnum[0]=0;
        $statusnum[1]=0;
        $statusnum[2]=0;
        $statusnum[3]=0;
        $statusnum['total']=count($list);
        foreach($list as $item)
        {
            $statusnum[$item['status']]++;
        }
        $this->assign('statusnum',$statusnum);
        
        $statearr[0] = '拼团中';
        $statearr[1] = '已成团';
        $statearr[2] = '拼团失败';
       /* $statearr[1] = '未开始';
        $statearr[2] = '拼团中';
        $statearr[3] = '已成团';
        $statearr[4] = '拼团失败';*/
        $this->assign('statearr',$statearr);
        
    }
   
    /**
     * 拼团列表
     */
    public function index() {
    	$this->updateSpellState();
    	$m = M("spell");
        $status = I('state');
        $map['status'] = 1;
        if (!empty($status)){
        	$map['state'] = $status;
        }
        $count = $m->where($map)->count();
        $p = new \Think\Page($count, 20);
        $list = $m->where($map)->order('id DESC')->limit($p->firstRow.','.$p->listRows)->select();
       	foreach($list as $k=>$v){
       		$list[$k]['teamnum'] = M('spell_teams')->where('spell_id='.$v['id'])->count();
       	}
        $page = $p->show ();
        
        $this->assign('list',$list);
        $this->assign('page',$page);
        
        $this->display();
    }
    /**
     * 拼团的详细信息
     */
    public function info(){
    	$this->updateSpellstate();
    	$id = (int)I('id');
    	$spell = M('spell')->where('id='.$id)->find();
    	$this->assign('info',$spell);
    	
    	$ids = explode(',', $spell['imglist']);
    	$map['id'] = array('in',$ids);
    	$piclist = M('picture')->where($map)->select();
    	$this->assign('piclist',$piclist);
    	
    	$this->display();
    }
    
    /**
     * 拼团团长列表
     */
    public function teams(){
    	$this->updateSpellstate();
    	$id = (int)I('id');
    	$spell = M('spell')->where('id='.$id)->find();
    	$status = I('status');
    	$map = array();
    	if ($status!=""){
    		$map['status'] = $status;
    	}
    	$map['spell_id'] = $id;
    	$count = M('spell_teams')->where($map)->count();
    	$p = new \Think\Page($count, 20);
    	$teams = M('spell_teams')->where($map)->order('id DESC')->limit($p->firstRow.','.$p->listRows)->select();
    	foreach ($teams as $k=>$v){
    		$user = M('user')->where('id='.$v['user_id'])->find();
    		if($user['name']){
    			$teams[$k]['name'] = $user['name'];
    		}else{
    			$teams[$k]['name'] = $user['login_user'];
    		}
    	}
    	$page = $p->show ();
    	
    	$this->assign('list',$teams);
    	$this->assign('page',$page);
    	$this->assign('spell',$spell);
    	
    	$statusarr[0] = '未成团';
    	$statusarr[1] = '已成团';
    	$this->assign('statusarr',$statusarr);
    	
    	$this->display();
    }
     
    
    public function findGoods()
    {
        $db =M('product');
        $id =I('id');
        $data['id'] =$id;
        $data['status'] = 1;
        $info =$db->where($data)->find();
        if (!$info) $info = array();//$this->error('商品不存在');
        $this->ajaxreturn($info);
    }
    
    /**
     * 查看参团人员信息
     */
    public function detail(){
    	$this->updateSpellstate();
    	$id = (int)I('spell_id');
    	$team_id = (int)I('team_id');
    	$spell = M('spell')->where('id='.$id)->find();
    	$this->assign('spell',$spell);
    	$map['spell_id'] = $id;
    	$map['team_id'] = $team_id;
    	$count = M('spellorder')->order('addtime DESC')->where($map)->count();
    	$p = new \Think\Page($count, 20);
    	$list = M('spellorder')->order('addtime DESC')->where($map)->limit($p->firstRow.','.$p->listRows)->select();
    	foreach ($list as $k=>$v){
    		$user = M('user')->where('id='.$v['user_id'])->find();
    		if ($user['name']) $list[$k]['name'] = $user['name'];
    		else $list[$k]['name'] = $user['login_user'];
    	}
//     	print_r($list);die;
    	$page = $p->show ();
    	$statarr[0] = '待付款';
    	$statarr[1] = '待发货';
    	$statarr[2] = '待收货';
    	$statarr[3] = '已完成';
    	$statarr[4] = '已退款';
    	$this->assign('statarr',$statarr);
    	
    	$this->assign('list',$list);
    	$this->assign ( "page", $page );
    	$this->assign ( 'totalcount', $count );
    	$this->assign ( 'numPerPage', C('PAGE_NUM') );
    	$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
    	
    	$this->display();
    }
    
    /**
     * 更改拼团的显示状态
     */
    public function updateStatus(){
    	$this->updateSpellState();
    	$id = (int)I('id');
    	$status = I('status');
    	if(M('spell')->where('id='.$id)->save(array('status'=>$status))){
    		$this->success('操作成功');
    	}else{
    		$this->error('操作失败');
    	}
    }

    public function views(){
    	$this->updateSpellstate();
        //获取左边菜单
        // $this->getMenu();
        $order_id=  intval(I('id'));
        $order=M('spellorder')->where('id='.$order_id)->find();
        $this->assign('order',$order);
        $list = M('spellorder_detail')->where('order_id='.$order_id)->select();
        foreach($list as $key=>$item)
        {
            //$list[$key]['product'] = M('Product')->where('id='.$item['product_id'])->find();
        	$list[$key]['spell'] = M('spell')->where('id='.$item['spell_id'])->find();
        }
        $spell = M('spell')->where('id='.$order['spell_id'])->find();
        $this->assign('spell',$spell);
        $this->assign('list',$list);
        $typearr[0]='送货上门';
        $typearr[1]='门店自取';
        $this->assign('typearr',$typearr);
       	$user = M('user')->where('id='.$order['user_id'])->find();
       	$this->assign('user',$user);
        //送货地址
        $address    =   M('UserAddress')->where('id='.$order['address_id'])->find();
        $this->assign('address',$address);
        /*if($address){
            $area=M('Area')->where('id='.$address['area_id'])->find();
            $this->assign('area',$area);
        }*/
        //仓库
        $depot  =   M('Depot')->where('id='.$order['depot_id'])->find();
        $this->assign('depot',$depot);
        //
        $invoicearr[0]='否';
        $invoicearr[1]='是';
        $this->assign('invoicearr',$invoicearr);
        $this->display();
    }
        public function update(){
            //exit('a');
            $res = D('Spell')->update();
            if(!$res){
                $this->error(D('Product')->getError());
            }else{
                M('ProductAttr')->where('product_id='.$res['id'])->delete();
                $attrs_titles   =   $_POST['attrs_titles'];
                $attrs_values   =   $_POST['attrs_values'];
                
                $titles =   explode(',',$attrs_titles);
                $values =   explode(',',$attrs_values);
                $i=1;
                foreach($titles as $key=>$item)
                {
                    $arr=   explode('=',$values[$key]);
                    $arr1=  array();
                    foreach($arr as $k=>$v)
                    {
                        $arr1[$i]=$v;
                        $i++;
                    }
                    $skuattr[]=$arr1;
                }
                //var_dump($skuattr);exit;
                $data['product_id'] =   $res['id'];
                $list = $this->skudata($skuattr);
                //var_dump($list);exit;
                foreach($list as $key=>$item)
                {
                    $html='';
                    $xb='';
                    foreach($item as $k=>$v)
                    {
                        $html.=$v;
                        $xb.=$k;
                    }
                    //echo $key.'='.$xb.'=';
                    $data['attr_title']=$titles[$key];//$item;
                    $data['attr_value']=$html;
                    $data['price']=$_POST['price'][$key][$xb];
                    $data['vipprice']=$_POST['vipprice'][$key][$xb];
                    //var_dump($data);exit;
                    M('ProductAttr')->add($data);
                    //echo M('ProductAttr')->getlastsql().'<br>';
                    /*$attr_html.='<span id="price_'.$key.'"><label class="item-label2">'.$html.'</label>&nbsp;&nbsp;普通价格<input type="text" name="price['.$key.']['.$xb.']" class="text input" value="">
                    VIP价格<input type="text" name="vipprice['.$key.']['.$xb.']" class="text input" value=""></span><br>';*/
                }
                //exit;
                $this->success($res['id']?'更新成功':'新增成功', Cookie('__forward__'));
            }
        }

        /**
     * 文档新增页面初始化
     * @author huajie <banhuajie@163.com>
     */
    public function add(){
    	$this->updateSpellState();
        
        $this->display();
    }
    /**
    * 新增拼团程序
    */
    public function addChk(){
    	$this->updateSpellState();
        $db =M('Spell');
        //$data['pid'] =I("pid");					//商品id
        //查询商品是否存在
        //$map['id'] = $data['pid'];
        //$map['status'] = 1;
        /*$pro = M('product')->where($map)->find();
        if (!$pro) $this->error('商品不存在');*/
        $data['is_home'] = (int)I('is_home');
        $data['title'] = I('title');
        if (empty($data['title']))$this->error('拼团名称不能为空');
        $data['price'] =I('price');				//拼团价格
        $data['oldprice'] = I('oldprice');
        if (empty($data['price'])){
        	$this->error('团购价格不能为空');
        }elseif ($data['price']<=0){
        	$this->error('团购价格需大于0');
        }
        $data['image'] = I('image');
        $data['imglist'] = I('imglist');
        $data['content'] = stripslashes(I('content'));
        $data['num'] =I('num');					//开团人数
        if(empty($data['num'])){
        	$this->error('开团人数不能为空');
        }elseif ($data['num']<=0){
        	$this->error('开团人数需大于0');
        }
        $data['order_num'] =I('order_num');		//排序
        $data['start_date'] = strtotime(I('start_date'));	//拼团开始时间
        $data['end_date'] = strtotime(I('end_date'));		//拼团结束时间
        if($data['end_date']<=$data['start_date']){
        	$this->error('结束时间不能小于开始时间');
        }
        $data['express_money'] =I('express_money');//运费
        $data['describe'] = I('describe');
        $data['guarantee'] = stripslashes(I('guarantee'));
        $data['addtime'] = time();
        $res =$db->add($data);
        if ($res){ 
        	$this->success('新增成功',U('/Admin/Spell/index'));
        }else{
        	$this->error('新增失败');
        }
        
    }


     /**
     *  拼团编辑页面
     *
     */
     public function edit(){  
        $this->updateSpellState();
        $db =M('Spell');
        $id =I('id');
        $info =$db->where('id ='.$id)->find();
        $ids = explode(',', $info['imglist']);
        $map['id'] = array('in',$ids);
        $piclist = M('picture')->where($map)->select();
        $this->assign('piclist',$piclist);
        
        $dat = strtotime($info['end_date']);
        // echo $dat;
        // echo date("Y-m-d H:i:s",$dat);
        $nowt =time();
        $del =$dat -$nowt;
        $day =intval($del/86400);
        $hour =intval(($del- $day*86400)/3600);
        $min =intval(($del- $day*86400-$hour*3600)/60);
        $miao =intval(($del- $day*86400-$hour*3600-$min*60));
       
        $this->assign('info',$info);
        $this->display();
     }
     /**
     *  拼团编辑处理页面
     *
     */
     public function editChk(){
     	$this->updateSpellState();
        $db =M('Spell');
        $id =I('id');
        $data['is_home'] = I('is_home');
        $data['title'] = I('title');
        if(empty($data['title']))$this->error('拼团名称不能为空');
        $data['image'] = I('image');
        $data['imglist'] = I('imglist');
        $data['content'] = stripslashes(I('content'));
        $data['oldprice'] = I('oldprice');
        $data['price'] =I('price');
        if (empty($data['price'])){
        	$this->error('团购价格不能为空');
        }elseif ($data['price']<=0){
        	$this->error('团购价格需大于0');
        }
        $data['start_date'] = strtotime(I('start_date'));
        $data['num'] =I('num');
        if(empty($data['num'])){
        	$this->error('开团人数不能为空');
        }elseif ($data['num']<=0){
        	$this->error('开团人数需大于0');
        }
        $data['order_num'] =I('order_num');
        $data['end_date'] = strtotime(I('end_date'));
        //var_dump($data['start_date']."\r\n".$data['end_date']);die;
        if ($data['end_date']<=$data['start_date']) {
            # code...
            $this->error("结束时间不能小于开始时间");
        }
        $data['describe'] = I('describe');
        $data['guarantee'] = stripslashes(I('guarantee'));
        $data['express_money'] =I('express_money');
        $res =$db->where('id='.$id)->save($data);
//         var_dump($db->getLastsql());die;
        if($res){
            $this->success('更新成功',U('/Admin/Spell/index'));
        }else{
            $this->error('更新失败');
        }
        
     }

    // //拼团订单页面
    public function order(){
        $status = I('status');
//         var_dump($status);
        $sn =I('id');
        $map = array();
        if ($status!="") {
//         	print_r($status);
            $map['state'] = $status;
        }
        $spellids = M('spell')->where($map)->getField('id',true);
        $maps = array();
        if ($sn){
            $maps['c.sn'] =array('like',"%".$sn."%");
        }
        $typearr[0]='送货上门';
        $typearr[1]='门店自提';
        $this->assign('typearr',$typearr);
        //$spellid = M('spell')->getField('id',true);
        $maps['c.spell_id'] = array('in',$spellids);
        $field  =   'c.*,s.title,s.start_date,s.end_date,s.state';
        $join   =   ' as c inner join onethink_spell as s on c.spell_id=s.id';
        $count = M('spellorder')->join($join)->field($field)->order('c.id DESC')->where($map)->count();
        $p = new \Think\Page($count, C('PAGE_NUM'));
        $list = M('spellorder')->field($field)->join($join)->order('c.id DESC')->where($map)->limit($p->firstRow.','.$p->listRows)->select();
       	foreach ($list as $k=>$v){
       		$list[$k]['user'] = M('user')->where('id='.$v['user_id'])->find();
       		$team = M('spell_teams')->where('id='.$v['team_id'])->find();
       		$teamuser = M('user')->where('id='.$team['user_id'])->find();
       		$list[$k]['teamuserid'] = $team['user_id'];
       		$list[$k]['teamstatus'] = $team['status'];
       		if($teamuser['name'])$list[$k]['teamuser'] = $teamuser['name'];
       		else $list[$k]['teamuser'] = $teamuser['login_user'];
       	}
//        	print_r($list);die;
        // print_r(M('spellorder')->getLastsql());
        $page = $p->show ();
        
        $this->assign('info',$list);
        $this->assign ( "page", $page );
        $this->assign ( 'totalcount', $count );
        $this->assign ( 'numPerPage', C('PAGE_NUM') );
		$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);

        $this->display();
    }

    public function upstatus()
    {
        $order_id   =   intval(I('id'));
        $data['status']=intval(I('status'));
        if ($data['status']==2){
	        $data['sendtime'] = time();
        }
        $map['id']  =   $order_id;
        M('spellorder')->where($map)->save($data);
        if ($data['status']=='3') {
            # code...
            $this->enddeal($order_id);
        }
        
        $this->success('改变成功');
    }
    
    /**
     * 给指定失败拼团退款
     */
    public function tuikuan(){
    	$ids = I('request.ids');
    	$spellid = (int)I('request.spellid');
    	
    	if (!$ids) {
    		$this->error('请选择要退款的订单');
    	}
    	$spell = M('spell')->where('id='.$spellid)->find();
    	$map['spell_id'] = $spellid;
    	$map['id'] = array('in',$ids);
    	$orders = M('spellorder')->where($map)->select();
    	foreach ($orders as $k=>$v){
    		$data = array();
    		$data['status'] = 4;
    		if ($v['status']>0){
    			//订单退款
    			$data['is_drawback'] = 1;
    		}
    		M('spellorder')->where('id='.$v['id'])->save($data);
    		//增加余额
    		M('user')->where('id='.$v['user_id'])->setInc('money',$v['money']);
    		//增加收入来源
    		$item = array();
    		$item['user_id'] = $v['user_id'];
    		$item['order_type'] = 2;
    		$item['order_id'] = $v['id'];
    		$item['recharge_type'] = 1;
    		$item['type'] = 1;
    		$item['money'] = $v['money'];
    		$item['title'] = '拼团失败退款，订单编号：'.$v['sn'];
    		$item['addtime'] = time();
    		M('account_record')->add($item);
    	}
    	$this->success('退款成功');
    }


    //交易完成
    public function enddeal($order_id =""){
        if ($order_id =="") {
            # code...
            $this->error('查询不到订单号！');
        }
        $grade =M('grade');
        $user =M('user');
        $info =M('spellorder')->where('id ='.$order_id)->find();
        $userid =$info['user_id'];
        $ordercost =floatval($info['money']);

        $userpoints =$user->where('id='.$userid)->getField('points');
        $gradeinfo =$grade->order('id ASC')->select();
        $userpoints =floatval($userpoints)+$ordercost;
        $gradeArr =$grade->order('glv ASC')->select();
        foreach ($gradeArr as $key => $value) {
            # code...
            if ($userpoints>$gradeArr[$key]['glimit']) {
                # code...
                M('user')->where('id='.$userid)->setField('glv',$gradeArr[$key]['glv']);
            }
        }
        $rel =$user->where('id='.$userid)->setField('points',$userpoints);
    }
}
