<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/7
 * Time: 11:39
 */

namespace Clientapi\Controller;


class OrderController extends UserApiBaseController
{

    //全部订单
    public function index()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $db_order = M('Order');
            $db_order_detail = M('OrderDetail');
            $page = $data['page']?$data['page']:1;
            if ($data['status']!=""){
                if ($data['status']==6){
                    $where['is_drawback'] = 1;
                }else{
                    $where['onethink_order.status'] = $data['status'];
                    $where['is_drawback'] = 0;
                }
            }
            $where['user_id'] = $id;
            $where['is_del'] = 0;

            $rs = $db_order->where($where)->page($page, 20)->order('addtime desc')->select();
            $arr=[];$num=0;
            if ($rs){
                for ($i=0;$i<count($rs);$i++){
                    $arr[$i]['orderID'] = $rs[$i]['id'];
                    $arr[$i]['order_sn'] = $rs[$i]['sn'];
                    if ($rs[$i]['is_drawback']==1){
                        $arr[$i]['status'] = 6;     //订单状态，已退款
                    }else{
                        $arr[$i]['status'] = $rs[$i]['status'];     //订单状态，0待付款，1代发货，2待收货，3已完成，4已取消， 5待评价
                    }
                    $arr[$i]['money'] = $rs[$i]['pay_money'];
                    $arr[$i]['freight'] = $rs[$i]['express_money'];

                    $arr[$i]['product']=[];
                    $arr[$i]['pro_num'] = 0;

                    //商品
                    $product = $db_order_detail
                        ->join('LEFT JOIN onethink_product ON onethink_product.id=onethink_order_detail.product_id')
                        ->where(array('order_id'=>$rs[$i]['id']))
                        ->field('*, onethink_order_detail.id as orderDetailID')
                        ->select();
                    if (!$product){
                        continue;
                    }

                    for ($j=0;$j<count($product);$j++){
                        $arr[$i]['product'][$j]['orderDetailID'] = $product[$j]['orderDetailID'];
                        $arr[$i]['product'][$j]['pid'] = $product[$j]['product_id'];
                        $arr[$i]['product'][$j]['title'] = $product[$j]['title'];
                        $arr[$i]['product'][$j]['image'] = $product[$j]['image'];
                        $arr[$i]['product'][$j]['price'] = $product[$j]['product_price'];
                        $arr[$i]['product'][$j]['num'] = $product[$j]['product_num'];
                        $arr[$i]['product'][$j]['attr'] = $product[$j]['product_attr'];

                        $arr[$i]['pro_num'] += $product[$j]['product_num'];
                    }
                }
                $num = 1;
            }

