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
 * 新闻管理
 * @author yuanshao
 */
class NewsController extends AdminController {
	public function _filter(&$map)
	{
		$hid		=	I('hid');//机构ID
		$doctor_id	=	intval(I('doctor_id'));//医生ID
		$position_id=	intval(I('position_id'));//部位ID
		$service_id	=	intval(I('service_id'));//服务项目ID
		$project_id	=	intval(I('project_id'));//项目方法ID
		if($hid>0)$map['hospital_id']=$hid;
		if($doctor_id>0)$map['doctor_id']=$doctor_id;
		if($position_id>0)$map['position_id']=$position_id;
		if($service_id>0)$map['service_id']=$service_id;
		if($project_id>0)$map['project_id']=$project_id;
	}

	public function _before_index()
	{
		$type_list	=	M('NewsType')->select();
		foreach($type_list as $item)
		{
			$typearr[$item['id']]=$item['title'];
		}
		$this->assign('typearr',$typearr);
	}
	public function _before_add()
	{
		$list	=	M('NewsType')->select();
		import("Think/Tree");
		$tree	=	new \Think\Tree();
		$arrlist=	array();
		foreach($list as $item)
		{
			$tree->setNode($item['id'],$item['parent_id'],$item['title']);
		}
		$type_id_option	=	$tree->getSelectList('type_id');
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
				$list	=	M('NewsType')->select();
				import("Think/Tree");
				$tree	=	new \Think\Tree();
				$arrlist=	array();
				foreach($list as $item)
				{
					$tree->setNode($item['id'],$item['parent_id'],$item['title']);
				}
				$type_id_option	=	$tree->getSelectList('type_id',0,$vo['type_id']);
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
	public function index() {
		$model_name	=	$this->model_name?$this->model_name:CONTROLLER_NAME;
        $model = D($model_name);
		if (method_exists ( $this, '_filter' )) {
			$this->_filter ( $map );
		}
		$count = $model->where ( $map )->count ();
		if ($count > 0) {
			$p = new \Think\Page($count, C('PAGE_NUM'));
			$voList = $model->where($map)->order('is_tj desc,id desc')->limit($p->firstRow.','.$p->listRows)->select();
			$page = $p->show ();
			$this->assign ( "page", $page );
			$this->assign ( 'list', $voList );
		}
		$istj[0]='否';
		$istj[1]='是';
		$this->assign('istj',$istj);
		//$this->_list($model);
		$this->display();
    }
	public function tuijian()
	{
		$id=$_POST['ids'];
		//$school=M('School')->where('id='.$id)->find();
		$data['is_tj']=1;
		$map['id']=array('in',implode(',',$id));
		//var_dump($map);exit;
		M('News')->where($map)->save($data);
		$this->success('操作成功');
	}
	public function canceltuijian()
	{
		$id=$_POST['ids'];
		//$school=M('School')->where('id='.$id)->find();
		$data['is_tj']=0;
		$map['id']=array('in',implode(',',$id));
		M('News')->where($map)->save($data);
		$this->success('操作成功');
	}
}
