<?php
namespace Think;
class Tree 
{     
	var $data = array();
	var $child = array(-1 => array());
	var $layer = array(-1 => -1);
	//级数
	var $parent =	array();
	var $countid=	0;
	var $en_data=	array();
	var $number	=	array();
	var $home	=	array();

	function allEmpty()
	{
		$this->data=array();
		$this->child = array(-1 => array());
		$this->layer = array(-1 => -1);
	}
	//构造函数
	//function Tree($value){}
	function setNode($id, $parent, $value,$en_data=0,$number=0)
	{
		$parent = $parent?$parent:0;
		$this->data[$id] = $value;
		$this->child[$parent][]  = $id;
		$this->parent[$id] = $parent;
		$this->en_data[$id] = $en_data;
		$this->number[$id] = $number;
		if(!isset($this->layer[$parent]))
		{
			$this->layer[$id] = 0;
		}
		else
		{
			$this->layer[$id] = $this->layer[$parent] + 1;
		}
	}
	function getList(&$tree, $root= 0)
	{
		if(isset($this->child[$root]))
		{
			foreach($this->child[$root] as $key => $id)
			{
				$tree[] = $id;
				if($this->child[$id]) $this->getList($tree, $id);
			}
		}
	}
	function getValue($id)
	{
		return $this->data[$id];
	}
	function reSetLayer($id)
	{
		if($this->parent[$id])
		{
			$this->layer[$this->countid] = $this->layer[$this->countid] + 1;
			$this->reSetLayer($this->parent[$id]);
		}
	}
	function getLayer($id, $space = false)
	{
		//重新计算级数
		$this->layer[$id] = 0;
		$this->countid = $id;
		$this->reSetLayer($id);
		return $space?str_repeat($space, $this->layer[$id]):$this->layer[$id];
	}
	function getParent($id)
	{
		return $this->parent[$id];
	}
	function getParents($id)
	{
		while($this->parent[$id] != -1)
		{
			$id = $parent[$this->layer[$id]] = $this->parent[$id];
		}
		ksort($parent);
		//按照键名排序
		reset($parent);
		//数组指针移回第一个单元
		return $parent;
	}
	function getChild($id)
	{
		return $this->child[$id];
	}
	function getChilds($id = 0)
	{
		$child = array();
		$this->getList($child, $id);
		return $child;
	}

	function getSelectList($name,$selectid=0,$defval='',$deftxt='请选择分类')
	{
		$html	=	'<select name="'.$name.'" id="'.$name.'" ';
		//if($validate)$html.=' class="required"';
		$html	.=	'><option value="'.$defval.'">'.$deftxt.'</option>';
		$category = $this->getChilds();
		foreach ($category as $key=>$id)
		{
			$html.='<option value="'.$id.'" ';
			if($id==$selectid)$html.='selected';
			$html.='>'.$this->getLayer($id, '&nbsp;&nbsp;&nbsp;&nbsp;').''.$this->getValue($id).'</option>';
			//echo $id.$this->getLayer($id, '|-').$this->getValue($id)."\n";
		}
		$html	.=	'</select>';
		return $html;
	}
	function getClassifyList()
	{
		$is_hidden[0]='是';
		$is_hidden[1]='否';
		$html='';
		$category	=	$this->getChilds();
		foreach($category as $key=>$id)
		{
			$html.='<tr class="dbclick" d_id="'.$id.'" d_parentid="'.$this->parent[$id].'" d_title="'.$this->data[$id].'" d_order_num="'.$this->number[$id].'" d_is_hidden="'.$this->is_hidden[$id].'"';
			if($this->parent[$id]>0)
			{
				$html.=" style='display:none'";
			}
			if($this->parent[$id]>0)
			{
				$html.=" id='dbclick_".$id."'";
			}
			if($this->parent[$id]==0)
			{
				$arr=$this->getChilds($id);
				//$html.="<input type='button' onclick='visible(\"".implode(',',$arr)."\")' value=\"展开/收缩\">";
			}
			$html.='><td class="checkbox"><input type="checkbox" name="id[]" value="'.$id.'"></td>';
			$html.='<td>';
			$html.=$id.'</td>';
			if($this->parent[$id]==0)
			{
				$html.='<td class="_dbclick" onclick=\'visible("'.implode(',',$arr).'")\'>';
			}
			else
			{
				$html.='<td>';
			}
			$html.=$this->getLayer($id, '|--').$this->getValue($id);
			$html.='</td>';
			$html.='<td>'.$is_hidden[$this->is_hidden[$id]].'</td>';
			$html.='<td>'.$this->number[$id].'</td>';
			$html.='</tr>';
		}
		return $html;
	}
	public function getIndustryClassList($parentid=0)
	{
		$category=	$this->getChilds($parentid);
		$arr	=	array();
		foreach($category as $key=>$id)
		{
			//$arr[]='<input type="checkbox" name="id[]" value="'.$id.'">'.$this->getLayer($id, '|--').$this->getValue($id);
			$arr[]=array('id'=>$id,'title'=>$this->getLayer($id, '|--').$this->getValue($id));
		}
		return $arr;
	}

	function getOption($selectid=0)
	{
		$html	=	'';
		$category = $this->getChilds();
		foreach ($category as $key=>$id)
		{
			$html.='<option value=\''.$id.'\' ';
			if($id==$selectid)$html.='selected';
			$html.='>'.$this->getLayer($id, '&nbsp;&nbsp;&nbsp;&nbsp;').''.$this->getValue($id).'</option>';
		}
		return $html;
	}
}
?>