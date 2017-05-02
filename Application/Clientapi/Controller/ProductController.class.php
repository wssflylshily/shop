<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/15
 * Time: 17:27
 * 全部商品
 */

namespace Clientapi\Controller;


class ProductController extends MapiBaseController
{
    public function index()
    {
        try{
            $data = $this->data;
            $db = M('product');
            $category = M('category');
            $page = $data['page']?$data['page']:1;
            $where['status'] = 1;
            if ($data['sales']){
                $order['sell_num'] = "desc";
            }
            if ($data['price']){
                if ($data['price'] == 1){
                    $order['gprice'] = "desc";
                }elseif($data['price'] == -1){
                    $order['gprice'] = "asc";
                }
            }
            if ($data['cid']){
                $cate = $category->where('id='.$data['cid'])->find();
                if ($cate['pid'] == 0){
                    $item = $category->where('pid='.$cate['id'])->select();
                    $ids = [];
                    foreach ($item as $value)
                    {
                        $ids[] = $value['id'];
                    }
                    $where['category_id'] = array('in',$ids);
                }else{
                    $where['category_id'] = $data['cid'];
                }
            }

            if ($data['lowPrice']!="" && $data['highPrice']!=""){
                $where['gprice'] = array('between',array($data['lowPrice'],$data['highPrice']));
            }

            if ($data['keyword']){
                $where['title'] = array('like', '%'.$data['keyword'].'%');
            }

            $rs = $db->where($where)->page($page, 20)->order($order)->select();
            $arr = [];
            $num = 0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++){
                    $arr[$i]['pid'] = $rs[$i]['id'];
                    $arr[$i]['title'] = $rs[$i]['title'];
                    $arr[$i]['url'] = $rs[$i]['image']?$rs[$i]['image']:'/public/Home/img/zhanwei.png';
                    $arr[$i]['price'] = $rs[$i]['gprice'];
                    $arr[$i]['marketPrice'] = $rs[$i]['market_price'];
                }
                $num = 1;
            }
            $this->ApiReturn(0, "成功", $arr, $num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    public function proCategory()
    {
        try{
            $data = $this->data;
            $db = M('category');
            $cid = $data['cid']?$data['cid']:0;
            $rs = $db->where(array('pid'=>$cid, 'status'=>1))->select();

            $arr = [];
            $num = 0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++){
                    $arr[$i]['cid'] = $rs[$i]['id'];
                    $arr[$i]['title'] = $rs[$i]['title'];
                }
                $num = 1;
            }
            $this->ApiReturn(0, "成功", $arr, $num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    public function proDetail()
    {
        try{
            $data = $this->data;
            $db = M('product');
            if ($data['pid']=="")
            {
                $this->ApiReturn(20001,"商品错误");
            }
            $pid = $data['pid'];
            $detail = $db->where('id='.$pid)->find();

            $config = M('Integrate')->where('id=1')->find();

            if (!$detail){
                $this->ApiReturn(39001,"商品不存在");
            }
            $arr = [];
            $arr['pid'] = $detail['id'];
            $arr['title'] = $detail['title'];
            $arr['price'] = $detail['gprice'];
            $arr['marketPrice'] = $detail['market_price'];
            $arr['freight'] = $config['expenses'];         //运费
            $arr['sellNum'] = $detail['sell_num'];         //销量
            $arr['content'] = $detail['content'];         //详情
            $arr['image'] = $detail['image'];

            $arr['describe'] = $detail['description'];         //分享推荐语

            $arr['cartNum'] = 0;    //购物车数量
            $arr['evaluate'] = 0;   //评论数
            $arr['collection'] = -1;   //未收藏

            $arr['stock'] = $this->getStock($pid);      //库存

            if (S($data['token'])){
                $arr['cartNum'] = $this->getCartNum(S($data['token']));
                $arr['evaluate'] = $this->getEvaluateNum($detail['id']);
                $arr['collection'] = $this->getCollectionStatus(S($data['token']),$detail['id']);
            }

            //轮播图
            $imgArr = explode(',',$detail['imglist']);
            $imgList = [];$a=0;$picture = M('picture');
            if ($imgArr)foreach ($imgArr as $imgid){
                $img = $picture->where('id='.$imgid)->find();
                if ($img){
                    $imgList[$a]['path'] = $img['path'];
                    $a++;
                }
            }
            $arr['imgList'] = $imgList;

            //参数
            $cates = explode(',',$detail['attrs_titles']);
            $items = explode(',',$detail['attrs_values']);
            $cateList = [];
            if ($cates && $items) for ($i=0;$i<count($cates);$i++)
            {
                $cateList[$i]['title'] = $cates[$i];
                $cateList[$i]['items'] = explode('=',$items[$i]);
            }
            $arr['category'] = $cateList;

            //有没有推广规则
            $arr['promotion'] = -1;
            if (M('News')->where('title="推广规则"')->find()){
                $arr['promotion'] = 1;
            }

            $this->ApiReturn(0, "成功", $arr);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    public function proPrice()
    {
        try{
            $data = $this->data;
            if ($data['name']==""){
                $this->ApiReturn(20001,"请选择参数");
            }elseif ($data['pid']==""){
                $this->ApiReturn(20001, "请选择商品");
            }
            $db = M('ProductAttr');
            $priceinfo = $db->where(array('attr_value'=>$data['name'], 'product_id' => $data['pid']))->find();
            if (!$priceinfo){
                $this->ApiReturn(39002, "参数错误");
            }
            $rs = [];
            $rs['price'] = $priceinfo['price'];
            $rs['oldPrice'] = $priceinfo['oldprice'];
            $rs['stock'] = $priceinfo['stock'];
            $this->ApiReturn(0,"成功", $rs);

        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //添加到收藏
    public function addCollection()
    {
        try{
            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期','');
            }
            if ($data['pid']==""){
                $this->ApiReturn(20001,"请选择要收藏的商品");
            }
            $pid = $data['pid'];
            $id = S($data['token']);
            $db = M('Collection');

            //商品还在不在
            if (!M('product')->where(array('id' => $data['pid']))->find())
            {
                $this->ApiReturn(39003, '商品不存在');
            }

            $map['user_id'] = $id;
            $map['product_id'] = $pid;
            if ($db->where($map)->find()){
                $this->ApiReturn(0, '已收藏');
            }
            $map['addtime'] = time();
            try{
                $db->add($map);
            } catch (\Exception $e){
                $this->ApiReturn(10002,'系统错误');
            }
            $this->ApiReturn(0, '成功');

        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //批量添加到收藏
    public function addBatchCollection()
    {
        try{
            $data = $this->data;
            if ($data['pids']==""){
                $this->ApiReturn(20001, '没有选择要收藏的商品');
            }
            $cids = $data['pids'];
            if (!is_array($data['pids'])){
                $pids = explode(',', $data['pids']);
            }
            $id = S($data['token']);
            $db = M('Collection');

            foreach ($pids as $item){
                //商品还在不在
                if (!M('product')->where(array('id' => $item))->find())
                {
                    $this->ApiReturn(39003, '商品不存在');
                }

                $map['user_id'] = $id;
                $map['product_id'] = $item;
                if ($db->where($map)->find()){
                    $this->ApiReturn(0, '已收藏');
                }
                $map['addtime'] = time();
                try{
                    $db->add($map);
                } catch (\Exception $e){
                    $this->ApiReturn(10002,'系统错误');
                }
            }
            $this->ApiReturn(0, '成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //取消收藏
    public function delCollection()
    {
        try{

            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期');
            }elseif (empty($data['pid'])){
                $this->ApiReturn(20001,'请选择要取消收藏的商品');
            }
            $pid = $data['pid'];
            $id = S($data['token']);
            $db = M('Collection');

            if (!$db->where(array('user_id'=>$id,'product_id'=>$pid))->find()){
                $this->ApiReturn(0, '成功');
            }
            try{
                $db->where(array('user_id'=>$id,'product_id'=>$pid))->delete();
            } catch (\Exception $e){
                $this->ApiReturn(10000,'网络错误');
            }

            $this->ApiReturn(0, '成功');

        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //购物车数量
    protected function getCartNum($user_id)
    {
        $num = M('Cart')->where('user_id='.$user_id)->count();
        return $num;
    }

    //评论数
    protected function getEvaluateNum($product_id)
    {
        $num = M('evaluate')->where(array('product_id'=>$product_id,'status'=>1))->count();
        return $num;
    }

    //是否收藏
    protected function getCollectionStatus($user_id,$product_id)
    {
        $status = M('collection')->where(array('user_id'=>$user_id,'product_id'=>$product_id))->find();
        if (!$status)
        {
            return -1;
        }
        return 1;
    }

    //库存数量
    protected function getStock($pid)
    {
        $db = M('ProductAttr');
        $priceinfo = $db->where(array('product_id' => $pid))->select();
        $product = M('Product')->where(array('id'=>$pid))->find();
        $num = 0;
        if ($priceinfo){
            foreach ($priceinfo as $item){
                $num += $item['stock'];
            }
        }else{
            $num = $product['stock'];
        }
        return $num;
    }

    //评论
    public function getProEvaluate()
    {
        try{
            $data = $this->data;
            if ($data['pid']==""){
                $this->ApiReturn(20001,'没有选择商品');
            }
            if ($data['status']==1){
                $where['score'] = array('EGT', 3);
            }
            if ($data['status']==-1){
                $where['score'] = array('LT', 3);
            }
            $page = $data['page']?$data['page']:1;
            $db = M('evaluate');
            $product_id = $data['pid'];
            $where['product_id'] = $product_id;
            $where['onethink_evaluate.status'] = 1;
            $comments = $db->where($where)->join('LEFT JOIN onethink_user ON onethink_user.id=onethink_evaluate.user_id')->page($page, 20)->field('*, onethink_evaluate.addtime as etime')->select();
            $total_comments = $db->where(array('product_id'=>$product_id, 'status'=>1))->select();

            $count_comment = 0;
            $total_score = 0;
            $return['score'] = 0;

            if ($total_comments){
                $count_comment = count($total_comments);
                foreach ($total_comments as $comment){
                    $total_score += $comment['score'];
                }
                $return['score'] = round($total_score/$count_comment,1);
            }

            $return['total_num'] = count($total_comments);
            $return['good_num'] = $db->where(array('product_id'=>$product_id, 'status'=>1, 'score'=>array('EGT',3)))->count();
            $return['bad_num'] = $db->where(array('product_id'=>$product_id, 'status'=>1, 'score'=>array('LT',3)))->count();

            $return['list'] = [];
            $num = 0;
            if ($comments)
            {
                for ($i=0;$i<count($comments);$i++)
                {
                    $name = $comments[$i]['name']?$comments[$i]['name']:$comments[$i]['mobile'];
                    if ($comments[$i]['anonymous']==1){
                        $name = "匿名";
                    }
                    $return['list'][$i]['name'] = $name;
                    $return['list'][$i]['image'] = $comments[$i]['image'];
                    $return['list'][$i]['time'] = date('Y-m-d H:i:s', $comments[$i]['etime']);
                    $return['list'][$i]['score'] = $comments[$i]['score'];
                    $return['list'][$i]['content'] = $comments[$i]['desc'];
                }
                $num = 1;
            }

            $this->ApiReturn(0, '成功', $return, $num);

        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //分享
    public function getShareUrl()
    {
        try{
            $data = $this->data;
            if (!$data['token']){
                $this->ApiReturn(20003,'token无效或已过期','');
            }elseif ($data['pid']==""){
                $this->ApiReturn(20001, '请选择要分享的商品');
            }
            $url = 'http://'.$_SERVER['HTTP_HOST'].'/clientapi/product/proDetail?pid='.$data['pid'].'&superiorID='.S($data['token']);
            $this->ApiReturn(0, '成功', $url);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //分享--返回分享者id
    public function getShareID()
    {
        try{
            $data = $this->data;
            if (!$data['token']){
                $this->ApiReturn(20003,'token无效或已过期','');
            }elseif ($data['pid']==""){
                $this->ApiReturn(20001, '请选择要分享的商品');
            }
            $return['superiorID'] = S($data['token']);
            $this->ApiReturn(0, '成功', $return);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //推广规则
    public function promotion(){
        try{
            $promotion = M('News')->where('title="推广规则"')->find();
            if ($promotion){
                $arr['detail'] = $promotion['content'];
            }
            $this->ApiReturn(0, '成功', $arr);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

}