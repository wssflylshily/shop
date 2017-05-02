<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/22
 * Time: 11:50
 */

namespace Clientapi\Controller;


class WebController extends MapiBaseController
{

    //商品详情页
    public function proDetail()
    {
        $db = M('product');
        $data = $this->data;
        $pid = $data['pid'];
        $detail = $db->where('id='.$pid)->find();
        $this->assign('detail',$detail);
        $this->display('pro_detail');
    }

    //推广规则
    public function getPromotionRule()
    {
        $db = M('news');
        $detail = $db->where('title="推广规则"')->find();
        $this->assign('detail',$detail);
        $this->display('promotion_rule');
    }
}