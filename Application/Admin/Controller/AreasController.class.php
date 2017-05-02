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
 * 区县管理
 * @author yuanshao
 */
class AreasController extends AdminController {

	/**
	 * ajax多级联动
	 */
	public function getareas(){
		$id = intval(I('id'));
		if($id){
			$data = M('areas')->where("pid='$id'")->select();
			if($data){
				$str='[';
				foreach ($data as $k=>$v){
					$tmp_str .='{"val":"'.$v['id'].'","text":"'.$v['title'].'"},';
				}
				$str.=substr($tmp_str,0,-1).']';
			}else{
				$str='';
			}
	
			echo $str;exit;
		}
	}
}
