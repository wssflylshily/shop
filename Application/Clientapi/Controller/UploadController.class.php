<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/4
 * Time: 14:03
 */

namespace Clientapi\Controller;


use Think\Controller;

class UploadController extends Controller
{
//上传图片
    public function up_img(){
        try {
            $savepath = date('Ymd') . '/';
            //上传处理类
            $config = array(
                'rootPath' => './Uploads/Picture/',
                'savePath' => $savepath,
                'maxSize' => 11048576,
                'saveName' => array('uniqid', ''),
                'exts' => array('jpg', 'gif', 'png', 'jpeg','apk'),
                'autoSub' => false,
            );
            $upload = new \Think\Upload($config);//
            $info = $upload->uploadOne($_FILES['pic']);
//            $info = $upload->uploadOne($file);
            //开始上传
            if ($info) {
                //var_dump($info);
                $img_arr = array();
                foreach ($info as $key => $value) {

                    if (!empty($value['url'])) {
                        $url = $value['url'];
                    } else {
                        $url = C("TMPL_PARSE_STRING.__UPLOAD__") . $savepath . $value['savename'];
                    }
                    //$img_arr[$key] ='http://'.$_SERVER['SERVER_NAME'].$url;
                    $img_arr[$key] = $value;
                }
                //$img_arr['url'] = 'http://'.$_SERVER['SERVER_NAME'].'/Uploads/Picture/'.$img_arr['savepath'].'/'.$img_arr['savename'];
                $img_arr['url'] = '/Uploads/Picture/'.$img_arr['savepath'].'/'.$img_arr['savename'];
                $this->ApiReturn(0, "上传成功", $img_arr);
            } else {
                $error=$upload->getError();
                switch($error){
                    case "没有上传的文件！":
                        $code=30001;
                        break;
                    case "上传文件后缀不允许":
                        $code=30000;
                        break;
                    case "上传文件大小不符！":
                        $code=30002;
                        break;
                }
                $this->ApiReturn($code,$upload->getError());
            }
        } catch (\Exception $e) {
            $this->ApiReturn(10001, '系统错误');
        }
    }

    protected function ApiReturn($code,$msg,$data=null) {
        $arr['code']=$code;
        $arr['msg']=$msg;
        if(empty($data)&&!is_array($data)){
            $data=(object)array();
        }
        $arr['data']=$data;
        $arr['time']=time();
        echo json_encode($arr);
        die();
    }
}