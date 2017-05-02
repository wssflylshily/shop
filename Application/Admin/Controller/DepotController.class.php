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
 * 仓库管理
 * @author yuanshao
 */
class DepotController extends AdminController {
	public function _before_add()
	{
		$arealist=M('Area')->select();
		$this->assign('arealist',$arealist);
	}
	public function _before_edit()
	{
		$arealist=M('Area')->select();
		$this->assign('arealist',$arealist);
	}
}
