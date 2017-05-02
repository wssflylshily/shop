<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Think\Page;

/**
 * 网站设置控制器
 * @author huajie <banhuajie@163.com>
 */
class WebSiteController extends AdminController {
	public function index()
	{
		if(IS_POST)
		{
			$data['vipprice']=	I('post.vipprice');
			$data['rate']	=	I('post.rate');
			$data['product_rate']	=	I('post.product_rate');
			$data['qq']		=	I('post.qq');
			/*$data['freight']=	I('post.freight');
			$data['addnum']	=	I('post.addnum');
			$data['addprice']=	I('post.addprice');*/
			$row=M('WebSite')->find();
			if($row)
			{
				M('WebSite')->where('id=1')->save($data);
			}
			else
			{
				M('WebSite')->add($data);
			}
			//echo M('WebSite')->getlastsql();exit;
			$this->success('编辑成功');
		}
		$row=M('WebSite')->find();
		$this->assign('row',$row);
		$this->display();
	}
}
