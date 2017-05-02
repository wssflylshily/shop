<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: yangweijie <yangweijiester@gmail.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 佣金提现记录
 * @author yuanshao
 */
class BrokerageWithdrawRecordController extends AdminController {
	public function _filter(&$map)
	{
		$status=I('status');
		if($status!='')
		{
			$map['status']=$status;
		}
		$login_user=I('login_user');
		$userids=array();
		if(!empty($login_user))
		{
			$list=M('User')->where('login_user like "%'.$login_user.'%"')->select();
			if($list)
			{
				foreach($list as $item)
				{
					$userids[]=$item['id'];
				}
			}
			else
			{
				$userids[]=0;
			}
		}
		if(count($userids)>0)
		{
			$map['user_id']=array('in',implode(',',$userids));
		}
		$start_date=I('start_date');
		if(!empty($start_date))
		{
			$map['_string']=" addtime>='". strtotime($start_date)."'";
		}
		$end_date=I('end_date');
		if(!empty($end_date))
		{
			if(!empty($map['_string']))
			{
				$map['_string'].=" and addtime<='". strtotime($end_date)."'";
			}
			else
			{
				$map['_string']=" addtime<='". strtotime($end_date)."'";
			}
		}
	}
	public function _before_index()
	{
		$banktypelist=	M('BankType')->select();
		foreach($banktypelist as $item)
		{
			$banktypearr[$item['id']]=$item;
		}
		$this->assign('banktypearr',$banktypearr);
		$statusarr[0]='待处理';
		$statusarr[1]='已转账';
		$statusarr[2]='已驳回';
		$this->assign('statusarr',$statusarr);
	}

	//
    public function index() {
        $model = D('brokerage_withdraw_record');
        $map = array();
        $stat = I('time-start');
        $end = I('time-end');
        if ($stat){
        	$start = strtotime($stat);
        	$map['addtime'] = array('egt',$start);
        }
        if ($end){
        	$endt = strtotime($end);
        	$map['addtime'] = array('elt',$endt);
        }
        if ($stat&&$end){
        	$map['addtime'] = array('between',$start.",".$endt);
        }
		//$this->_list($model,$map);
		$m = M('brokerage_withdraw_record');
		$count = $m->where($map)->count();
		$p = new \Think\Page($count, 20);
		$list = $m->limit($p->firstRow.','.$p->listRows)->where($map)->order('id DESC')->select();
		foreach ($list as $k=>$v){
			$list[$k]['banktype'] = M('bank')->where('id='.$v['bank_id'])->getField('type_id');
		}
		
		$page = $p->show ();
		$this->assign ( 'list', $list );
		$this->assign ( "page", $page );
		$this->assign ( 'totalcount', $count );
		$this->assign ( 'numPerPage', 20 );
		$this->assign ( 'currentPage',$p->firstRow/C('PAGE_NUM')+1);
		
		$this->display();
    }

	//打款
	public function upstatus()
	{
		$id	=	intval(I('id'));
		if($id<1)
		{
			$this->error('记录不存在');
		}
		$record=M('BrokerageWithdrawRecord')->where('id='.$id)->find();
		if(!$record)
		{
			$this->error('记录不存在');
		}
		if($record['status']!=0)
		{
			$this->error('已经操作过了');
		}
		M('BrokerageWithdrawRecord')->where('id='.$id)->save(array('status'=>1));
		$this->success('操作成功');
	}
	/**
	 * 提现申请详细信息
	 */
	public function info(){
		$id	=	(int)I('id');
		if($id<1)
		{
			$this->error('记录不存在');
		}
		$record=M('BrokerageWithdrawRecord')->where('id='.$id)->find();
		// 		print_r($record);die;
		if(!$record)
		{
			$this->error('记录不存在');
		}
		
		$bank = M('bank')->where('id='.$record['bank_id'])->find();
		$this->assign('bank',$bank);
		
		$this->assign('info',$record);
		
		$this->display();
	}
	//驳回
	public function del()
	{
		$id	=	(int)I('id');
		if($id<1)
		{
			$this->error('记录不存在');
		}
		$record=M('BrokerageWithdrawRecord')->where('id='.$id)->find();
// 		print_r($record);die;
		if(!$record)
		{
			$this->error('记录不存在');
		}
		if($record['status']!=0)
		{
			$this->error('已经操作过了');
		}
		if (IS_POST){
			$reason = I('reason');
			M('User')->where('id='.$record['user_id'])->setInc('money',$record['money']);
			M('BrokerageWithdrawRecord')->where('id='.$id)->save(array('status'=>2,'reason'=>$reason));
			$this->success('驳回成功',U('index'));
		}
		$bank = M('bank')->where('id='.$record['bank_id'])->find();
		$this->assign('bank',$bank);
		
		$this->assign('info',$record);
		$this->display();
	}
}
