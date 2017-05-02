<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 佣金比例配置控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class BrokerageController extends AdminController {

    /**
     * 配置管理
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
    	$info = M('brokerage')->find();
    	if (IS_POST){
    		$data['ratio_level1'] = I('ratio1');
    		$data['ratio_level2'] = I('ratio2');
    		$data['ratio_level3'] = I('ratio3');
    		if ($info){
    			M('brokerage')->where('id='.$info['id'])->save($data);
    		}else{
    			M('brokerage')->add($data);
    		}
    	}
    	
        $this->assign('info',$info);
        $this->display();
    }
    
    /**
     * 积分设置
     */
    public function integrate(){
    	$info = M('integrate')->find();
    	if(IS_POST){
    		$data['sign_ratio'] = I('sign_ratio');
    		$data['regist_ratio'] = I('regist_ratio');
    		$data['pay_ratio'] = I('pay_ratio');
    		$data['charge_ratio'] = I('charge_ratio');
    		$data['totalmoney'] = I('totalmoney');
    		$data['expenses'] = I('expenses');
    		$data['withdraw_limit'] = I('withdraw_limit');
    		if ($info){
    			M('integrate')->where('id='.$info['id'])->save($data);
    		}else{
    			M('integrate')->add($data);
    		}
    		$this->success('操作成功');
    	}
    	
    	$this->assign('info',$info);
    	$this->display();
    }

}
