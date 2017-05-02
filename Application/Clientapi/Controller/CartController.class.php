<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/18
 * Time: 10:28
 * 购物车
 */

namespace Clientapi\Controller;


class CartController extends UserApiBaseController
{

    public function index()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $page = $data['page']?$data['page']:1;
            $db = M('cart');
            $rs = $db
                ->where('user_id='.$id)
                ->join('LEFT JOIN onethink_product ON onethink_product.id=onethink_cart.product_id')
                ->field('*,onethink_cart.id as cart_id, onethink_product.id as pid')
                ->order('onethink_cart.addtime DESC')
                ->page($page, 20)
                ->select();

            $config = M('Integrate')->where('id=1')->find();

            $arr=[];$num=0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++)
                {
                    $arr[$i]['cid'] = $rs[$i]['cart_id'];
                    $arr[$i]['pid'] = $rs[$i]['pid'];
                    $arr[$i]['title'] = $rs[$i]['title'];
                    $arr[$i]['image'] = $rs[$i]['image'];
                    $arr[$i]['num'] = $rs[$i]['product_num'];
                    $arr[$i]['price'] = $rs[$i]['product_price'];

                    //参数
                    if ($rs[$i]['product_attr'] != null && $rs[$i]['product_attr'] != ""){
                        $cates = explode(',',$rs[$i]['product_attr']);
                        if ($cates) foreach ($cates as $cate)
                        {
                            //$item = explode('=',$cate);
                            $arr[$i]['parameter'][] = $cate;
                        }
                    }else{
                        $arr[$i]['parameter'] = [];
                    }

                }
                $num = 1;
            }
            $return['freight'] = $config['expenses'];          //运费
            $return['minMoney'] = $config['totalmoney'];          //满多少减免运费
            $return['list'] = $arr;

            $this->ApiReturn(0,'成功',$return, $num);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //添加到购物车
    public function addCart()
    {
        try{
            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期');
            }elseif ($data['pid']==""){
                $this->ApiReturn(20001,'请选择要添加的商品');
            }elseif ($data['num']==""){
                $this->ApiReturn(20001,'请选择商品数量');
            }
            $pid = $data['pid'];
            $id = S($data['token']);
            $db = M('Cart');
            $attr = $data['attr'];

            //商品还在不在
            $product = M('product')->where(array('product_id' => $data['pid']))->find();
            if (!$product)
            {
                $this->ApiReturn(39003, '商品不存在');
            }

            //价格
            $produuct_arr = M('ProductAttr')->where(array('product_id'=>$pid))->find();
            $price = 0;

            if (!$produuct_arr) {
                //商品没有参数
                $price = $product['gprice'];
                if ($product['stock'] < $data['num']){
                    $this->ApiReturn(39005, '商品库存不足');
                }
            }else{
                if (!$attr){
                    //商品有参数 但是没有传
                    $this->ApiReturn(39004,'请选择商品参数');
                }else{
                    $attr_str = "";
                    $value = explode(',',$attr);
                    foreach ($value as $item){
                        $key = explode('=', $item);
                        $attr_str .= $key[1];
                    }

                    $product_price = M('ProductAttr')->where(array('product_id'=>$data['pid'], 'attr_value'=>$attr_str))->find();
                    if (!$product_price)
                    {
                        $this->ApiReturn(39004, '商品参数不存在',$attr_str);
                    }
                    if ($product_price['stock'] < $data['num'])
                    {
                        $this->ApiReturn(39005, '商品库存不足');
                    }
                    $price = $product_price['price'];
                }
            }

            $map['user_id'] = $id;
            $map['product_id'] = $pid;
            $map['product_attr'] = $attr;

            $cart_pro = $db->where($map)->find();
            if ($cart_pro){
                //数量增加
                $new_num = $cart_pro['product_num'] + $data['num'];
                try{
                    $db->where($map)->save(array('product_num'=>$new_num));
                } catch (\Exception $e){
                    $this->ApiReturn(10002,'系统错误');
                }
                $this->ApiReturn(0, '成功');
            }

            $map['product_price'] = $price;
            $map['product_num'] = $data['num'];
            $map['addtime'] = time();
            //$map['status'] = 1;
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

    //修改商品数量、参数
    public function editCartNum()
    {
        try{
            $data = $this->data;
            if ($data['cid']==""){
                $this->ApiReturn(20001, "请选择要修改的商品");
            }elseif ($data['num']==""){
                $this->ApiReturn(20001, "请选择要修改的商品数量");
            }
            $db = M('cart');
            $id = S($data['token']);
            $cid = $data['cid'];
            $num = $data['num'];
            $pro = $db->where(array('user_id'=>$id, 'id'=>$cid))->find();
            if (!$pro)
            {
                $this->ApiReturn(20002, "非法操作");
            }
            //if ($pro['product_num'] < 1 || $num < 1)
            if ($num < 1)
            {
                $this->ApiReturn(34001, "商品数量不能再减少了哦");
            }
            try{
                $db->where(array('id'=>$cid))->save(array('product_num'=>$num));
            } catch (\Exception $e) {
                $this->ApiReturn(10002,'系统错误');
            }
            $this->ApiReturn(0, "修改成功");
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //删除商品
    public function delCart()
    {
        try{
            $data = $this->data;
            if (empty($data['cids'])){
                $this->ApiReturn(20001, "请选择要删除的商品");
            }
            $cids = $data['cids'];
            if (!is_array($data['cids'])){
                $cids = explode(',', $data['cids']);
            }
            $db = M('cart');
            $id = S($data['token']);

            foreach ($cids as $item)
            {
                if (!$db->where(array('user_id'=>$id, 'id'=>$item))->find()){
                    $this->ApiReturn(20002, "非法操作");
                }
                try{
                    $db->where(array('id'=>$item))->delete();
                } catch (\Exception $e){
                    $this->ApiReturn(10000,'网络错误');
                }
            }

            $this->ApiReturn(0, "删除成功");
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    protected function getFreight()
    {
        $config = M('Integrate')->where('id=1')->find();
        return $config['expenses'];
    }
}