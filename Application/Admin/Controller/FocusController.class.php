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
 * 焦点图管理
 * @author yuanshao
 */
class FocusController extends AdminController {
	function _before_index()
	{
		$poslist=M('FocusPos')->select();
		foreach($poslist as $item)
		{
			$posarr[$item['id']]=$item['title'];
		}
		$this->assign('posarr',$posarr);
	}
	function _before_add()
	{
		$poslist=M('FocusPos')->select();
		$this->assign('poslist',$poslist);
	}
	function _before_edit()
	{
		$poslist=M('FocusPos')->select();
		$this->assign('poslist',$poslist);
	}
}
