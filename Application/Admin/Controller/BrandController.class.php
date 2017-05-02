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
 * 品牌管理
 * @author yuanshao
 */
class BrandController extends AdminController {
	public function _before_index()
	{
		$list	=	M('Brand')->select();
		foreach($list as $item)
		{
			$arr[$item['id']]=$item['title'];
		}
		$arr[0]='根分类';
		$this->assign('arr',$arr);
	}
	public function _before_add()
	{
		$list	=	M('Brand')->select();
		import("Think/Tree");
		$tree	=	new \Think\Tree();
		$arrlist=	array();
		foreach($list as $item)
		{
			$tree->setNode($item['id'],$item['parent_id'],$item['title']);
		}
		$type_id_option	=	$tree->getSelectList('parent_id');
		$this->assign('type_id_option',$type_id_option);
	}
	// 编辑数据
    public function edit($id) {
        if (!empty($id)) {
			$model_name	=	$this->model_name?$this->model_name:CONTROLLER_NAME;
			$model = D($model_name);
            $vo = $model->getById($id);
            if ($vo) {
                $this->vo   =   $vo;
				$this->assign("__forward__",$_SERVER["HTTP_REFERER"]);
				$list	=	M('Brand')->select();
				import("Think/Tree");
				$tree	=	new \Think\Tree();
				$arrlist=	array();
				foreach($list as $item)
				{
					$tree->setNode($item['id'],$item['parent_id'],$item['title']);
				}
				$type_id_option	=	$tree->getSelectList('parent_id',0,$vo['parent_id']);
				$this->assign('type_id_option',$type_id_option);
                $this->display();
            } else {
				$error=$model->getError();
				$this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
			$error=$model->getError();
			$this->error(empty($error) ? '未知错误！' : $error);
        }
    }
}
