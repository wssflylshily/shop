<?php
namespace Admin\Controller;
//use OT\DataDictionary;

/**
 * 评价
 */
class EvaluateController extends AdminController {
	public function _before_index()
	{
		$pingarr[0]='好评';
		$pingarr[1]='差评';
		$this->assign('pingarr',$pingarr);
		$statarr[0] = "待审核";
		$statarr[1] = "已审核";
		$statarr[-1] = "已删除";
		$this->assign('statarr',$statarr);
	}
	/**
	 * 评论列表
	 */
	public function index(){
		$m = M('evaluate');
		$status = I('status');
		$map = array();
		if ($status!='') $map['status'] = $status;
		$count = $m->where($map)->count();
		$p = new \Think\Page($count, 20);
		$list = $m->where($map)->order('id DESC')->limit($p->firstRow.','.$p->listRows)->select();
		$page = $p->show ();

		$this->assign('list',$list);
		$this->assign ( "page", $page );
		$this->assign ( 'totalcount', $count );
		$this->assign ( 'numPerPage', 20 );
		$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
		
		$this->display();
	}
	public function info(){
		$eid =I('get.id');
		
		$info =M('evaluate')->where('id ='.$eid)->find();
		$this->assign("info",$info);
		$this->display();
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
			case 1  :
				$this->resume($Model, $map, array('success'=>'审核成功','error'=>'启用失败'));
				break;
			default :
				$this->error('参数错误');
				break;
		}
	}
	/**
	 * 设置单条数据的状态
	 */
	public function audit(){
		$id = (int)I('id');
		$status = I('status');
		M('evaluate')->where('id='.$id)->save(array('status'=>$status));
		if($status==1){
			$this->success('审核成功');
		}else{
			$this->success('删除成功');
		}
		
	}
}