<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/4
 * Time: 10:02
 */

namespace Clientapi\Controller;


class AuthController extends MapiBaseController
{
    public function login(){
        try{
            $data = $this->data;
            if ($data['type']==""){
                $this->ApiReturn(20001,'登陆失败');
            }elseif($data['type']==1){//手机号登陆
                $this->loginByPhone();
            }elseif($data['type']==2 || $data['type']==3){//微信和qq登陆
                $this->loginByTencent();
            }elseif ($data['type']==4){//小程序
                $this->regByWxApp();
            }else{
                $this->ApiReturn(20002,'非法操作');
            }
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }
    //乘客登陆21-------手机号登录
    public function loginByPhone(){
        try {
            $db_user=M("user");
            $data=$this->data;
            if($data){
                if($data['phone']==""){
                    $this->ApiReturn(20001,"手机号不能为空");
                }elseif($data['password']==""){
                    $this->ApiReturn(20001,"密码不能为空");
                }else{
                    $where=array();
                    $where['mobile'] = $data['phone'];
                    try {
                        $info=$db_user->where($where)->find();
                    } catch (\Exception $e) {
                        $this->ApiReturn(10000, '数据库访问错误');
                    }
                    if($info){
                        //TODO：：判断登录暂时屏蔽
                        //if($info['is_online']==1){
                        //	$this->ApiReturn(31003, '该帐号已经登录');
                        //}

                        if ($info['status'] != 1)
                        {
                            $this->ApiReturn(21001, '该帐号已被冻结');
                        }
                        $where1['mobile'] =$data['phone'];
                        $where1['login_pass'] =md5($data['password']);
                        try {
                            $te=$db_user->where($where1)->find();
                        } catch (\Exception $e) {
                            $this->ApiReturn(10000, '数据库访问错误');
                        }
                        if($te){
                            $arr = $this->userInfo($info['id']);
                            $token = $this->get_token($data['phone'],$data['password'],$info['id']);
                            $arr['token']=$token;
                            $this->ApiReturn(0,"登陆成功",$arr);
                        }else{
                            $this->ApiReturn(21002,"手机号或密码不正确");
                        }
                    }else{
                        $this->ApiReturn(21003,"该账号暂未注册");
                    }
                }
            }
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //微信qq登陆
    public function loginByTencent(){
        try{
            $db_user=M("user");
            $data=$this->data;
            if ($data['type']==2){
                $ten = "openid";
            }else{
                $ten = "qqid";
            }
            $where = array();
            $where[$ten] = $data[$ten];
            $info = $db_user->where($where)->find();
            if(!$info || $info['mobile'] == ""){
                //$this->ApiReturn(-1, '请绑定手机号');
                $this->regByTencent();
            }

            if ($info['status'] != 1)
            {
                $this->ApiReturn(21001, '该帐号已被冻结');
            }

            $arr = $this->userInfo($info['id']);
            $token = $this->get_token($data[$ten],$info['mobile'],$info['id']);
            $arr['token']=$token;
            $this->ApiReturn(0,"登陆成功",$arr);

        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //微信qq注册
    //1.新的微信号和手机号来注册的  新增
    //2.新的微信号绑定已存在的手机号  更新
    public function regByTencent()
    {
        try{
            $db_user=M("user");
            $data=$this->data;
            if ($data['type']==2){
                $ten = "openid";
            }else{
                $ten = "qqid";
            }
            if($data){
                if($data[$ten]==""){
                    $this->ApiReturn(20001,"第三方账户异常");
                }elseif($data['phone']==""){
                    $this->ApiReturn(20001,"手机号不能为空");
                }
                /*elseif($data->password==""){
                    $this->ApiReturn(20001,"密码不能为空");
                }elseif ($data->code==""){
                    $this->ApiReturn(20001,"验证码不能为空");
                }*/
                else{
                    // 是否已经注册过
                    $where = array();
                    $where['mobile'] = $data['phone'];
                    try {
                        $info = $db_user->where($where)->find();
                    } catch (\Exception $e) {
                        $this->ApiReturn(10000, '数据库访问错误');
                    }

                    //如果手机号已经存在了
                    if ($info)
                    {
                        //这个手机号已经绑定到微信了
                        if ($info[$ten] != ""){
                            if ($info[$ten] != "" && $info[$ten] == $data[$ten]) {
                                $this->ApiReturn(22005, "该账号已绑定此手机号，请直接登陆");
                            }

                            if ($info[$ten] != "" && $info[$ten] != $data[$ten]) {
                                $this->ApiReturn(22005, "该账号已绑定其他手机号，请更换手机号重新绑定");
                            }
                        }
                        //验证短信验证码是否正确
                        checkPhoneCode($data['phone'],$data['code']);

                        $save_data[$ten] = $data[$ten];
                        try {
                            $save_num = $db_user->where('mobile='.$data['phone'])->save($save_data);
                        } catch (\Exception $e){
                            $this->ApiReturn(10000, '网络错误');
                        }
                        if ($save_num<=0){
                            $this->ApiReturn(10000, '网络错误');
                        }
                    }else{
                        $this->reg();
                    }

                    $new_info = $db_user->where('mobile='.$data['phone'])->find();
                    if($new_info){
                        //TODO：：判断登录暂时屏蔽
                        //if($info['is_online']==1){
                        //	$this->ApiReturn(31003, '该帐号已经登录');
                        //}

                        if ($new_info['status'] != 1)
                        {
                            $this->ApiReturn(21001, '该帐号已被冻结');
                        }

                        $arr = $this->userInfo($new_info['id']);
                        $token = $this->get_token($data[$ten],$new_info['mobile'],$new_info['id']);
                        $arr['token']=$token;
                        $this->ApiReturn(0,"登陆成功",$arr);
                    }else{
                        $this->ApiReturn(10000,"网络错误");
                    }
                }
            }
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //小程序 登陆
    public function regByWxApp()
    {
        try{
            $db_user=M("user");
            $data=$this->data;
            if($data){
                $openid = $data['openid'];
                if($data['openid']==""){
                    $this->ApiReturn(20001,"第三方账户异常");
                }

                // 是否已经登陆过
                $where = array();
                $where['openid'] = $openid;
                try {
                    $info = $db_user->where($where)->find();
                } catch (\Exception $e) {
                    $this->ApiReturn(10000, '数据库访问错误');
                }

                //
                if (!$info) {
                    $data1['openid'] = $openid;
                    $data1['regist_type'] = 2; //注册类型，1手机号注册，2微信注册,0管理员添加
                    $data1['register_time'] = time(); //注册时间
                    $data1['last_login_time'] = time();
                    $data1['last_login_ip'] = $_SERVER['REMOTE_ADDR'];
                    $data1['addtime'] = time();
                    $data1['name'] = $data['name'];
                    $data1['sex'] = $data['sex'];
                    $data1['image'] = $data['headImg'];
                    if ($data['superiorID'] != ""){
                        $data1['parent_user_id'] = $data['superiorID'];
                    }
                    try {
                        $num = $db_user->add($data1);
                    } catch (\Exception $e) {
                        $this->ApiReturn(10000, '数据库访问错误');
                    }
                    if ($num <= 0) {
                        $this->ApiReturn(10000, '数据库访问错误');
                    }

                    $card_num = 10000000 + $num;
                    $db_user->where('id=' . $num)->save(array('card_num' => $card_num));

                    $new_info = $db_user->where($where)->find();
                    if ($new_info) {
                        //TODO：：判断登录暂时屏蔽
                        //if($info['is_online']==1){
                        //	$this->ApiReturn(31003, '该帐号已经登录');
                        //}

                        if ($new_info['status'] != 1) {
                            $this->ApiReturn(21001, '该帐号已被冻结');
                        }

                        $arr = $this->userInfo($new_info['id']);
                        $token = $this->get_token($openid, $openid, $new_info['id']);
                        $arr['token'] = $token;
                        $this->ApiReturn(0, "登陆成功", $arr);
                    } else {
                        $this->ApiReturn(10000, "网络错误");
                    }
                }

                if($info){
                    //TODO：：判断登录暂时屏蔽
                    //if($info['is_online']==1){
                    //	$this->ApiReturn(31003, '该帐号已经登录');
                    //}

                    if ($info['status'] != 1)
                    {
                        $this->ApiReturn(21001, '该帐号已被冻结');
                    }

                    $arr = $this->userInfo($info['id']);
                    $token = $this->get_token($openid,$openid,$info['id']);
                    $arr['token']=$token;
                    $this->ApiReturn(0,"登陆成功",$arr);
                }else{
                    $this->ApiReturn(10000,"网络错误");
                }
            }
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }


    // 注册22
    public function reg(){
        try {
            $db_user=M("user");
            $data=$this->data;
            if($data){
                if($data['phone']==""){
                    $this->ApiReturn(20001,"手机号不能为空");
                }elseif($data['password']==""){
                    $this->ApiReturn(20001,"密码不能为空");
                }elseif ($data['code']==""){
                    $this->ApiReturn(20001,"短信验证码不能为空");
                }else {
                    //验证短信验证码是否正确
                    checkPhoneCode($data['phone'],$data['code']);

                    $data1['mobile'] = $data['phone'];
                    $data1['login_pass'] = md5($data['password']);
                    if($data['openid']){
                        $data1['openid'] = $data['openid'];
                    }
                    if($data['qqid']){
                        $data1['qqid'] = $data['qqid'];
                    }
                    if ($data['headImg']){
                        $data1['image'] = $data['headImg'];
                    }
                    //$data1['card_num'] = 12345; //会员编号
                    //$data1['regist_type'] = 1; //注册类型，1手机号注册，2微信注册
                    $data1['mobile'] = $data['phone'];
                    $data1['register_time'] = time(); //注册时间
                    $data1['last_login_time'] = time();
                    $data1['last_login_ip'] = $_SERVER['REMOTE_ADDR'];
                    // 是否已经注册过
                    $where = array();
                    $where['mobile'] = $data['phone'];

                    if ($data['superiorID'] != ""){
                        $data1['parent_user_id'] = $data['superiorID'];
                    }

                    try {
                        $info = $db_user->where($where)->find();
                    } catch (\Exception $e) {
                        $this->ApiReturn(10000, '数据库访问错误');
                    }
                    if ($info) {
                        $this->ApiReturn(22002, "该账号已经被使用");
                    } else {
                        //dump($data1);die;
                        try {
                            $num = $db_user->add($data1);
                        } catch (\Exception $e) {
                            $this->ApiReturn(10000, '数据库访问错误');
                        }
                        if ($num<=0) {
                            $this->ApiReturn(10000, '数据库访问错误');
                        }

                        $card_num = 10000000+$num;
                        $db_user->where('id='.$num)->save(array('card_num'=>$card_num));

                        $new_info = $db_user->where('mobile='.$data['phone'])->find();
                        if($new_info){
                            //TODO：：判断登录暂时屏蔽
                            //if($info['is_online']==1){
                            //	$this->ApiReturn(31003, '该帐号已经登录');
                            //}

                            if ($new_info['status'] != 1)
                            {
                                $this->ApiReturn(21001, '该帐号已被冻结');
                            }

                            $arr = $this->userInfo($new_info['id']);
                            $token = $this->get_token($data['phone'],$data['password'],$new_info['id']);
                            $arr['token']=$token;
                            $this->ApiReturn(0,"注册成功",$arr);
                        }else{
                            $this->ApiReturn(10000,"网络错误");
                        }
                    }
                }
            }
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }
    //登出
    public function loginout(){
        try {
            $db_user=M("user");
            $data=$this->data;
            $token=$data['token'];
            if($token==""){
                $this->ApiReturn(20001,"必传参数不存在；参数名：token");
            }

            if(!S($token)){
				$this->ApiReturn(20003,'token无效或已过期');
			}

            //$where['is_online']=-1;
            //$db_user->where("Pid=".$data->Pid)->save($where);
            S($token,null);
            $this->ApiReturn(0, '退出成功');
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }
    //找回密码23
    public function resetPassword(){
        try {
            $db_user=M("user");
            $data=$this->data;
            if($data['phone']==""){
                $this->ApiReturn(20001,"手机号不能为空");
            }elseif($data['newpw']==""){
                $this->ApiReturn(20001,"新密码不能为空");
            }elseif($data['code']==""){
                $this->ApiReturn(20001,"短信验证码不能为空");
            }
            if(preg_match("/^17[0-9]{1}[0-9]{8}$|14[0-9]{1}[0-9]{8}$|13[0-9]{1}[0-9]{8}$|15[0-9]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$/",$data['phone'])){
                checkPhoneCode($data['phone'],$data['code']);

                $where['mobile'] = $data['phone'];
                try {
                    $info=$db_user->where($where)->find();
                } catch (\Exception $e) {
                    $this->ApiReturn(10000, '数据库访问错误');
                }
                if($info){
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
                }else{
                    $this->ApiReturn(23001,"用户不存在");
                }
            }else{
                $this->ApiReturn(23002,'手机号格式错误');
            }
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');

        }
    }

    //发送短信验证码
    public function sendsms(){
        try{
            $data=$this->data;
            if($data['phone']==""){
                $this->ApiReturn(20001,"手机号不能为空");
            }
            if($data['type']==""){
                $this->ApiReturn(20001,"短信类型不能为空");
            }
            if ($data['imgCode']==""){
                $this->ApiReturn(20001,"图片验证码不能为空");
            }
            $mobile = $data['phone'];
            checkPhoneImgCode($mobile,$data['imgCode']);
            switch ($data['type'])
            {
                case 1:
                    //注册 -- 验证手机号是不是已经存在
                    if (M('user')->where('phone='.$mobile)->find()){
                        $this->ApiReturn(21101,'账号已存在');
                    }
                    break;
                case 2:
                    //找回密码 -- 验证手机号存不存在
                    if (M('user')->where('phone='.$mobile)->find()){
                        $this->ApiReturn(21102,'账号不存在');
                    }
                    break;
                case 3:
                    //绑定手机号 -- 不验证

                    break;
                case 4:
                    //更换手机号 -- 验证手机号是不是已经存在
                    if (M('user')->where('phone='.$mobile)->find()){
                        $this->ApiReturn(21101,'该手机号已注册，请更换其他手机号');
                    }
                    break;
            }
            //$pattern = "[1][34578]\\d{9}";
            if(strlen($mobile) != 11){
                $this->ApiReturn(10004,"手机号格式不正确");
            }
            $target = "http://cf.lmobile.cn/submitdata/Service.asmx/g_Submit";


            $mobile_code = random(6,1);
            //$str = "您的验证码是：".$mobile_code."（5分钟内有效），请勿告诉他人【番茄网络】";
            $str = '您的验证码是:' . $mobile_code . '。请不要把验证码泄露给其他人。【百分信息】';

            // 生成发送验证码api的调用参数
            $post_data = http_build_query(array(
                'sname'     => 'DL-wanglu',
                'spwd'      => 'abc123456',
                'scorpid'   => '',
                'sprdid'    => '1012818',
                'sdst'      => $mobile,
                'smsg'      => $str,
            ), null, '&', PHP_QUERY_RFC3986);

            // 取得发送验证码api
            $gets = sms_captcha($post_data);

            // 解析返回结果，做相应处理
            $result = xml_to_array($gets);
            if ($result['CSubmitState']['state']==0) {
                //验证码存到数据库
                $db_code = M('phone_code');
                $data_code['phone'] = $mobile;
                $data_code['code'] = $mobile_code;
                $data_code['createtime'] = time();

                $code_phone_one = $db_code->where('phone='.$mobile)->find();
                if ($code_phone_one){
                    $db_code->where('phone='.$mobile)->save(array('code'=>$mobile_code,'createtime'=>time()));
                }else{
                    $db_code->add($data_code);
                }
                $this->ApiReturn(0,"发送成功");
            }else{
                $this->ApiReturn(10003,"发送失败");
            }
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    public function imgCode()
    {
        try{
            $data = $this->data;
            if ($data['phone'] == ""){
                $this->ApiReturn(20001, "手机号不能为空");
            }
            //$img = $this->base64EncodeImage($this->vCode());
            $code = $this->vCode();
            $ercode = file_get_contents($code['imgcode_path']);
            $mes['img'] = base64_encode($ercode);
            $mes['imgUrl'] = $code['other_path'];
            $mes['imgName'] = $code['imgcode_name'];

            $this->ApiReturn(0,"成功",$mes);
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //删除图片验证码
    public function delImgCode()
    {
        try{
            $data = $this->data;
            if ($data['imgName']=="")
            {
                $this->ApiReturn(20001,'没有选择要删除的图片');
            }
            $imgcode_path = $_SERVER['DOCUMENT_ROOT'].'/Uploads/imgcode/';
            if(!file_exists($imgcode_path)){
                mkdir($imgcode_path,0777);
            }

            $file = $imgcode_path.$data['imgName'];

            unlink($file);

            $this->ApiReturn(0,'成功');
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    public function vCode($num = 4, $size = 20, $width = 0, $height = 0) {
        $data = $this->data;
        !$width && $width = $num * $size * 4 / 5 + 5;
        !$height && $height = $size + 10;
        // 去掉了 0 1 O l 等
        $str = "23456789abcdefghijkmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVW";
        $code = '';
        for ($i = 0; $i < $num; $i++) {
            $code .= $str[mt_rand(0, strlen($str)-1)];
        }
        // 画图像
        $im = imagecreatetruecolor($width, $height);
        // 定义要用到的颜色
        $back_color = imagecolorallocate($im, 235, 236, 237);
        $boer_color = imagecolorallocate($im, 118, 151, 199);
        $text_color = imagecolorallocate($im, mt_rand(0, 200), mt_rand(0, 120), mt_rand(0, 120));
        // 画背景
        imagefilledrectangle($im, 0, 0, $width, $height, $back_color);
        // 画边框
        imagerectangle($im, 0, 0, $width-1, $height-1, $boer_color);
        // 画干扰线
        for($i = 0;$i < 5;$i++) {
            $font_color = imagecolorallocate($im, mt_rand(0, 255), mt_rand(0, 255), mt_rand(0, 255));
            imagearc($im, mt_rand(- $width, $width), mt_rand(- $height, $height), mt_rand(30, $width * 2), mt_rand(20, $height * 2), mt_rand(0, 360), mt_rand(0, 360), $font_color);
        }
        // 画干扰点
        for($i = 0;$i < 50;$i++) {
            $font_color = imagecolorallocate($im, mt_rand(0, 255), mt_rand(0, 255), mt_rand(0, 255));
            imagesetpixel($im, mt_rand(0, $width), mt_rand(0, $height), $font_color);
        }
        // 画验证码
        @imagefttext($im, $size , 0, 5, $size + 3, $text_color, 'c:\\WINDOWS\\Fonts\\simsun.ttc', $code);

        //验证码存到数据库
        $db_code = M('phone_code');
        $data_code['phone'] = $data['phone'];
        $data_code['pic_code'] = $code;
        $data_code['createtime'] = time();

        $code_phone_one = $db_code->where(array('phone'=>$data['phone']))->find();
        if ($code_phone_one){
            $db_code->where('phone='.$data['phone'])->save(array('pic_code'=>$code));
        }else{
            $db_code->add($data_code);
        }

        //$_SESSION["VerifyCode"]=$code;
        /*header("Cache-Control: max-age=1, s-maxage=1, no-cache, must-revalidate");
        header("Content-type: image/png;charset=gb2312");
        imagepng($im);
        imagedestroy($im);*/

        $imgcode_path = $_SERVER['DOCUMENT_ROOT'].'/Uploads/imgcode/';
        if(!file_exists($imgcode_path)){
            mkdir($imgcode_path,0777);
        }
        $img_name = $code.time().'.png';
        $imgcode_path = $imgcode_path.$img_name;
        $imgcode_path_other ='/Uploads/imgcode/'.$code.time().'.png';
        // 输出图像
        imagepng($im,$imgcode_path);
        return array(
            'code'=>$code,
            'imgcode_path'=>$imgcode_path,
            'imgcode_name'=>$img_name,
            'other_path'=>$imgcode_path_other,
        );

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
//            $arr['uid'] = $info['id'];
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
            $arr['order']['pendingPayment'] = $order->where(array('user_id'=>$id, 'status'=>0))->count();       //待付款
            $arr['order']['pendingDelivered'] = $order->where(array('user_id'=>$id, 'status'=>1))->count();     //待发货
            $arr['order']['pendingReceived'] = $order->where(array('user_id'=>$id, 'status'=>2))->count();     //待收货
            $arr['order']['pendingEvaluated'] = $order->where(array('user_id'=>$id, 'status'=>5))->count();     //待评价
            $arr['order']['pendingRefunded'] = $order->where(array('user_id'=>$id, 'is_drawback'=>1))->count();     //退款

            return $arr;
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    //验证短信验证码
    public function checkMesCode()
    {
        try{
            $data = $this->data;
            if($data['phone']==""){
                $this->ApiReturn(20001,"手机号不能为空");
            }
            if ($data['code']==""){
                $this->ApiReturn(20001,"图片验证码不能为空");
            }
            checkPhoneCode($data['phone'],$data['code']);
            $this->ApiReturn(0,"成功");
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }


    //微信登陆
    public function WeLogin()
    {
        $data = $this->data;
        $code = $data['code'];
//        $code = "021JE9842k1uxJ0Q9X742H1L742JE98X";
        $state = $data['state'];
        $appid = C('WxAppPayConf_pub.APPID');
        $secret = C('WxAppPayConf_pub.APPSECRET');
        $token_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={$appid}&secret={$secret}&code={$code}&grant_type=authorization_code";

        $token_res = file_get_contents($token_url);
        $token_res = json_decode($token_res,true);

//        $this->ApiReturn(0, '成功', $token_res);

        if($token_res['errcode']){
            file_put_contents('/Public/wei_log.logs',json_encode($token_res,JSON_UNESCAPED_UNICODE),FILE_APPEND);
            $this->ApiReturn(29001,'获取token失败');
        }
        file_put_contents('/Public/wei.logs',json_encode($token_res,JSON_UNESCAPED_UNICODE));
        $user_url = "https://api.weixin.qq.com/sns/userinfo?access_token={$token_res['access_token']}&openid={$token_res['openid']}";

        $user_res = file_get_contents($user_url);
        $user_res = json_decode($user_res,true);

        if($user_res['errcode']){
            file_put_contents('/Public/wei_log.logs',json_encode($user_res,JSON_UNESCAPED_UNICODE),FILE_APPEND);
            $this->ApiReturn(29002, '获取用户信息失败');
        }

        $users = M('user');
        $count = $users->where(array('openid'=>$user_res['openid']))->find();
        if(!$count){
            //$data1['card_num'] = 12345; //会员编号
            $data1['regist_type'] = 2; //注册类型，1手机号注册，2微信注册
            $data1['image'] = $user_res['headimgurl'];
            $data1['name'] = $user_res['nickname'];
            $data1['sex'] = $user_res['sex'];
            $data1['openid'] = $user_res['openid'];
//            $data1['mobile'] = $data['phone'];
            $data1['register_time'] = time(); //注册时间
            $data1['last_login_time'] = time();
            $data1['last_login_ip'] = $_SERVER['REMOTE_ADDR'];
            $id = M('user')->add($data1);
            $arr = $this->userInfo($id);
            $token = $this->get_token($data['phone'],$data['password'],$id);
            $arr['token']=$token;
            $this->ApiReturn(-1,"需要绑定手机号",$arr);
        }else{
            if ($count['mobile']==""){
                $arr = $this->userInfo($count['id']);
                $token = $this->get_token($data['phone'],$data['password'],$count['id']);
                $arr['token']=$token;
                $this->ApiReturn(-1,"需要绑定手机号",$arr);
            }else{
                $arr = $this->userInfo($count['id']);
                $token = $this->get_token($data['phone'],$data['password'],$count['id']);
                $arr['token']=$token;
                $this->ApiReturn(0,"登陆成功",$arr);
            }
        }
    }

    public function getimg($url){

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        $output = curl_exec($ch);
        curl_close($ch);
        $img_name = time().mt_rand(1000000,9999999).'.png';
        $root_path = C('WEI_IMG');
        $sub_path = '/Public/uploads/log/weilog/';
        if(!file_exists($root_path.$sub_path)){
            mkdir($root_path.$sub_path,0777,true);
        }

        $ok = file_put_contents($root_path.$sub_path.$img_name,$output);
        if($ok){
            return $sub_path.$img_name;
        }else{
            return '/Public/uploads/log/timg.jpg';
        }

    }

    public function checkUser()
    {
        try{
            $data = $this->data;
            $openid = $data['openid'];
            if (M('user')->where('openid='.$openid)->find()){
                $this->ApiReturn(-1,'该微信账号已注册');
            }
            $this->ApiReturn(0, '该微信账号暂未注册');
        } catch (\Exception $e) {
            $this->ApiReturn(10002,'系统错误');
        }
    }

    public function GrabImage() {
        $data = $this->data;
        $url = $data['url'];
        $filename = "test";
        $type=0;
        $save_dir = '/Uploads/Picture/';
        if(trim($url)==''){
            return array('file_name'=>'','save_path'=>'','error'=>1);
        }
        if(trim($save_dir)==''){
            $save_dir='./';
        }
        if(trim($filename)==''){//保存文件名
            $ext=strrchr($url,'.');
            if($ext!='.gif'&&$ext!='.jpg'){
                return array('file_name'=>'','save_path'=>'','error'=>3);
            }
            $filename=time().$ext;
        }
        if(0!==strrpos($save_dir,'/')){
            $save_dir.='/';
        }
        //创建保存目录
        if(!file_exists($save_dir)&&!mkdir($save_dir,0777,true)){
            return array('file_name'=>'','save_path'=>'','error'=>5);
        }
        //获取远程文件所采用的方法
        if($type){
            $ch=curl_init();
            $timeout=5;
            curl_setopt($ch,CURLOPT_URL,$url);
            curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
            curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout);
            $img=curl_exec($ch);
            curl_close($ch);
        }else{
            ob_start();
            readfile($url);
            $img=ob_get_contents();
            ob_end_clean();
        }
        //$size=strlen($img);
        //文件大小
        $fp2=@fopen($save_dir.$filename,'a');
        fwrite($fp2,$img);
        fclose($fp2);
        unset($img,$url);
        return array('file_name'=>$filename,'save_path'=>$save_dir.$filename,'error'=>0);
    }
}