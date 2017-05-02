<?php
namespace Admin\Controller;
use OT\DataDictionary;

/**
 * 代金券
 */
class CashCouponController extends AdminController {

    public function _before_index(){
		$statusarr[0]='未兑换';
		$statusarr[1]='已兑换';
		$this->assign('statusarr',$statusarr);
    }
    public function index() {
    	$model = D('cashcoupon');
    	$excel_url = U('exportList');
    	$sdate = I('time_start');
    	$edate = I('time_end');
    	$state = I('state');
//     	print_r($sdate);
    	$map = array();
    	if ($state!=""){
    		$map['state'] = $state;
    		$excel_url .= "&state=".$state;
    	}
    	if ($sdate!=""){
    		$stime = strtotime($sdate);
    		$map['addtime'] = array('egt',$stime);
    		$excel_url .= "&time_start=".$stime;
    	}
    	if ($edate!=""){
    		$etime = strtotime($edate);
    		$map['addtime'] = array('elt',$etime);
    		$excel_url .= "&time_end=".$etime;
    	}
    	if ($sdate!=""&&$edate!=""){
    		$stime = strtotime($sdate);
    		$etime = strtotime($edate);
    		$map['addtime'] = array('between',$stime.','.$etime);
    	}
    	$count = M('cashcoupon')->where($map)->count();
    	$p = new \Think\Page($count, 20);
    	$voList = M('cashcoupon')->order('id DESC')->where($map)->limit($p->firstRow.','.$p->listRows)->select();
    	foreach ($voList as $k=>$v){
    		$voList[$k]['totalNum'] = M('cashcoupon_detail')->where('codeId='.$v['id'])->count();
    		$voList[$k]['useNum'] = M('cashcoupon_detail')->where('codeId='.$v['id'].' and is_ply')->count();
    	}
    	$page = $p->show ();
    	
    	$this->assign ( 'list', $voList );
    	$this->assign ( "page", $page );
    	$this->assign ( 'totalcount', $count );
    	$this->assign ( 'numPerPage', C('PAGE_NUM') );
    	$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
//     	var_dump($this->random(6));die;
//     	print_r($voList);die;
		$this->assign('url',$_SERVER['REQUEST_URI']);
    	$this->assign('excel_url',$excel_url);
    	$this->display();
    }
    
    /**
     * 所有明细列表
     */
	function detaillist()
	{
		$plyarr[0]='未使用';
		$plyarr[1]='已使用';
		$this->assign('plyarr',$plyarr);
		$is_ply	=	intval(I('is_ply'));
		if($is_ply!='')$map['is_ply']=$is_ply;
		$model	=	M('cashcoupon_detail');
		$this->_list($model,$map);
		$this->display();
	}
	/**
	 * 明细列表
	 */
	function detail(){
		$id = (int)I('id');
		$map['id']=$id;
		$coupon	=	M('cashcoupon')->where($map)->find();
		if(!$coupon){
			$this->error('代金券不存在');
		}elseif($coupon['state']==0){
			$this->error('代金券尚未兑换');
		}
		$this->assign('coupon',$coupon);
		$map	=	array();
		$map['detail.codeId']	=	$id;
		$count = M('cashcoupon_detail')->where($map)->count();
		$field = "detail.*,cash.code";
		$list	=	M('cashcoupon_detail')->alias('detail')->join('onethink_cashcoupon as cash on detail.codeId=cash.id')->field($field)->where($map)->select();
		foreach ($list as $k=>$v){
			$user = M('user')->where('id='.$v['user_id'])->find();
			if ($user['name']) $list[$k]['name'] = $user['name'];
			else $list[$k]['name'] = $user['login_user'];
		}
		$this->assign('list',$list);
		
		$plyarr[0]='未使用';
		$plyarr[1]='已使用';
		$this->assign('plyarr',$plyarr);
		$this->assign('top_card_class','active');
		$this->assign('left_card_list','active');
		$this->display();
	}
	
