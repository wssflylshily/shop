<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/4
 * Time: 11:38
 */

namespace Clientapi\Controller;


class UserApiBaseController extends MapiBaseController
{
    protected function _initialize(){
        /*$json=file_get_contents('php://input');
        $this->data=json_decode($json);
        $this->data=$json;
        if(is_null($this->data)){
            $this->ApiReturn(20000,'参数格式错误，除文件上传外所有参数格式为JSON格式');
        }*/
        header("Access-Control-Allow-Origin: *");
        $this->data = $_REQUEST;
        $this->writeLog("收到用户:".json_encode($this->data));
        if(is_null($this->data)){
            $this->ApiReturn(20000,'参数格式错误，除文件上传外所有参数格式为JSON格式');
        }
        $data=$this->data;
        $token=$data['token'];

        if(!S($token)){
            $this->ApiReturn(20003,'token无效或已过期','');
        }
        //TODO::判断用户ID未实装
//		if($data->did){
//			if(S($token)!="did$data->did"){
//				$this->ApiReturn(20003,'用户ID不符');
//			}
//		}
//		if($data->Did){
//			if(S($token)!="did$data->Did"){
//				$this->ApiReturn(20003,'用户ID不符');
//			}
//		}
//
//		if($data->Pid){
//			if(S($token)!="pid$data->Pid"){
//				$this->ApiReturn(20003,'用户ID不符');
//			}
//		}
    }

    /**
     * 增加会员积分记录 增加会员积分数
     * @param $user_id
     * @param $type 积分类型，1注册，2签到，3消费，4拼团（暂无)，5充值
     */
    public function addIntegralRecord($user_id,$type)
    {
        $int = M('Integrate')->where('id=1')->find();
        $integral=0;
        switch ($type)
        {
            case 1:
                $integral =  $int['regist_ratio'];
                $title =  "会员注册";
                break;
            case 2:
                $integral =  $int['sign_ratio'];
                $title =  "会员签到";
                break;
            case 3:
                $integral =  $int['regist_ratio'];
                $title =  "会员消费";
                break;
            case 5:
                $integral =  $int['sign_ratio'];
                $title =  "会员充值";
                break;
        }
        $user = M('user')->where('id='.$user_id)->find();
        $use_map['integral'] = (int)$user['integral']+(int)$integral;
        if (!M('user')->where('id='.$user_id)->save($use_map)){
            return 0;
        }

        $new_lv = $user['lv']+1;
        $grade = M('grade')->where('glv='.$new_lv)->find();
        if ($use_map['integral'] >= $grade['glimit']){
            M('user')->where('id='.$user_id)->save(array('lv'=>$new_lv));
        }

        $map['user_id'] = $user_id;
        $map['title'] = $title;
        $map['integral'] = $integral;
        $map['type'] = $type;
        $map['addtime'] = time();
        if (!M('IntegralRecord')->add($map)){
            return 0;
        }
        return $integral;
    }
}