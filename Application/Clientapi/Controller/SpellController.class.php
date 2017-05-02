<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/18
 * Time: 13:12
 * 拼团
 */

namespace Clientapi\Controller;


class SpellController extends MapiBaseController
{

    public function index()
    {
        try{
            $data = $this->data;
            $page = $data['page']?$data['page']:1;
            $db = M('spell');
            $now = time();
            //$where['start_date'] = array('LT', $now);
            $where['end_date'] = array('GT', $now);
            $where['state'] = 2;
            $where['status'] = 1;
            $rs = $db->where($where)->order('addtime desc')->page($page, 20)->select();

            $arr=[];$num=0;
            if ($rs)
            {
                for ($i=0;$i<count($rs);$i++)
                {
                    $arr[$i]['sid'] = $rs[$i]['id'];
                    $arr[$i]['title'] = $rs[$i]['title'];
                    $arr[$i]['image'] = $rs[$i]['image'];
                    $arr[$i]['start'] = $rs[$i]['start_date'];
                    $arr[$i]['end'] = $rs[$i]['end_date'];
                    $arr[$i]['price'] = $rs[$i]['price'];
                    $arr[$i]['marketPrice'] = $rs[$i]['oldprice'];
                    $arr[$i]['num'] = $rs[$i]['num'];

                    //状态
                    if ($rs[$i]['start_date'] >= $now){
                        $arr[$i]['state'] = -1;         //未开团
                    }else{
                        $arr[$i]['state'] = 1;          //开团中
                    }
                }
                $num = 1;
            }

            $this->ApiReturn(0, "成功", $arr, $num);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //拼团详情
    public function detail()
    {
        try{
            $data = $this->data;
            if ($data['sid']==""){
                $this->ApiReturn(20001,"请选择一个拼团");
            }
            $db = M('spell');
            $now = time();
            $detail = $db->where(array('id'=>$data['sid']))->find();
            if (!$detail){
                $this->ApiReturn(35001, "拼团不存在");
            }
            $arr = [];
            $arr['sid'] = $detail['id'];
            $arr['title'] = $detail['title'];
            $arr['price'] = $detail['price'];
            $arr['marketPrice'] = $detail['oldprice'];
            $arr['Freight'] = $detail['express_money'];         //运费
            $arr['sellNum'] = $detail['sell_num'];         //销量
            $arr['content'] = $detail['content'];         //详情
            $arr['image'] = $detail['image'];
            $arr['describe'] = $detail['describe'];         //分享推荐语
            $arr['stock'] = $detail['stock_num'];         //库存
            $arr['start'] = $detail['start_date'];
            $arr['end'] = $detail['end_date'];
            $arr['num'] = $detail['num'];                   //开团人数
            $arr['maxNum'] = $detail['max_num'];
            $arr['cartNum'] = 0;
            if (S($data['token'])){
                $arr['cartNum'] = M('Cart')->where('user_id='.S($data['token']))->count();                   //开团人数
            }


            //状态
            if ($detail['start_date'] >= $now){
                $arr['state'] = -1;         //未开团
            }else{
                $arr['state'] = 1;          //开团中
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

            //已经有的团
            $al_spell = M('spell_teams')
                ->where(array('spell_id'=>$detail['id'], 'onethink_spell_teams.status'=>0))
                ->join('LEFT JOIN onethink_user ON onethink_user.id=onethink_spell_teams.user_id')
                ->field('*, onethink_spell_teams.id as stid')
                ->select();

            $arr['team'] = [];
            if ($al_spell)for ($i=0;$i<count($al_spell);$i++)
            {
                $arr['team'][$i]['stid'] = $al_spell[$i]['stid'];
                $arr['team'][$i]['image'] = $al_spell[$i]['image'];
                $arr['team'][$i]['name'] = $al_spell[$i]['name']?$al_spell[$i]['name']:$al_spell[$i]['mobile'];
                $arr['team'][$i]['num'] = $detail['num']-$al_spell[$i]['join_num'];
            }

            $this->ApiReturn(0, "成功", $arr);

        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //我要参团
    public function getJoin()
    {
        try{
            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期','');
            }
            if ($data['stid']==""){
                $this->ApiReturn(20001,"请选择一个拼团");
            }
            $db = M('SpellTeams');
            $now = time();
            $detail = $db
                ->where(array('onethink_spell_teams.id'=>$data['stid']))
                ->join('LEFT JOIN onethink_spell ON onethink_spell.id=onethink_spell_teams.spell_id')
                ->field('*, onethink_spell.id as sid')
                ->find();
            if (!$detail){
                $this->ApiReturn(35001, "拼团不存在");
            }
            $arr = [];
            $arr['sid'] = $detail['sid'];
            $arr['stid'] = $data['stid'];
            $arr['title'] = $detail['title'];
            $arr['price'] = $detail['price'];
            $arr['marketPrice'] = $detail['oldprice'];
            $arr['describe'] = $detail['describe'];         //分享推荐语
            $arr['num'] = $detail['num'];         //几人团
            $arr['remain'] = $detail['num']-$detail['join_num'];         //剩几人
            $arr['start'] = $detail['start_date'];
            $arr['end'] = $detail['end_date'];
            $arr['maxNum'] = $detail['max_num'];

            //轮播图第一张
            $imgArr = explode(',',$detail['imglist']);
            $arr['img'] = "";$picture = M('picture');
            if ($imgArr)
            {
                $img = $picture->where('id='.$imgArr[0])->find();
                $arr['img'] = $img['path'];
            }

            //拼团人头像
            $where['team_id'] = $data['stid'];
            $where['onethink_spellorder.status'] = array('GT', 0);
            $rs = M('spellorder')
                ->join('LEFT JOIN onethink_user ON onethink_user.id=onethink_spellorder.user_id')
                ->where($where)
                ->select();
            $arr['memberImg']=[];
            if ($rs){
                for ($i=0;$i<count($rs);$i++){
                    $arr['memberImg'][$i]['image'] = $rs[$i]['image']?$rs[$i]['image']:'/public/Home/img/zhanweihead.png';
                    $arr['memberImg'][$i]['time'] = date('Y-m-d H:i:s',$rs[$i]['paytime']);
                }
            }

            $this->ApiReturn(0, "成功", $arr);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //参团
    public function postJoin()
    {
        try{
            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期','');
            }elseif ($data['stid']==""){
                $this->ApiReturn(20001,'没有选择要参加的拼团');
            }elseif ($data['buyNum']=="" || $data['buyNum']<=0){
                $this->ApiReturn(20001,'购买数量不能小于1');
            }elseif ($data['addressID']==""){
                $this->ApiReturn(20001,'请选择收货地址');
            }
            /*elseif ($data['payWay']==""){
                $this->ApiReturn(20001,'请选择支付方式');
            }*/

            $id = S($data['token']);

            $db = M('SpellTeams');
            $now = time();
            $detail = $db
                ->where(array('onethink_spell_teams.id'=>$data['stid']))
                ->join('LEFT JOIN onethink_spell ON onethink_spell.id=onethink_spell_teams.spell_id')
                ->field('*, onethink_spell_teams.status as st_status')
                ->find();
            if (!$detail)
            {
                $this->ApiReturn(35001, '拼团不存在');
            }
            if ($this->checkStock($detail['spell_id']) != 1)
            {
                $this->ApiReturn(35003, '库存不足，参团失败');
            }
            if ($now > $detail['end_date'] || $detail['st_status'] != 0)
            {
                $this->ApiReturn(35002, '拼团已结束');
            }
            if ($detail['max_num'] < $data['buyNum']){
                $this->ApiReturn(35004, '该拼团每人最多可购买'.$detail['max_num'].'个');
            }

            $new_join_num = $detail['join_num']+1;
            M('SpellTeams')->where('id='.$data['stid'])->save(array('join_num'=>$new_join_num));
            //拼团人数够了
            if ($new_join_num == $detail['num'])
            {
                M('SpellTeams')->where('id='.$data['stid'])->save(array('status'=>1));
            }

            //是否已经参团
            if (M('Spellorder')->where(array('user_id'=>$id, 'team_id'=>$data['stid'], 'status'=>array('gt',0)))->find()){
                $this->ApiReturn(35006, '已参团，不能重复参团');
            }


            //
            $order['sn']			=	'S'.date('YmdHis').rand(0,999);
            $order['user_id']	=	$id;
            $order['team_id']	=	$data['stid'];//拼团团队id
            $order['spell_id'] = $detail['spell_id'];
            $order['spell_num'] = $data['buyNum'];       //购买数量
            $order['money']		=	$detail['price']*$data['buyNum'];//总金额
            $order['express_money']=	$detail['express_money'];//运费
            $order['type']		=	0;//0送货上门  1仓库自取
            $order['address_id']	=	$data['addressID'];//地址ID
            //$order['note'] = $data['note']; //买家留言
            //$order['paytype'] = $data['payWay'];       //支付方式，0微信支付，1余额支付,2 支付宝支付
            $order['addtime']	=	time();

            try{
                $order_id = M('Spellorder')->add($order);
//                echo M('Spellorder')->getLastSql();
            } catch (\Exception $e) {
                $this->ApiReturn(10002,'系统错误');
            }

            if ($order_id<=0)
            {
                $this->ApiReturn(10000, '网络错误');
            }
            $arr['stid'] = $data['stid'];
            $arr['orderID'] = $order_id;
            $this->ApiReturn(0, '成功', $arr);

        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //购买成功
    /*TODO*/
    public function paySuccess()
    {
        try{
            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期','');
            }
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //去开团
    public function startNowTeam()
    {
        try{
            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期','');
            }elseif ($data['sid']==""){
                $this->ApiReturn(20001, '没有选择拼团');
            }elseif ($data['buyNum']=="" || $data['buyNum']<=0){
                $this->ApiReturn(20001,'购买数量不能小于1');
            }elseif ($data['addressID']==""){
                $this->ApiReturn(20001,'请选择收货地址');
            }
            /*elseif ($data['payWay']==""){
                $this->ApiReturn(20001,'请选择支付方式');
            }*/
            $db = M('spell');
            $sid = $data['sid'];
            $id = S($data['token']);
            $now = time();
            $detail = $db->where('id='.$sid)->find();
            if (!$detail)
            {
                $this->ApiReturn(35001, '拼团不存在');
            }
            if ($this->checkStock($sid) != 1)
            {
                $this->ApiReturn(35003, '库存不足，参团失败');
            }
            if ($now > $detail['end_date'] || $detail['st_status'] != 0)
            {
                $this->ApiReturn(35002, '拼团已结束');
            }
            if ($detail['max_num'] < $data['buyNum']){
                $this->ApiReturn(35004, '该拼团每人最多可购买'.$detail['max_num'].'个');
            }

            $team['spell_id'] = $sid;
            $team['user_id'] = $id;
            $team['join_num'] = 1;
            $team['addtime'] = time();
            try
            {
                $re_team = M('SpellTeams')->add($team);
            } catch (\Exception $e) {
                $this->ApiReturn(10002,'系统错误');
            }

            if ($re_team<=0)
            {
                $this->ApiReturn(10000, '网络错误');
            }

            $order['sn']			=	'S'.date('YmdHis').rand(0,999);
            $order['user_id']	=	$id;
            $order['team_id']	=	$re_team;//拼团团队id
            $order['spell_id'] = $sid;
            $order['spell_num'] = $data['buyNum'];       //购买数量
            $order['money']		=	$detail['price']*$data['buyNum'];//总金额
            $order['express_money']=	$detail['express_money'];//运费
            $order['type']		=	0;//0送货上门  1仓库自取
            $order['address_id']	=	$data['addressID'];//地址ID
            $order['note'] = $data['note']; //买家留言
            //$order['paytype'] = $data['payWay'];       //支付方式，0微信支付，1余额支付,2 支付宝支付
            $order['addtime']	=	time();

            try{
                $order_id = M('spellorder')->add($order);
            } catch (\Exception $e) {
                $this->ApiReturn(10002,'系统错误');
            }

            if ($order_id<=0)
            {
                $this->ApiReturn(10000, '网络错误');
            }

            $arr['stid'] = $re_team;
            $arr['orderID'] = $order_id;
            $this->ApiReturn(0, '成功', $arr);

        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //检查库存
    protected function checkStock($id,$num=1)
    {
        try{
            $db = M('spell');
            $spell = $db->where('id='.$id)->find();
            if ($spell['stock_num'] < $num)
            {
                return 0;
            }
            return 1;
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //拼团订单
    public function order()
    {
        try{
            $db = M('Spellorder');
            $data = $this->data;
            $page = $data['page']?$data['page']:1;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期','');
            }
            $id = S($data['token']);
            $where['onethink_spellorder.user_id'] = $id;
            $where['onethink_spellorder.status'] = array('GT' , 0);
            if ($data['spellStatus']!=""){
                $where['onethink_spell_teams.status'] = $data['spellStatus'];
            }

            $rs = $db
                ->join('LEFT JOIN onethink_spell_teams ON onethink_spell_teams.id=onethink_spellorder.team_id LEFT JOIN onethink_spell ON onethink_spell.id=onethink_spellorder.spell_id')
                ->where($where)
                ->field('*,onethink_spell_teams.status as st_status, onethink_spellorder.id as oid, onethink_spellorder.status as o_status')
                ->page($page, 20)
                ->select();
            $arr=[];$num=0;
            if ($rs){
                for ($i=0;$i<count($rs);$i++){
                    $arr[$i]['oid'] = $rs[$i]['oid'];
                    /*$arr[$i]['spellStatus'] = $rs[$i]['st_status'];  //拼团状态，0拼团中，1已成团,2拼团失败
                    if ($rs[$i]['st_status']=2){
                        $arr[$i]['orderStatus'] = $rs[$i]['is_drawback'];
                    }else{
                        $arr[$i]['orderStatus'] = $rs[$i]['o_status'];  //订单状态，0未付款，1待发货，2待收货，3已完成
                    }*/
                    if ($rs[$i]['st_status']==0){
                        $arr[$i]['status'] = 1;     //拼团中
                    }elseif ($rs[$i]['st_status']==1 && $rs[$i]['o_status']==1){
                        $arr[$i]['status'] = 2;     //已成团待发货
                    }elseif ($rs[$i]['st_status']==1 && $rs[$i]['o_status']==2){
                        $arr[$i]['status'] = 3;     //已成团待收货
                    }elseif ($rs[$i]['st_status']==1 && $rs[$i]['o_status']==3){
                        $arr[$i]['status'] = 4;     //已成团已完成
                    }elseif ($rs[$i]['st_status']==2 && $rs[$i]['is_drawback']==1){
                        $arr[$i]['status'] = 5;     //拼团失败已退款
                    }elseif ($rs[$i]['st_status']==2 && $rs[$i]['is_drawback']==0){
                        $arr[$i]['status'] = 5;     //拼团失败未退款
                    }
                    $arr[$i]['sn'] = $rs[$i]['sn'];
                    $arr[$i]['title'] = $rs[$i]['title'];
                    $arr[$i]['price'] = $rs[$i]['price'];
                    $arr[$i]['marketPrice'] = $rs[$i]['oldprice'];
                    $arr[$i]['image'] = $rs[$i]['image'];
                    $arr[$i]['spellNum'] = $rs[$i]['spell_num'];
                    $arr[$i]['money'] = $rs[$i]['money'];
                    $arr[$i]['express'] = $rs[$i]['express_money'];
                    $arr[$i]['sid'] = $rs[$i]['spell_id'];
                }
                $num=1;
            }
            $this->ApiReturn(0, '成功', $arr, $num);

        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //拼团人头像
    public function getSpellTeamMember()
    {
        try{
            $db = M('spellorder');
            $data = $this->data;
            if ($data['stid']==""){
                $this->ApiReturn(20001, '请选择一个拼团');
            }
            //拼团存不存在
            if (!M('SpellTeams')->where(array('id'=>$data['stid']))->find()){
                $this->ApiReturn(35001, "拼团不存在");
            }

            $where['team_id'] = $data['stid'];
            $where['onethink_spellorder.status'] = array('GT', 0);
            $rs = $db
                ->join('LEFT JOIN onethink_user ON onethink_user.id=onethink_spellorder.user_id')
                ->where($where)
                ->select();
            $arr=[];$num=0;
            if ($rs){
                for ($i=0;$i<count($rs);$i++){
                    $arr[$i]['image'] = $rs[$i]['image']?$rs[$i]['image']:'/public/Home/img/zhanweihead.png';
                    $arr[$i]['time'] = date('Y-m-d H:i:s',$rs[$i]['paytime']);
                }
                $num = 1;
            }

            $this->ApiReturn(0, '成功', $arr, $num);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //确认拼团订单
    public function checkSpellOrder()
    {
        try{
            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期','');
            }elseif ($data['sid']==""){
                $this->ApiReturn(20001, '请选择要参加的团');
            }
            $id = S($data['token']);
            $num = $data['buyNum']?$data['buyNum']:1;

            //收货地址
            $address = M('UserAddress')->where(array('user_id'=>$id, 'is_default'=>1, 'status'=>1))->find();
            if (!$address){
                $address = M('UserAddress')->where(array('user_id'=>$id, 'status'=>1))->find();
            }
            $arr['address']['aid'] = $address['id'];
            $arr['address']['name'] = $address['name'];
            $arr['address']['phone'] = $address['mobile'];
            $arr['address']['detail'] = $address['area'].$address['address'];

            //商品详情
            /*$rs = M('SpellTeams')
                ->join('LEFT JOIN onethink_spell ON onethink_spell.id=onethink_spell_teams.spell_id')
                ->where(array('onethink_spell_teams.id'=>$data['stid']))
                ->find();*/
            $rs = M('Spell')->where(array('id'=>$data['sid']))->find();
            if (!$rs){
                $this->ApiReturn(35005, '拼团异常');
            }

            if ($rs['max_num'] < $num){
                $this->ApiReturn(35004, '该拼团每人最多可购买'.$rs['max_num'].'个');
            }

            $arr['product']['title'] = $rs['title'];
            $arr['product']['image'] = $rs['image'];
            $arr['product']['price'] = $rs['price'];
            $arr['product']['num'] = $num;
            $arr['proMoney'] = $rs['price']*$num;
            $arr['express'] = $rs['express_money'];
            $arr['totalMoney'] = $arr['proMoney']+$arr['express'];

            $this->ApiReturn(0, '成功', $arr);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //拼团详情
    public function getOrderDetail()
    {
        try{
            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期','');
            }elseif ($data['oid']==""){
                $this->ApiReturn(20001, '请选择要查看的订单');
            }
            $id = S($data['token']);
            $oid = $data['oid'];
            $rs = M('spellorder')
                ->join('LEFT JOIN onethink_user_address ON onethink_user_address.id=onethink_spellorder.address_id LEFT JOIN onethink_spell ON onethink_spell.id=onethink_spellorder.spell_id')
                ->field('*, onethink_spellorder.addtime as o_addtime')
                ->where(array('onethink_spellorder.id'=>$oid, 'onethink_spellorder.user_id'=>$id))
                ->find();
//            echo M('spellorder')->getLastSql();
            if (!$rs){
                $this->ApiReturn(20002, '非法操作');
            }
            $arr['oid'] = $data['oid'];
            $arr['sid'] = $rs['spell_id'];
            $arr['sn'] = $rs['sn'];
            $arr['time'] = date('Y-m-d H:i:s', $rs['o_addtime']);
            $arr['address']['name'] = $rs['name'];
            $arr['address']['phone'] = $rs['mobile'];
            $arr['address']['add'] = $rs['area'].$rs['address'];
            $arr['payMethod'] = $rs['paytype']; //支付方式，0微信支付，1余额支付,2 支付宝支付
            $arr['delivery'] = $rs['type']; //提货方式,0送货，1自提
            $arr['status'] = $rs['status']; //订单状态，0未付款，1待发货，2待收货，3已完成

            $arr['product']['title'] = $rs['title'];
            $arr['product']['image'] = $rs['image'];
            $arr['product']['price'] = $rs['price'];
            $arr['product']['marketPrice'] = $rs['oldprice'];
            $arr['product']['spellNum'] = $rs['spell_num'];

            $arr['proMoney'] = round($rs['price']*$rs['spell_num'],2);
            $arr['totalMoney'] = $rs['money'];
            $arr['express'] = $rs['express_money'];
            $this->ApiReturn(0, '成功', $arr);

        } catch (\Exception $e) {
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
            }elseif ($data['sid']==""){
                $this->ApiReturn(20001, '请选择要分享的拼团');
            }
            $url = 'http://'.$_SERVER['HTTP_HOST'].'/clientapi/spell/detail?sid='.$data['sid'];
            $this->ApiReturn(0, '成功', $url);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //确认收货
    public function postReceipt()
    {
        try{
            $data = $this->data;
            if ($data['oid']==""){
                $this->ApiReturn(20001, '请选择确认收货的订单');
            } elseif (!S($data['token'])){
                $this->ApiReturn(20003, 'token无效或已过期');
            }
            $id = S($data['token']);
            $order = M('Spellorder')->where(array('id'=>$data['oid'],'user_id'=>$id))->find();
            if (!$order){
                $this->ApiReturn(20002, '非法操作');
            }
            if ($order['status'] != 2){
                $this->ApiReturn(39008, '订单状态不允许确认收货');
            }

            try{
                M('Order')->where(array('id'=>$data['orderID']))->save(array('status'=>3));
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
            if ($data['oid']==""){
                $this->ApiReturn(20001, '没有选择要删除的订单');
            } elseif (!S($data['token'])){
                $this->ApiReturn(20003, 'token无效或已过期');
            }
            $id = S($data['token']);
            $order = M('Spellorder')->where(array('id'=>$data['oid'],'user_id'=>$id))->find();
            if (!$order){
                $this->ApiReturn(20002, '非法操作');
            }
            if ($order['status'] != 3){
                $this->ApiReturn(39008, '订单状态不允许删除');
            }
            M('Spellorder')->where(array('id'=>$data['oid']))->save(array('is_del'=>1));
            $this->ApiReturn(0, '成功');
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //参团成功
    public function joinSuccess()
    {
        try{
            $data = $this->data;
            if(!S($data['token'])){
                $this->ApiReturn(20003,'token无效或已过期','');
            }
            if ($data['orderID']==""){
                $this->ApiReturn(20001,"订单id不能为空");
            }
            $oid = $data['orderID'];

            $order_detail = M('Spellorder')->where(array('id'=>$oid))->find();
            $stid = $order_detail['team_id'];

            $db = M('SpellTeams');
            $now = time();
            $detail = $db
                ->where(array('onethink_spell_teams.id'=>$stid))
                ->join('LEFT JOIN onethink_spell ON onethink_spell.id=onethink_spell_teams.spell_id')
                ->field('*, onethink_spell.id as sid')
                ->find();
            if (!$detail){
                $this->ApiReturn(35001, "拼团不存在");
            }
            $arr = [];
            $arr['sid'] = $detail['sid'];
            $arr['stid'] = $stid;
            $arr['title'] = $detail['title'];
            $arr['remain'] = $detail['num']-$detail['join_num'];         //剩几人
            $arr['start'] = $detail['start_date'];
            $arr['end'] = $detail['end_date'];
            $arr['joinTime'] = $order_detail['paytime'];

            //拼团人头像
            $where['team_id'] = $stid;
            $where['onethink_spellorder.status'] = array('GT', 0);
            $rs = M('spellorder')
                ->join('LEFT JOIN onethink_user ON onethink_user.id=onethink_spellorder.user_id')
                ->where($where)
                ->select();
            $arr['memberImg']=[];
            if ($rs){
                for ($i=0;$i<count($rs);$i++){
                    $arr['memberImg'][$i]['image'] = $rs[$i]['image']?$rs[$i]['image']:'/public/Home/img/zhanweihead.png';
                    $arr['memberImg'][$i]['time'] = date('Y-m-d H:i:s',$rs[$i]['paytime']);
                }
            }

            $this->ApiReturn(0, "成功", $arr);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

}