	/**
	 * 批量生成代金券
	 */
	public function addCoupon(){
		$money = (int)I('money');
		if (!$money)$this->error('代金券金额需大于0');
		$num = (int)I('num');
		if (!$num) $this->error('生成数量需大于0');
		$per = I('permoney');
		if ($per){
			$residue = $money%$per;
			if ($residue==0){
				$permoney = $per;
			}else{
				$this->error('拆分金额不正确，请重新输入');
			}
		}
		//$id = M('cashcoupon_record')->add(array('money'=>$money,'num'=>$num,'addtime'=>time()));
		//if ($id){
			for ($i=0;$i<$num;$i++){
				$data[$i]['code'] = $this->random(6);
				$data[$i]['money'] = $money;
				$data[$i]['permoney'] = $permoney;
				$data[$i]['addtime'] = time();
			}
			M('cashcoupon')->addAll($data);
			$this->success('生成成功',U('index'));
		/*}else{
			$this->error('生成失败');
		}*/
	}
	
	/**
	 * 删除代金券
	 */
	public function del(){
		$id = (int)I('id');
		$map['id'] = $id;
		$info = M('cashcoupon')->where($map)->find();
		if (!$info) {
			$this->error('代金券不存在');
		}
		$res = M('cashcoupon')->where($map)->delete();
		if ($res) {
			$this->success('删除成功');
		}else{
			$this->error('删除失败');
		}
	}
	
	/**
	 * 导出excel
	 */
	public function exportList(){
		$ids    =  rtrim(I('ids'),',');
		$sdate = I('time_start');
		$edate = I('time_end');
		$state = I('state');
		$map = array();
		if ($sdate!=""){
			//$stime = strtotime($sdate);
			$map['addtime'] = array('egt',$sdate);
		}
		if ($edate!=""){
			//$etime = strtotime($edate);
			$map['addtime'] = array('elt',$edate);
		}
		if ($sdate!=""&&$edate!=""){
// 			$stime = strtotime($sdate);
// 			$etime = strtotime($edate);
			$map['addtime'] = array('between',$sdate.','.$edate);
		}
		if (!empty($ids)){
			$map['id'] = array('in',$ids);
		}
		if($state!=""){
			$map['state'] = $state;
		}
		$list = M('cashcoupon')->where($map)->select();
		$str = '
		<table border="1">
		<tr style="background-color:#ccffcc;min-height:30px;">
		<th align="center">ID</th>
		<th align="center">代金券序列号</th>
		<th align="center">代金券金额</th>
		<th align="center">生成时间</th>
		</tr>
		';
		foreach ($list as $k => $v) {
			
			if (($k%2)==0){
				$str .='<tr align="center" style="background-color:#fdffcc;min-height:30px;">';
			}else{
				$str .='<tr align="center" style="min-height:30px;">';
			}
			$str .= '
			<td>'.$v['id'].'&nbsp;</td>
			<td>'.$v['code'].'&nbsp;</td>
			<td>'.$v['money'].'&nbsp;</td>
			';
			if($v['addtime']>0){
				$str .= '<td>'.date('Y-m-d H:i:s',$v['addtime']).'</td>';
			}else{
				$str .= '<td></td>';
			}
			$str .= '</tr>';
		}
			
		$str .="</table>";
		//输出
		header('Content-Length: '.strlen($str));
		header("Content-type:application/vnd.ms-excel;charset=UTF-8");
		header("Content-Disposition:filename=daijinquan.xls");
		echo $str;
	}
	
	/**
	 * 生成6位不重复的随机数
	 */
	public function random($length = 6) {
		PHP_VERSION < '4.2.0' && mt_srand((double)microtime() * 1000000);
		$hash = sprintf('%0'.$length.'d', mt_rand(0, pow(10, $length) - 1));
		if (substr($hash, 0,1)==0){
			$this->random();
		}else{
			//查看该数值是否存在过
			$rs = M('cashcoupon')->where('code="'.$hash.'"')->find();
			if ($rs){
				$this->random(6);
			}else{
				return $hash;
			}
		}
		return $hash;
	}
	
}