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
 * 客服配置控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class KefuController extends AdminController {

    /**
     * 配置管理
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
    	$info = M('web_site')->find();
    	if (IS_POST){
    		$data['qq'] = I('qq');
    		$data['phone'] = I('phone');
    		if ($info){
    			M('web_site')->where('id='.$info['id'])->save($data);
    		}else{
    			M('web_site')->add($data);
    		}
    		$this->success('操作成功');
    	}
    	
        $this->assign('info',$info);
        $this->display();
    }

}