            $this->ApiReturn(0, '成功', $arr, $num);
        }catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //确认订单----购物车来的
    public function checkOrderFromCart()
    {
        try{
            $data = $this->data;
            //多个商品
            $id = S($data['token']);
            if ($data['cids'] == ""){                //eg. 12,13
                $this->ApiReturn(20001, '没有选择商品');
            }
            $cid = explode(',', $data['cids']);
            $arr=[];$total_money=0;

            //收货地址
            $address = M('UserAddress')->where(array('user_id'=>$id, 'is_default'=>1, 'status'=>1))->find();
            if (!$address){
                $address = M('UserAddress')->where(array('user_id'=>$id, 'status'=>1))->find();
            }
            $arr['address']['aid'] = $address['id'];
            $arr['address']['name'] = $address['name'];
            $arr['address']['phone'] = $address['mobile'];
            $arr['address']['detail'] = $address['area'].$address['address'];

            //商品详情部分
            if ($cid)
            {
                for ($i=0;$i<count($cid);$i++)
                {

                    $rs = M('cart')
                        ->join('LEFT JOIN onethink_product ON onethink_product.id=onethink_cart.product_id')
                        ->field('*,onethink_cart.id as cart_id, onethink_product.id as pid')
                        ->where(array('onethink_cart.id'=>$cid[$i], 'user_id'=>$id))
                        ->find();
                    if (!$rs){
                        $this->ApiReturn(20002, '非法操作');
                    }

                    $arr['product'][$i]['pid'] = $rs['product_id'];
                    $arr['product'][$i]['title'] = $rs['title'];
                    $arr['product'][$i]['image'] = $rs['image'];
                    $arr['product'][$i]['num'] = $rs['product_num'];
                    $arr['product'][$i]['price'] = $rs['product_price'];

                    $total_money += $rs['product_price']*$rs['product_num'];

                    //参数
                    $attr_str = "";
                    $value = explode(',',$rs['product_attr']);
                    foreach ($value as $item){
                        $key = explode('=', $item);
                        $attr_str .= ' '.$key[1];
                    }
                    $arr['product'][$i]['attr'] = $attr_str;
                }
            }

            $arr['totalMoney'] = $total_money;
            $arr['totalNum'] = count($cid);
            $arr['cids'] = $data['cids'];

            $this->ApiReturn(0, '成功', $arr);

        }catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //确认订单----商品直接购买
    public function checkOrderFromProduct()
    {
        try{
            $data = $this->data;
            if ($data['pid']==""){
                $this->ApiReturn(20001,'请选择要购买的商品');
            }elseif ($data['num']==""){
                $this->ApiReturn(20001,'请选择商品数量');
            }
            $pid = $data['pid'];
            $id = S($data['token']);
            $attr = $data['attr'];
            $num = $data['num'];

            //商品详情部分start
            //商品还在不在
            $product = M('product')->where(array('id' => $data['pid']))->find();
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
                if ($product['stock'] < $num){
                    $this->ApiReturn(39005, '商品库存不足');
                }
            }else{
                $attr_str = "";
                if (!$attr){
                    //商品有参数 但是没有传
                    $this->ApiReturn(39004,'请选择商品参数');
                }else{
                    $value = explode(',',$attr);
                    foreach ($value as $item){
                        $key = explode('=', $item);
                        $attr_str .= $key[1];
                    }

                    $product_price = M('ProductAttr')->where(array('product_id'=>$data['pid'], 'attr_value'=>$attr_str))->find();
                    if (!$product_price)
                    {
                        $this->ApiReturn(39004, '商品参数不存在');
                    }
                    if ($product_price['stock'] < $num)
                    {
                        $this->ApiReturn(39005, '商品库存不足');
                    }
                    $price = $product_price['price'];
                }
            }
            $arr['product'][0]['pid'] = $product['id'];
            $arr['product'][0]['title'] = $product['title'];
            $arr['product'][0]['image'] = $product['image'];
            $arr['product'][0]['num'] = $num;
            $arr['product'][0]['price'] = $price;
            $arr['product'][0]['attr'] = $attr_str;

            //收货地址start
            $address = M('UserAddress')->where(array('user_id'=>$id, 'is_default'=>1, 'status'=>1))->find();
            if (!$address){
                $address = M('UserAddress')->where(array('user_id'=>$id, 'status'=>1))->find();
            }
            $arr['address']['aid'] = $address['id'];
            $arr['address']['name'] = $address['name'];
            $arr['address']['phone'] = $address['mobile'];
            $arr['address']['detail'] = $address['area'].$address['address'];
            $arr['totalMoney'] = $price*$num;
            $arr['totalNum'] = 1;

            $this->ApiReturn(0, '成功', $arr);

        }catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //提交订单---购物车
    public function submitOrderFromCart()
    {
        try{
            $data = $this->data;

//            var_dump($data);
            if ($data['addressID']==""){
                $this->ApiReturn(20001, '请选择收货地址');
            } elseif ($data['cids'] == ""){                //eg. 12,13
                $this->ApiReturn(20001, '没有选择商品');
            } elseif ($data['delivery'] == ""){
                $this->ApiReturn(20001, '请选择配送方式');
            }
            $cids = explode(',', $data['cids']);
            $id = S($data['token']);
            $db_cart = M('cart');

            $money=0;//总金额

            //是不是这个人的购物车的东西
            foreach ($cids as $cid){
                $cart_pro = $db_cart->where(array('id'=>$cid, 'user_id'=>$id))->find();
                if (!$cart_pro){
                    $this->ApiReturn(20002, '非法操作');
                }
                $money += $cart_pro['product_price']*$cart_pro['product_num'];

            }

            //运费
            $int = M('Integrate')->where('id=1')->find();
            if ($money >= $int['totalmoney']){          //满 减运费
                $map['express_money'] = 0;
            }else{
                $map['express_money'] = $int['expenses'];
            }

            $map['user_id'] = $id;
            $map['sn'] = date('YmdHis').rand(0,999);
            $map['money'] = $money+$map['express_money'];
            $map['pro_money'] = $money;
            $map['type'] = $data['delivery'];       //提货方式，0送货，1自提
            $map['address_id'] = $data['addressID'];
            if ($data['delivery']==1){
                $map['express_money'] = 0;
                $map['depot_id'] = $data['depotID'];        //自提点id
            }

            $pay_money = $map['money'];

            //优惠券
            if ($data['couponID']!=""){
                $coupon_detail = M('coupon')
                    ->join('LEFT JOIN onethink_coupon_detail ON onethink_coupon.id=onethink_coupon_detail.coupon_id')
                    ->where(array('onethink_coupon_detail.id'=>$data['couponID'], 'onethink_coupon_detail.user_id'=>$id))->find();
                if ($coupon_detail && $coupon_detail['is_ply']==0){
                    $map['coupon_id'] = $data['couponID'];
                    $map['coupon_money'] = $coupon_detail['money'];
                    $pay_money -= $coupon_detail['money'];
                    M('CouponDetail')->where(array('id'=>$data['couponID']))->save(array('is_ply'=>1, 'sn'=>$map['sn'], 'plytime'=>time()));
                }
            }

            //代金券
            if ($data['cashCouponID']!=""){
                $cash_detail = M('CashcouponDetail')->where(array('id'=>$data['cashCouponID'], 'user_id'=>$id))->find();
                if ($cash_detail && $cash_detail['is_ply']==0){
                    $map['cashcoup_id'] = $data['cashCouponID'];
                    $map['cashcoup_money'] = $cash_detail['money'];
                    $pay_money -= $cash_detail['money'];
                    M('CashcouponDetail')->where(array('id'=>$data['cashCouponID']))->save(array('is_ply'=>1, 'plytime'=>time()));
                }
            }

            if ($pay_money<0){
                $pay_money=0;
            }
            $map['pay_money'] = $pay_money;       //实际支付的金额

            //留言
            if ($data['note']!=""){
                $map['note'] = $data['note'];
            }
            $map['addtime'] = time();

            try{
                $order_id = M('order')->add($map);
            }catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }

            $map2['order_id'] = $order_id;
            //把东西加到订单详情 删除购物车里的商品
            foreach ($cids as $cid){
                $cart_pro = $db_cart->where(array('id'=>$cid, 'user_id'=>$id))->find();
                //把购物车的东西加到订单详情
                $map2['product_id'] = $cart_pro['product_id'];
                $map2['product_num'] = $cart_pro['product_num'];
                $map2['product_attr'] = $cart_pro['product_attr'];
                $map2['product_price'] = $cart_pro['product_price'];
                if (M('OrderDetail')->add($map2)){
                    //删除购物车的东西
                    $db_cart->where(array('id'=>$cid, 'user_id'=>$id))->delete();
                }
            }

            $arr['orderID'] = $order_id;

            $oid = $order_id;
            $rs = M('Order')->where(array('id'=>$oid))->find();
            if (!$rs){
                $this->ApiReturn(39006, '订单不存在');
            }

            $arr['time'] = date('Y-m-d H:i:s', $rs['addtime']);
            $arr['sn'] = $rs['sn'];
            $arr['proMoney'] = $rs['pro_money'];
            $arr['express'] = $rs['express_money'];
            $arr['couponMoney'] = $rs['coupon_money'];
            $arr['cashcoupMoney'] = $rs['cashcoup_money'];
            $arr['payMoney'] = $rs['pay_money'];



            $this->ApiReturn(0, '成功', $arr);
            //支付成功后减库存

        }catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //提交订单---来自直接购买
    public function submitOrderFromPro()
    {
        try{
            $data = $this->data;
            if ($data['addressID']==""){
                $this->ApiReturn(20001, '请选择收货地址');
            } elseif ($data['pid'] == ""){                //eg. 12
                $this->ApiReturn(20001, '没有选择商品');
            } elseif ($data['delivery'] == ""){
                $this->ApiReturn(20001, '请选择配送方式');
            } elseif ($data['num']==""){
                $this->ApiReturn(20001,'请选择商品数量');
            }

            $pid = $data['pid'];
            $id = S($data['token']);
            $attr = $data['attr'];
            $num = $data['num'];

            //商品详情部分start
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
                if ($product['stock'] < $num){
                    $this->ApiReturn(39005, '商品库存不足');
                }
            }else{
                $attr_str = "";
                if (!$attr){
                    //商品有参数 但是没有传
                    $this->ApiReturn(39004,'请选择商品参数');
                }else{
                    $value = explode(',',$attr);
                    foreach ($value as $item){
                        $key = explode('=', $item);
                        $attr_str .= $key[1];
                    }

                    $product_price = M('ProductAttr')->where(array('product_id'=>$data['pid'], 'attr_value'=>$attr_str))->find();
                    if (!$product_price)
                    {
                        $this->ApiReturn(39004, '商品参数不存在');
                    }
                    if ($product_price['stock'] < $num)
                    {
                        $this->ApiReturn(39005, '商品库存不足');
                    }
                    $price = $product_price['price'];
                }
            }


            //运费
            $int = M('Integrate')->where('id=1')->find();
            if ($price >= $int['totalmoney']){          //满 减运费
                $map['express_money'] = 0;
            }else{
                $map['express_money'] = $int['expenses'];
            }

            $map['user_id'] = $id;
            $map['sn'] = date('YmdHis').rand(0,999);
            $map['money'] = $price*$num+$map['express_money'];
            $map['pro_money'] = $price*$num;
            $map['type'] = $data['delivery'];       //提货方式，0送货，1自提
            $map['address_id'] = $data['addressID'];
            if ($data['delivery']==1){
                $map['express_money'] = 0;
                $map['depot_id'] = $data['depotID'];        //自提点id
            }


            $pay_money=$map['money'];
            //优惠券
            if ($data['couponID']!=""){
                $coupon_detail = M('coupon')
                    ->join('LEFT JOIN onethink_coupon_detail ON onethink_coupon.id=onethink_coupon_detail.coupon_id')
                    ->where(array('onethink_coupon_detail.id'=>$data['couponID'], 'onethink_coupon_detail.user_id'=>$id))->find();
                if ($coupon_detail && $coupon_detail['is_ply']==0){
                    $map['coupon_id'] = $data['couponID'];
                    $map['coupon_money'] = $coupon_detail['money'];
                    $pay_money -= $coupon_detail['money'];
                    M('CouponDetail')->where(array('id'=>$data['couponID']))->save(array('is_ply'=>1, 'sn'=>$map['sn'], 'plytime'=>time()));
                }
            }

            //代金券
            if ($data['cashCouponID']!=""){
                $cash_detail = M('CashcouponDetail')->where(array('id'=>$data['cashCouponID'], 'user_id'=>$id))->find();
                if ($cash_detail && $cash_detail['is_ply']==0){
                    $map['cashcoup_id'] = $data['cashCouponID'];
                    $map['cashcoup_money'] = $cash_detail['money'];
                    $pay_money -= $cash_detail['money'];
                    M('CashcouponDetail')->where(array('id'=>$data['cashCouponID']))->save(array('is_ply'=>1, 'plytime'=>time()));
                }
            }

            if ($pay_money<0){
                $pay_money=0;
            }
            $map['pay_money'] = $pay_money;       //实际支付的金额

            //留言
            if ($data['note']!=""){
                $map['note'] = $data['note'];
            }
            $map['addtime'] = time();

            try{
                $order_id = M('order')->add($map);
            }catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }

            $map2['order_id'] = $order_id;
            //把购物车的东西加到订单详情
            $map2['product_id'] = $data['pid'];
            $map2['product_num'] = $num;
            $map2['product_attr'] = $attr;
            $map2['product_price'] = $price;
            try{
                $order_detail_id = M('OrderDetail')->add($map2);
            } catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }

            $arr['orderID'] = $order_id;
            //$return['orderDetailID'] = $order_detail_id;


            $oid = $order_id;
            $rs = M('Order')->where(array('id'=>$oid))->find();
            if (!$rs){
                $this->ApiReturn(39006, '订单不存在');
            }

            $arr['time'] = date('Y-m-d H:i:s', $rs['addtime']);
            $arr['sn'] = $rs['sn'];
            $arr['proMoney'] = $rs['pro_money'];
            $arr['express'] = $rs['express_money'];
            $arr['couponMoney'] = $rs['coupon_money'];
            $arr['cashcoupMoney'] = $rs['cashcoup_money'];
            $arr['payMoney'] = $rs['pay_money'];



            $this->ApiReturn(0, '成功', $arr);
            //支付成功后减库存
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //二次确认订单
    public function checkOrder()
    {
        try{
            $data = $this->data;
            if ($data['orderID']==""){
                $this->ApiReturn(20001, '没有提交订单');
            }
            $oid = $data['orderID'];
            $rs = M('Order')->where(array('id'=>$oid))->find();
            if (!$rs){
                $this->ApiReturn(39006, '订单不存在');
            }

            $arr['time'] = date('Y-m-d H:i:s', $rs['addtime']);
            $arr['sn'] = $rs['sn'];
            $arr['proMoney'] = $rs['pro_money'];
            $arr['express'] = $rs['express_money'];
            $arr['couponMoney'] = $rs['coupon_money'];
            $arr['cashcoupMoney'] = $rs['cashcoup_money'];
            $arr['payMoney'] = $rs['pay_money'];

            $this->ApiReturn(0, '成功', $arr);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //订单详情页
    public function detail()
    {
        try{
            $data = $this->data;
            if ($data['orderID']==""){
                $this->ApiReturn(20001, '请选择要查看的订单');
            }
            $id = S($data['token']);
            $oid = $data['orderID'];
            $rs = M('Order')
                 ->join('LEFT JOIN onethink_user_address ON onethink_user_address.id=onethink_order.address_id')
                ->where(array('onethink_order.id'=>$oid, 'onethink_order.user_id'=>$id))
                ->field('*,onethink_order.status as o_status')
                ->find();
            if (!$rs){
                $this->ApiReturn(39007,'订单异常');
            }

            $arr = [];
            $arr['orderID'] = $oid;
            $arr['sn'] = $rs['sn'];
            $arr['time'] = date('Y-m-d H:i:s');

            $arr['address']['name'] = $rs['name'];
            $arr['address']['phone'] = $rs['mobile'];
            $arr['address']['detail'] = $rs['area'].$rs['address'];

            $arr['delivery'] = $rs['type'];         //提货方式，0送货，1自提
            if ($rs['type']==1){
                $shop_add = M('Store')->where(array('id'=>$rs['depot_id']))->find();
                if (!$shop_add){

                }
                $arr['shop']['name'] = $shop_add['sname'];
                $arr['shop']['address'] = $shop_add['sadd'];
                $arr['shop']['tel'] = $shop_add['mobile'];
            }

            if ($rs['is_drawback']==1){
                $arr['status'] = 6;     //订单状态，已退款
            }else{
                $arr['status'] = $rs['o_status'];         //订单状态，0待付款，1代发货，2待收货，3已完成，4已取消， 5待评价
            }

            $details = M('OrderDetail')->where(array('order_id'=>$oid))->select();
            if ($details){
                for ($i=0;$i<count($details);$i++){
                    $pro = M('Product')->where(array('id'=>$details[$i]['product_id']))->find();
                    $arr['product'][$i]['pid'] = $details[$i]['product_id'];
                    $arr['product'][$i]['name'] = $pro['title'];
                    $arr['product'][$i]['image'] = $pro['image'];
                    $arr['product'][$i]['attr'] = $details[$i]['product_attr'];
                    $arr['product'][$i]['price'] = $details[$i]['product_price'];
                    $arr['product'][$i]['num'] = $details[$i]['product_num'];
                }
            }

            $arr['proMoney'] = $rs['pro_money'];
            $arr['express'] = $rs['express_money'];
            $arr['couponMoney'] = $rs['coupon_money'];
            $arr['cashcoupMoney'] = $rs['cashcoup_money'];
            $arr['payMoney'] = $rs['pay_money'];

            $this->ApiReturn(0, '成功', $arr);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //评论订单
    public function getOrderDetail()
    {
        try{
            $data = $this->data;
            if ($data['orderID']==""){
                $this->ApiReturn(20001, '请选择要评价的订单');
            }
            $id = S($data['token']);
            $oid = $data['orderID'];
            //判断是不是这个人的订单
            if (!M('order')->where(array('id'=>$oid, 'user_id'=>$id))->find()){
                $this->ApiReturn(20002, '非法操作');
            }
            $order_detail = M('OrderDetail')
                ->join('LEFT JOIN onethink_product ON onethink_product.id=onethink_order_detail.product_id')
                ->where(array('order_id'=>$oid))
                ->field('*, onethink_order_detail.id as orderDetailID')
                ->select();

            $arr=[];$num=0;
            if ($order_detail){
                for ($j=0;$j<count($order_detail);$j++){
                    $arr[$j]['orderID'] = $data['orderID'];
                    $arr[$j]['productID'] = $order_detail[$j]['product_id'];
                    $arr[$j]['orderDetailID'] = $order_detail[$j]['orderDetailID'];
                    $arr[$j]['image'] = $order_detail[$j]['image'];
                }
                $num=1;
            }
            $this->ApiReturn(0, '成功', $arr, $num);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }
    //评论订单
    public function postProComment()
    {
        try{
            $data = $this->data;
            if ($data['orderID']==""){
                $this->ApiReturn(20001, '请选择要评价的订单');
            }elseif($data['productID']==""){
                $this->ApiReturn(20001, '请选择要评价的商品');
            }elseif($data['orderDetailID']==""){
                $this->ApiReturn(20001, '请选择要评价的商品');
            }elseif ($data['comment']==""){
                $this->ApiReturn(20001, '请输入评论');
            }elseif ($data['star']==""){
                $this->ApiReturn(20001, '请对商品进行星级评价');
            }

            $id = S($data['token']);
            $oid = $data['orderID'];
            $pid = $data['productID'];
            //判断是不是这个人的订单
            if (!M('order')->where(array('id'=>$oid, 'user_id'=>$id))->find()){
                $this->ApiReturn(20002, '非法操作');
            }

            try{
                M('Order')->where(array('id'=>$data['orderID']))->save(array('status'=>3));
            } catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }

            $arr['order_id'] = $oid;
            $arr['user_id'] = $id;
            $arr['product_id'] = $pid;
            $arr['order_detail_id'] = $data['orderDetailID'];
            $arr['score'] = $data['star'];
            $arr['desc'] = $data['comment'];
            $arr['addtime'] = time();
            $arr['status'] = 1;
            $arr['anonymous'] = $data['anonymous']?$data['anonymous']:1;

            try{
                M('evaluate')->add($arr);
            } catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }
            $this->ApiReturn(0, '成功');

        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //退款申请
    public function postProRefunds()
    {
        try{
            $data = $this->data;
            if ($data['orderID']==""){
                $this->ApiReturn(20001, '请选择申请退款的订单');
            }elseif ($data['name']==""){
                $this->ApiReturn(20001, '请填写一个联系人姓名');
            }elseif ($data['mobile']==""){
                $this->ApiReturn(20001, '请填写一个联系方式');
            }elseif ($data['detail']==""){
                $this->ApiReturn(20001, '请填写退款原因');
            }

            $id = S($data['token']);
            $order = M('Order')->where(array('id'=>$data['orderID'],'user_id'=>$id))->find();
            if (!$order){
                $this->ApiReturn(20002, '非法操作');
            }

            if ($order['status'] != 1 && $order['status'] != 5){
                $this->ApiReturn(39008, '订单状态不允许申请退款');
            }

            try{
                M('Order')->where(array('id'=>$data['orderID']))->save(array('is_drawback'=>1));
            } catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }

            $arr['name'] = $data['name'];
            $arr['mobile'] = $data['mobile'];
            $arr['detail'] = $data['detail'];
            $arr['order_id'] = $data['orderID'];
            $arr['addtime'] = time();
            try{
                M('OrderRefunds')->add($arr);
            } catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }
            $this->ApiReturn(0, '成功');
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //取消订单
    public function postCancelOrder()
    {
        try{
            $data = $this->data;
            if ($data['orderID']==""){
                $this->ApiReturn(20001, '请选择取消的订单');
            }
            $id = S($data['token']);
            $order = M('Order')->where(array('id'=>$data['orderID'],'user_id'=>$id))->find();
            if (!$order){
                $this->ApiReturn(20002, '非法操作');
            }
            if ($order['status'] != 0){
                $this->ApiReturn(39008, '已发货订单不能取消');
            }

            try{
                M('Order')->where(array('id'=>$data['orderID']))->save(array('status'=>4));
            } catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }
            $this->ApiReturn(0, '成功');
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //确认收货
    public function postReceipt()
    {
        try{
            $data = $this->data;
            if ($data['orderID']==""){
                $this->ApiReturn(20001, '请选择确认收货的订单');
            } elseif (!S($data['token'])){
                $this->ApiReturn(20003, 'token无效或已过期');
            }
            $id = S($data['token']);
            $order = M('Order')->where(array('id'=>$data['orderID'],'user_id'=>$id))->find();
            if (!$order){
                $this->ApiReturn(20002, '非法操作');
            }
            if ($order['status'] != 2){
                $this->ApiReturn(39008, '订单状态不允许确认收货');
            }

            try{
                M('Order')->where(array('id'=>$data['orderID']))->save(array('status'=>5));
            } catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }
            $this->ApiReturn(0, '成功');
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //删除订单
    public function delOrder()
    {
        try{
            $data = $this->data;
            if ($data['orderID']==""){
                $this->ApiReturn(20001, '没有选择要删除的订单');
            } elseif (!S($data['token'])){
                $this->ApiReturn(20003, 'token无效或已过期');
            }
            $id = S($data['token']);
            $order = M('Order')->where(array('id'=>$data['orderID'],'user_id'=>$id))->find();
            if (!$order){
                $this->ApiReturn(20002, '非法操作');
            }
            if ($order['status'] != 3 && $order['status'] != 4 && $order['is_drawback'] != 1){
                $this->ApiReturn(39008, '订单状态不允许删除');
            }
            M('Order')->where(array('id'=>$data['orderID']))->save(array('is_del'=>1));
            $this->ApiReturn(0, '成功');
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

}