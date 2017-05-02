<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/4
 * Time: 11:39
 */

namespace Clientapi\Controller;


class UserController extends UserApiBaseController
{

    public function index()
    {
        echo "Welcome!";
    }

    //用户信息
    protected function userInfo($user_id)
    {
        try {
            $db_user=M("user");
            $id=$user_id;
            $info = $db_user->where('id='.$id)->find();

            //等级名称
            $grade = M('grade')->where('id='.$info['lv'])->getField('gname');

            $arr=array();
            //$arr['uid'] = $info['id'];
            $arr['phone'] = $info['mobile'];
            $arr['name'] = $info['name']?$info['name']:$info['mobile'];
            $arr['points'] = $info['integral'];  //积分
            $arr['gender'] = $info['sex'];
            $arr['headImg'] = $info['image']?$info['image']:'/public/Home/img/zhanweihead.png';
            $arr['money'] = $info['money'];
            $arr['commission'] = $info['jie_money'];    //分销佣金
            $arr['className'] = "V".$info['lv'].$grade;    //会员消费等级
            $arr['userNum'] = $info['card_num'];    //会员编号
            $arr['openid'] = $info['openid'];

            //是否签到
            $arr['sign'] = -1;
            $last_sign = date('Y-m-d H:i:s',$info['signtime']);
            if (substr($last_sign,0,10) == date('Y-m-d')){
                $arr['sign'] = 1;
            }

            //是否有新消息
            $arr['msg'] = -1;
            if (M('Msg')->where(array('user_id'=>$id, 'status'=>'-1'))->select()){
                $arr['msg'] = 1;
            }

            //订单数量
            $arr['order'] = [];
            $order = M('Order');
            $arr['order']['pendingPayment'] = $order->where(array('user_id'=>$id, 'status'=>0, 'is_drawback'=>0))->count();       //待付款
            $arr['order']['pendingDelivered'] = $order->where(array('user_id'=>$id, 'status'=>1, 'is_drawback'=>0))->count();     //待发货
            $arr['order']['pendingReceived'] = $order->where(array('user_id'=>$id, 'status'=>2, 'is_drawback'=>0))->count();     //待收货
            $arr['order']['pendingEvaluated'] = $order->where(array('user_id'=>$id, 'status'=>5, 'is_drawback'=>0))->count();     //待评价
            $arr['order']['pendingRefunded'] = $order->where(array('user_id'=>$id, 'is_drawback'=>1, 'is_del'=>0))->count();     //退款

            return $arr;
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //获取用户个人信息
    public function info(){
        try {
            $data = $this->data;
            $arr = $this->userInfo(S($data['token']));

            $this->ApiReturn(0,'成功', $arr);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //修改用户个人信息31
    public function modifyUserInfo()
    {
        try {
            $data = $this->data;
            $db = M('user');
            $map=array();
            if ($data['name']){
                $map['name'] = $data['name'];
            }
            if ($data['headImg']){
                $map['image'] = $data['headImg'];
            }
            if ($data['gender']){
                $map['sex'] = $data['gender'];
            }
            $rs = $db->where('id='.S($data['token']))->save($map);

            $this->ApiReturn(0,"修改成功！");
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //获取用户收货地址
    public function getUserAddress()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $res = array();
            $page = $data['page']?$data['page']:1;
            try{
//                $rs = M("user_address")->where(array('user_id'=>$id,'status'=>1))->page($page, 20)->select();
                $rs = M("user_address")->where(array('user_id'=>$id,'status'=>1))->select();
            }catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }

            $res = [];
            $num = 0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++){
                    $res[$i]['id'] = $rs[$i]['id'];
                    $res[$i]['name'] = $rs[$i]['name'];
                    $res[$i]['gender'] = $rs[$i]['sex'];
                    $res[$i]['phone'] = $rs[$i]['mobile'];
                    $res[$i]['area'] = $rs[$i]['area'];
                    $res[$i]['address'] = $rs[$i]['address'];
                    $res[$i]['is_default'] = $rs[$i]['is_default'];
                }
                $num = 1;
            }
            $this->ApiReturn(0,"查询成功",$res, $num);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //修改地址32
    public function modifyAddressMes()
    {
        try{
            $data = $this->data;
            if ($data['aid']==""){
                $this->ApiReturn(20001,'必传参数不存在');
            }elseif ($data['name']==""){
                $this->ApiReturn(20001, '联系人姓名不能为空');
            }elseif ($data['phone']==""){
                $this->ApiReturn(20001, '联系方式不能为空');
            }elseif ($data['area']==""){
                $this->ApiReturn(20001, '城市地区不能为空');
            }elseif ($data['address']==""){
                $this->ApiReturn(20001, '联系地址不能为空');
            }
            /*elseif (preg_match("/^17[0-9]{1}[0-9]{8}$|14[0-9]{1}[0-9]{8}$|13[0-9]{1}[0-9]{8}$|15[0-9]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$/",$data->phone)){
                $this->ApiReturn(20001, '请输入正确的联系方式');
            }*/
            $db = M("user_address");
            if (!$db->where(array('id'=>$data['aid'],'user_id'=>S($data['token'])))->find()){
                $this->ApiReturn(32001,'修改失败');
            }
            $map['name'] = $data['name'];
            $map['sex'] = $data['gender'];
            $map['mobile'] = $data['phone'];
            $map['area'] = $data['area'];
            $map['address'] = $data['address'];

            $rs = $db->where('id='.$data['aid'])->save($map);
            $this->ApiReturn(0,'修改成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002, '系统错误');
        }
    }

    //修改默认地址33
    public function modifyDefaultAddress()
    {
        try{
            $data = $this->data;
            if ($data['aid']==""){
                $this->ApiReturn(20001,'必传参数不存在');
            }
            $db = M("user_address");
            if (!$db->where(array('id'=>$data['aid'],'user_id'=>S($data['token'])))->find()){
                $this->ApiReturn(33001,'修改失败');
            }
            try{
                $rs1 = $db->where('id='.$data['aid'])->save(array('is_default'=>1));
                $map['id'] = array('NEQ',$data['aid']);
                $map['user_id'] = S($data['token']);
                $rs2 = $db->where($map)->save(array('is_default'=>0));
            } catch (\Exception $e){
                $this->ApiReturn(10000, '网络错误');
            }

            $this->ApiReturn(0,'修改成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002, '系统错误');
        }
    }

    //新增收货地址34
    public function postAddress()
    {
        try{
            $data = $this->data;
            if ($data['name']==""){
                $this->ApiReturn(20001, '联系人姓名不能为空');
            }elseif ($data['phone']==""){
                $this->ApiReturn(20001, '联系方式不能为空');
            }elseif ($data['area']==""){
                $this->ApiReturn(20001, '城市地区不能为空');
            }elseif ($data['address']==""){
                $this->ApiReturn(20001, '联系地址不能为空');
            }
            /*elseif (preg_match("/^17[0-9]{1}[0-9]{8}$|14[0-9]{1}[0-9]{8}$|13[0-9]{1}[0-9]{8}$|15[0-9]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$/",$data['phone'])){
                $this->ApiReturn(20001, '请输入正确的联系方式');
            }*/
            $db = M("user_address");
            $map['name'] = $data['name'];
            //$map['sex'] = $data['gender'];
            $map['mobile'] = $data['phone'];
            $map['area'] = $data['area'];
            $map['address'] = $data['address'];
            $map['user_id'] = S($data['token']);

            try{
                $rs = $db->add($map);
            } catch (\Exception $e){
                $this->ApiReturn(10000, '网络错误');
            }
            if ($rs<=0){
                $this->ApiReturn(34001,'添加失败');
            }
            $this->ApiReturn(0,'添加成功');
        } catch (\Exception $e) {
            $this->ApiReturn(10002, '系统错误');
        }
    }

    //地址详情
    public function addreDetail()
    {
        try{
            $data = $this->data;
            if ($data['aid']==""){
                $this->ApiReturn(20001,'必传参数不存在');
            }
            $db = M("user_address");
            $rs = $db->where(array('id'=>$data['aid'],'user_id'=>S($data['token'])))->find();
            if (!$rs){
                $this->ApiReturn(33001,'获取失败');
            }

            $res['id'] = $rs['id'];
            $res['name'] = $rs['name'];
            $res['gender'] = $rs['sex'];
            $res['phone'] = $rs['mobile'];
            $res['area'] = $rs['area'];
            $res['address'] = $rs['address'];
            $res['is_default'] = $rs['is_default'];

            $this->ApiReturn(0,"查询成功",$res);
        } catch (\Exception $e) {
            $this->ApiReturn(10002, '系统错误');
        }
    }

    //删除地址
    public function delAddress()
    {
        try{
            $data = $this->data;
            if ($data['aid']==""){
                $this->ApiReturn(20001,'必传参数不存在');
            }
            $db = M("user_address");
            if (!$db->where(array('id'=>$data['aid'],'user_id'=>S($data['token'])))->find()){
                $this->ApiReturn(33001,'删除失败');
            }
            try{
                $db->where(array('id'=>$data['aid'],'user_id'=>S($data['token'])))->delete();
            } catch (\Exception $e) {
                $this->ApiReturn(10002, '系统错误');
            }

            $this->ApiReturn(0, "删除成功");
        } catch (\Exception $e) {
            $this->ApiReturn(10002, '系统错误');
        }
    }

    //优惠券  未过期
    public function getCouponOn()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $rs = array();
            $db = M('CouponDetail');
            $new = date('Y-m-d H:i:s');
            $page = $data['page']?$data['page']:1;
            try{
                $coupons = $db
                        ->join('LEFT JOIN onethink_coupon ON onethink_coupon.id = onethink_coupon_detail.coupon_id')
                        ->where(array('user_id'=>$id,'is_ply'=>0))
                        ->field('*, onethink_coupon_detail.id as cid')
                        //->page($page, 20)
                        ->select();
            } catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }
            $rs = [];
            $num = 0;
            if ($coupons)
            {
                for ($i=0;$i<count($coupons);$i++){
                    if ($new > $coupons[$i]['start_date'] && $new < $coupons[$i]['end_date']){
                        $rs[$i]['cid'] = $coupons[$i]['cid'];
                        $rs[$i]['title'] = $coupons[$i]['title'];
                        $rs[$i]['start'] = $coupons[$i]['start_date'];
                        $rs[$i]['end'] = $coupons[$i]['end_date'];
                        //$rs[$i]['receive'] = $coupons[$i]['addtime'];   //领取时间
                        $rs[$i]['money'] = $coupons[$i]['money'];   //金额
                        $rs[$i]['minConsumption'] = $coupons[$i]['lowest'];   //满多少可用
                        if($coupons[$i]['pid'] == 0){
                            $rs[$i]['product'] = "不限购";
                        }else{
                            try{
                                $product = M('Product')->where('id='.$coupons[$i]['pid'])->find();
                            } catch (\Exception $e) {
                                $this->ApiReturn(10000,'网络错误');
                            }

                            $rs[$i]['product'] = $product['title'];
                        }
                    }
                }
                $num = 1;
            }
            $this->ApiReturn(0,"查询成功",$rs,$num);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //优惠券  已过期
    public function getCouponOff()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $rs = array();
            $db = M('CouponDetail');
            $new = date('Y-m-d H:i:s');
            $page = $data['page']?$data['page']:1;
            try{
                $coupons = $db
                    ->join('LEFT JOIN onethink_coupon ON onethink_coupon.id = onethink_coupon_detail.coupon_id')
                    ->where(array('user_id'=>$id,'is_ply'=>0))
                    ->field('*, onethink_coupon_detail.id as cid')
                    ->page($page, 20)
                    ->select();
            } catch (\Exception $e) {
                $this->ApiReturn(10000,'网络错误');
            }
            $rs = [];
            $num = 0;
            if ($coupons)
            {
                for ($i=0;$i<count($coupons);$i++){
                    if ($new < $coupons[$i]['start_date'] || $new > $coupons[$i]['end_date']){
                        $rs[$i]['cid'] = $coupons[$i]['cid'];
                        $rs[$i]['title'] = $coupons[$i]['title'];
                        $rs[$i]['start'] = $coupons[$i]['start_date'];
                        $rs[$i]['end'] = $coupons[$i]['end_date'];
                        //$rs[$i]['receive'] = $coupons[$i]['addtime'];   //领取时间
                        $rs[$i]['money'] = $coupons[$i]['money'];   //金额
                        $rs[$i]['minConsumption'] = $coupons[$i]['lowest'];   //满多少可用
                        $rs[$i]['pid'] = $coupons[$i]['pid'];   //满多少可用
                        if($coupons[$i]['pid'] == 0){
                            $rs[$i]['product'] = "不限购";
                        }else{
                            try{
                                $product = M('Product')->where('id='.$coupons[$i]['pid'])->find();
                            } catch (\Exception $e) {
                                $this->ApiReturn(10000,'网络错误');
                            }

                            $rs[$i]['product'] = $product['title'];
                        }
                    }
                }
                $num = 1;
            }
            $this->ApiReturn(0,"查询成功",$rs,$num);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //签到35
    public function sign(){
        try{
            $data = $this->data;
            $user_id = S($data['token']);
            $user = M('user')->where('id='.$user_id)->find();
            $last_sign = date('Y-m-d H:i:s',$user['signtime']);
            if (substr($last_sign,0,10) == date('Y-m-d')){
                $this->ApiReturn(-1,'今天已签到，明天再来吧~');
            }
            try{
                $map['signtime'] = time();
                $num = M('user')->where('id='.$user_id)->save($map);
            } catch (\Exception $e){
                $this->ApiReturn(10000,'网络错误');
            }
            if ($num<=0){
                $this->ApiReturn(35001,'签到失败');
            }

            $rs['points'] = $this->addIntegralRecord($user_id,2);
            $rs['totalPoints'] = (int)$user['integral'] + (int)$rs['points'];
            if ($rs['points'] == 0){
                $this->ApiReturn(35002,'签到失败');
            }
            $this->ApiReturn(0,'签到成功',$rs);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //消息中心
    public function messageCenter()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $page = $data['page']?$data['page']:1;
            $rs = M('Msg')->where('user_id='.$id)->page($page,20)->select();
            $ms = [];
            $num = 0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++)
                {
                    $ms[$i]['id'] = $rs[$i]['id'];
                    $ms[$i]['title'] = $rs[$i]['title'];
                    $ms[$i]['content'] = $rs[$i]['content'];
                    $ms[$i]['time'] = date('Y-m-d H:i:s',$rs[$i]['addtime']);
                    $ms[$i]['status'] = $rs[$i]['status'];
                }
                $num = 1;
            }
            $this->ApiReturn(0,'成功',$ms,$num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //批量删除 消息 36
    public function deleteMessage()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            if (empty($data['msids'])){
                $this->ApiReturn(36001,'没有选择要删除的消息');
            }
            $msids = $data['msids'];
            if (!is_array($data['msids'])){
                $msids = explode(',', $data['msids']);
            }

            foreach ($msids as $item)
            {
                if (!M('Msg')->where(array('user_id'=>$id,'id'=>$item))->find()){
                    $this->ApiReturn(20002, '非法操作');
                }
                try{
                    M('Msg')->where(array('user_id'=>$id,'id'=>$item))->delete();
                } catch (\Exception $e){
                    $this->ApiReturn(10000,'网络错误');
                }
            }
            $this->ApiReturn(0,'删除成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //阅读消息
    public function readMessage()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            if ($data['msid']==""){
                $this->ApiReturn(20001,'没有选择已读的消息');
            }
            $item = $data['msid'];
            if (!M('Msg')->where(array('user_id'=>$id,'id'=>$item))->find()){
                $this->ApiReturn(20002, '非法操作');
            }
            try{
                M('Msg')->where(array('user_id'=>$id,'id'=>$item))->save(array('status'=>1));
            } catch (\Exception $e){
                $this->ApiReturn(10000,'网络错误');
            }

            $this->ApiReturn(0,'阅读成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //修改手机号37
    public function modifyPhone()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            if ($data['password']==""){
                $this->ApiReturn(20001,'密码不能为空');
            }
            if ($data['phone']==""){
                $this->ApiReturn(20001,'手机号不能为空');
            }
            if ($data['code']==""){
                $this->ApiReturn(20001,'短信验证码不能为空');
            }
            if (strlen($data['password']) < 6){
                $this->ApiReturn(38008,'登陆密码不得少于六位');
            }
            $phone = $data['phone'];
            $code = $data['code'];
            $psd = $data['password'];
            checkPhoneCode($phone,$code);

            if (M('user')->where('mobile='.$phone)->find())
            {
                $this->ApiReturn(37001,'手机号已被注册');
            }

            $where['id'] = $id;
            $where['login_pass'] = md5($psd);
            if (!M('user')->where($where)->find())
            {
                $this->ApiReturn(37002, '密码不正确');
            }

            try{
                $map['mobile'] = $phone;
                M('user')->where('id='.$id)->save($map);
            }catch (\Exception $e){
                $this->ApiReturn(10000,'网络错误');
            }
            $this->ApiReturn(0,'修改成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //积分详情
    public function integralList()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $user = M('user')->where('id='.$id)->find();
            $rs['integral'] = $user['integral'];

            $page = $data['page']?$data['page']:1;
            $detail = M('IntegralRecord')->where('user_id='.$id)->page($page, 20)->select();
            $rs['list'] = [];
            $num = 0;
            if ($detail)
            {
                for ($i=0;$i<count($detail);$i++)
                {
                    $rs['list'][$i]['title'] = $detail[$i]['title'];
                    $rs['list'][$i]['num'] = "+".$detail[$i]['integral'];
                    $rs['list'][$i]['time'] = date('Y-m-d H:i:s', $detail[$i]['addtime']);
                }
                $num = 1;
            }

            $this->ApiReturn(0,'成功',$rs, $num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //我获得的佣金 详情
    public function brokerageList()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $user = M('user')->where('id='.$id)->find();
            $rs['total'] = $user['jie_money'];

            $page = $data['page']?$data['page']:1;
            $detail = M('BrokerageRecord')->where('parent_id='.$id)->page($page, 20)->select();
            $rs['list'] = [];
            $num = 0;
            if ($detail)
            {
                for ($i=0;$i<count($detail);$i++)
                {
                    $user2 = M('user')->where('id='.$detail[$i]['user_id'])->find();
                    $name = $user2['name']?$user2['name']:$user2['mobile'];
                    if ($detail[$i]['order_type'] == 2){
                        $type = "拼团消费";
                    }else{
                        $type = "商城消费";
                    }
                    $rs['list'][$i]['title'] = $name." ".$type;
                    $rs['list'][$i]['money'] = "+￥".$detail[$i]['money'];
                    $rs['list'][$i]['time'] = date('Y-m-d H:i:s', $detail[$i]['addtime']);
                }
                $num = 1;
            }

            $this->ApiReturn(0,'成功',$rs, $num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //我提现的佣金 详情
    public function brokerageWithdrawList()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $user = M('user')->where('id='.$id)->find();
            $rs['total'] = $user['jie_money'];

            $page = $data['page']?$data['page']:1;
            $detail = M('BrokerageWithdrawRecord')->where(array('user_id'=>$id,'draw_type'=>2))->page($page, 20)->select();
            $rs['list'] = [];
            $num = 0;
            if ($detail)
            {
                for ($i=0;$i<count($detail);$i++)
                {
                    $rs['list'][$i]['title'] = "提现";
                    $rs['list'][$i]['money'] = "-￥".$detail[$i]['money'];
                    $rs['list'][$i]['status'] = $detail[$i]['status'];
                    $rs['list'][$i]['time'] = date('Y-m-d H:i:s', $detail[$i]['addtime']);
                }
                $num = 1;
            }

            $this->ApiReturn(0,'成功',$rs,$num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //我的余额 收入--详情
    public function recordIncomeList()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $user = M('user')->where('id='.$id)->find();
            $rs['total'] = $user['money'];

            $page = $data['page']?$data['page']:1;
            $detail = M('AccountRecord')->where(array('user_id'=>$id,'type'=>1,'is_pay'=>1))->page($page, 20)->select();
            $rs['list'] = [];
            $num = 0;
            if ($detail)
            {
                for ($i=0;$i<count($detail);$i++)
                {
                    $rs['list'][$i]['title'] = $detail[$i]['title'];
                    $rs['list'][$i]['money'] = "+￥".$detail[$i]['money'];
                    $rs['list'][$i]['time'] = date('Y-m-d H:i:s', $detail[$i]['paytime']);
                }
                $num = 1;
            }

            $this->ApiReturn(0,'成功',$rs, $num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //我的余额 支出详情
    public function recordPayList()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $user = M('user')->where('id='.$id)->find();
            $rs['total'] = $user['money'];

            $page = $data['page']?$data['page']:1;
            $detail = M('AccountRecord')->where(array('user_id'=>$id,'type'=>0,'is_pay'=>1))->page($page, 20)->select();
            $rs['list'] = [];
            $num = 0;
            if ($detail)
            {
                for ($i=0;$i<count($detail);$i++)
                {
                    $rs['list'][$i]['title'] = $detail[$i]['title'];
                    $rs['list'][$i]['money'] = "-￥".$detail[$i]['money'];
                    $rs['list'][$i]['time'] = date('Y-m-d H:i:s', $detail[$i]['paytime']);
                }
                $num = 1;
            }

            $this->ApiReturn(0,'成功',$rs,$num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //我的银行卡列表
    public function bankCardList()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $page = $data['page']?$data['page']:1;
            try{
                $rs = M('bank')
                    ->join('LEFT JOIN onethink_bank_type ON onethink_bank_type.id=onethink_bank.type_id')
                    ->where('user_id='.$id)->page($page,20)->field('*, onethink_bank.id as bid')->select();
            } catch (\Exception $e){
                $this->ApiReturn(10000,'网络错误');
            }
            $arr = [];
            $num = 0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++){
                    $arr[$i]['bid'] = $rs[$i]['bid'];
                    $arr[$i]['image'] = 'http://'.$_SERVER['HTTP_HOST'].'/Public/Home/'.$rs[$i]['img'];
                    $arr[$i]['name'] = $rs[$i]['title'];
                    $arr[$i]['endnum'] = substr($rs[$i]['card_num'], -4);
                }
                $num = 1;
            }
            $this->ApiReturn(0,'成功',$arr,$num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //删除银行卡
    public function delBankCard()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            if (empty($data['bids'])){
                $this->ApiReturn(20001, '没有选择要删除的银行卡');
            }
            $bids = $data['bids'];
            if (!is_array($data['bids'])){
                $bids = explode(',', $data['bids']);
            }

            foreach ($bids as $bid){
                if (!M('bank')->where(array('id'=>$bid, 'user_id'=>$id))->find()){
                    $this->ApiReturn(20002, '非法操作');
                }
                try{
                    M('bank')->where(array('id'=>$bid, 'user_id'=>$id))->delete();
                } catch (\Exception $e){
                    $this->ApiReturn(10000,'网络错误');
                }
            }
            $this->ApiReturn(0,'成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //可添加的银行列表
    public function bankList()
    {
        try{
            $rs = M('BankType')->select();
            $arr = [];
            if ($rs)for ($i=0;$i<count($rs);$i++)
            {
                $arr[$i]['bankId'] = $rs[$i]['id'];
                $arr[$i]['title'] = $rs[$i]['title'];
                $arr[$i]['image'] = 'http://'.$_SERVER['HTTP_HOST'].'/Public/Home/'.$rs[$i]['img'];
            }
            $this->ApiReturn(0,'成功', $arr);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //新增银行卡38
    public function addBankCard()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            if ($data['name']==""){
                $this->ApiReturn(20001, '持卡人姓名不能为空');
            }elseif ($data['cardNum']==""){
                $this->ApiReturn(20001, '银行卡号不能为空');
            }elseif ($data['bankId']==""){
                $this->ApiReturn(20001, '所属银行不能为空');
            }elseif ($data['phone']==""){
                $this->ApiReturn(20001, '预留手机号不能为空');
            }

            $arr['user_id'] = $id;
            $arr['name'] = $data['name'];
            $arr['card_num'] = $data['cardNum'];
            $arr['mobile'] = $data['phone'];
            $arr['type_id'] = $data['bankId'];

            try{
                $rs = M('bank')->add($arr);
            } catch (\Exception $e){
                $this->ApiReturn(10000,'网络错误');
            }
            if ($rs<=0){
                $this->ApiReturn(38001, '添加失败');
            }
            $this->ApiReturn(0,'成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //我的收藏
    public function collectionList()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $page = $data['page']?$data['page']:1;
            $rs = M('collection')
                    ->join('LEFT JOIN onethink_product ON onethink_product.id=onethink_collection.product_id')
                    ->where('user_id='.$id)
                    ->field('*, onethink_collection.id as cid')
                    ->page($page, 20)
                    ->select();
            $arr = [];
            $num = 0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++)
                {
                    $arr[$i]['cid'] = $rs[$i]['cid'];
                    $arr[$i]['pid'] = $rs[$i]['product_id'];
                    $arr[$i]['image'] = $rs[$i]['image'];
                    $arr[$i]['title'] = $rs[$i]['title'];
                    $arr[$i]['price'] = $rs[$i]['gprice'];
                    $arr[$i]['marketPrice'] = $rs[$i]['market_price'];
                }
                $num = 1;
            }
            $this->ApiReturn(0, '成功', $arr,$num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //删除收藏
    public function delCollection()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            if (empty($data['cids'])){
                $this->ApiReturn(20001, '没有选择要取消收藏的商品');
            }
            $cids = $data['cids'];
            if (!is_array($data['cids'])){
                $cids = explode(',', $data['cids']);
            }

            foreach ($cids as $cid){
                if (!M('collection')->where(array('id'=>$cid, 'user_id'=>$id))->find()){
                    $this->ApiReturn(20002, '非法操作');
                }
                try{
                    M('collection')->where(array('id'=>$cid, 'user_id'=>$id))->delete();
                } catch (\Exception $e){
                    $this->ApiReturn(10000,'网络错误');
                }
            }
            $this->ApiReturn(0,'成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }


    //我的二维码
    public function QRCode()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $img = qrcode($id);
            if (!$img){
                //$this->ApiReturn(28)
            }
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //可领取的优惠券
    public function obtainableCoupon()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $userinfo = M('user')->where('id='.$id)->find();
            $now_time = date('Y-m-d H:i:s');
            //$where['start_date'] = array('ELT', $now_time);
            $where['end_date'] = array('EGT', $now_time);
            $where['status'] = 1;
            $where['grade_id'] = array('ELT', $userinfo['lv']);
            $page = $data['page']?$data['page']:1;
            try{
                $all_coupons = M('coupon')->where($where)->page($page,20)->select();
            }catch (\Exception $e){
                $this->ApiReturn(10000,'网络错误');
            }
            $arr = [];$a=0;$b=0;$num = 0;$c=0;
            if ($all_coupons)
            {
                for ($i=0;$i<count($all_coupons);$i++){
                    //查用户是不是已经领取
                    /*if (!M('CouponDetail')->where(array('coupon_id'=>$all_coupons[$i]['id'], 'user_id'=>$id))->find()){
                        if ($all_coupons[$i]['surplus_num'] <= 0){
                            $title = 'no';
                            $c = $a++;
                        }else{
                            $title = 'exist';
                            $c = $b++;
                        }
                        $arr[$title][$c]['cid'] = $all_coupons[$i]['id'];
                        $arr[$title][$c]['money'] = $all_coupons[$i]['money'];
                        $arr[$title][$c]['time'] = $all_coupons[$i]['end_date'];
                    }*/
                    if (!M('CouponDetail')->where(array('coupon_id'=>$all_coupons[$i]['id'], 'user_id'=>$id))->find()){
                        if ($all_coupons[$i]['surplus_num'] <= 0){
                            $title = 'no';
                            $c = $a++;
                        }else{
                            $arr[$c]['cid'] = $all_coupons[$i]['id'];
                            $arr[$c]['money'] = $all_coupons[$i]['money'];
                            $arr[$c]['time'] = $all_coupons[$i]['end_date'];
                            $c = $b++;
                        }

                    }
                }
                $num = 1;
            }

            $this->ApiReturn(0,'成功', $arr,$num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //领取优惠券
    public function receiveCoupon()
    {
        try{
            $data = $this->data;
            $cid = $data['cid'];
            if ($cid==""){
                $this->ApiReturn(20001, '没有选择要领取的优惠券');
            }
            $id = S($data['token']);
            $coupon = M('coupon')->where('id='.$cid)->find();
            if (M('CouponDetail')->where(array('coupon_id'=>$cid, 'user_id'=>$id))->find()){
                $this->ApiReturn(38002, '已领取过该优惠券了');
            }

            if ($coupon['surplus_num'] <= 0)
            {
                $this->ApiReturn(38002, '该优惠券已经被抢完了');
            }
            $cd = M('CouponDetail')->where(array('coupon_id'=>$cid, 'user_id'=>0))->find();
            $map['user_id'] = $id;

            if (!$cd){
                $this->ApiReturn(38002, '该优惠券已经被抢完了');
            }
            try{
                $num = M('CouponDetail')->where(array('id'=>$cd['id']))->save($map);
            }catch (\Exception $e){
                $this->ApiReturn(10002,'系统错误');
            }

            if ($num<=0){
                $this->ApiReturn(38003,'领取失败');
            }
            $this->ApiReturn(0,'成功');
        }catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //领取代金券
    public function cashCoupon()
    {
        try{
            $data = $this->data;
            $code = $data['code'];
            if ($code==""){
                $this->ApiReturn(20001, '请输入代金券串码');
            }
            $id = S($data['token']);

            $cash_info = M('cashcoupon')->where('code='.$code)->find();
            if (!$cash_info){
                $this->ApiReturn(38004, '串码错误');
            }

            if ($cash_info['state'] == 1){
                $this->ApiReturn(38005, '代金券已被领取');
            }

            $count = $cash_info['money']/$cash_info['permoney'];
            if ($count>0)for ($i=0;$i<$count;$i++){
                $map['codeId'] = $cash_info['id'];
                $map['money'] = $cash_info['permoney'];
                $map['user_id'] = $id;
                $map['addtime'] = time();

                try{
                    $num = M('CashcouponDetail')->add($map);
                } catch (\Exception $e){
                    $this->ApiReturn(10002,'系统错误');
                }
                if ($num<=0){
                    $this->ApiReturn(38006, '领取失败');
                }
            }
            $cash_map['state'] = 1;
            try{
                $num = M('Cashcoupon')->where('code='.$code)->save($cash_map);
            } catch (\Exception $e){
                $this->ApiReturn(10002,'系统错误');
            }

            $this->ApiReturn(0, '成功');
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //代金券列表
    public function cashCouponList()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $page = $data['page']?$data['page']:1;
            $rs = M('CashcouponDetail')
                ->where(array('user_id'=>$id, 'is_ply'=>0))
                //->page($page,20)
                ->select();

            $arr = [];
            $num = 0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++)
                {
                    $arr[$i]['id'] = $rs[$i]['id'];
                    $arr[$i]['money'] = $rs[$i]['money'];
                }
                $num = 1;
            }
            $this->ApiReturn(0, '成功', $arr, $num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //代金券列表---已用
    public function cashCouponListAlready()
    {
        try{
            $data = $this->data;
            $id = S($data['token']);
            $page = $data['page']?$data['page']:1;
            $rs = M('CashcouponDetail')->where(array('user_id'=>$id, 'is_ply'=>1))->page($page,20)->select();

            $arr = [];
            $num = 0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++)
                {
                    $arr[$i]['id'] = $rs[$i]['id'];
                    $arr[$i]['money'] = $rs[$i]['money'];
                }
                $num = 1;
            }
            $this->ApiReturn(0, '成功', $arr, $num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //门店地址
    public function storeAddress()
    {
        try{
            $data = $this->data;
            $page = $data['page']?$data['page']:1;
            $rs = M('store')->where('status=1')->page($page,20)->select();

            $arr = [];
            $num = 0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++)
                {
                    $arr[$i]['said'] = $rs[$i]['id'];
                    $arr[$i]['name'] = $rs[$i]['sname'];
                    $arr[$i]['address'] = $rs[$i]['sadd'];
                    $arr[$i]['longitude'] = $rs[$i]['sjingdu'];
                    $arr[$i]['latitude'] = $rs[$i]['sweidu'];
                    $arr[$i]['mobile'] = $rs[$i]['mobile'];
                }
                $num = 1;
            }
            $this->ApiReturn(0,'成功',$arr,$num);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //设置支付密码
    public function setPayPwd()
    {
        try{
            $data = $this->data;
            $db = M('user');
            if ($data['password']==""){
                $this->ApiReturn(20001, "登陆密码不能为空");
            }elseif ($data['payPwd']==""){
                $this->ApiReturn(20001,"支付密码不能为空");
            }elseif (!is_numeric($data['payPwd']) || strlen($data['payPwd'])!=6){
                $this->ApiReturn(38007,"支付密码只能是六位纯数字");
            }
            $id = S($data['token']);
            $pwd = md5($data['password']);
            $pay_pwd = $data['payPwd'];
            $user = $db->where(array('id'=>$id, 'login_pass'=>$pwd))->find();
            if (!$user)
            {
                $this->ApiReturn(20002,"非法操作");
            }
            $map['paypwd'] = $pay_pwd;

            try{
                $db->where(array('id'=>$id))->save($map);
            } catch (\Exception $e){
                $this->ApiReturn(10002,'系统错误');
            }
            $this->ApiReturn(0,"设置成功");

        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //修改密码
    public function editPassword(){
        try {
            $db_user=M("user");
            $data=$this->data;
            if($data['newpw']==""){
                $this->ApiReturn(20001,"新密码不能为空");
            }elseif($data['oldpw']==""){
                $this->ApiReturn(20001,"原密码不能为空");
            }
            $id = S($data['token']);
            $opw = md5($data['oldpw']);
            try {
                $info=$db_user->where(array('id'=>$id, 'login_pass'=>$opw))->find();
            } catch (\Exception $e) {
                $this->ApiReturn(10000, '数据库访问错误');
            }
            if(!$info){
                $this->ApiReturn(38009,"密码不正确");
            }

            $where1['login_pass']=md5($data['newpw']);
            try {
                $num=$db_user->where("id=".$info['id'])->save($where1);
            } catch (\Exception $e) {
                $this->ApiReturn(10000, '数据库访问错误');
            }
            if($num>0){
                $this->ApiReturn(0,"修改密码成功");
            }else{
                $this->ApiReturn(10000,"数据库访问错误");
            }
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');

        }
    }
}