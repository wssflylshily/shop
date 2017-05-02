<?php
/**
 * Created by PhpStorm.
 * User: sunfan
 * Date: 2017/2/8
 * Time: 11:09
 * 首页
 */

namespace Clientapi\Controller;


class HomeController extends MapiBaseController
{

    public function index()
    {
        try{
            $db = M('Product');

            $config = M('config')->where(array('name'=>"WEB_SITE_TITLE"))->find();
            $message['title'] = $config['value'];

            //轮播
            $lunbo = M('focus')->where(array('pos_id'=>1))->select();
            if ($lunbo){
                for ($i=0;$i<count($lunbo);$i++){
                    $images[$i]['id'] = $lunbo[$i]['id'];
                    $images[$i]['title'] = $lunbo[$i]['title'];
                    $images[$i]['image'] = $lunbo[$i]['image'];
                }
            }
            $message['images'] = $images;

            //新闻快报
            $message['notice'] = M('News')->where(array('type'=>'kuaibao'))->field('title')->find();

            $message['adimage1'] = M('focus')->where(array('pos_id'=>2))->field('image')->find();
            $message['adimage2'] = M('focus')->where(array('pos_id'=>3))->field('image')->find();
            $message['adimage3'] = M('focus')->where(array('pos_id'=>4))->field('image')->find();
            $message['hotimage'] = M('focus')->where(array('pos_id'=>5))->field('image')->find();

            //新品热卖
            $news = $db->where(array('status'=>1,'is_new'=>1))->select();
            if (!$news){
                $news = $db->where(array('status'=>1))->order('create_time desc')->limit(0,8)->select();
            }
            for($i=0;$i<count($news);$i++){
                $new[$i]['pid'] = $news[$i]['id'];
                $new[$i]['title'] = $news[$i]['name'].$news[$i]['title'];
                $new[$i]['pic'] = 'http://'.$_SERVER['SERVER_NAME'].$news[$i]['image'];
                $new[$i]['price'] = $news[$i]['gprice'];
                $new[$i]['marketPrice'] = $news[$i]['market_price'];
            }
            $message['news'] = $new;

            //热卖推荐
            $hots = $db->where(array('status'=>1,'is_hot'=>1))->select();
            if (!$hots){
                $hots = $db->where(array('status'=>1))->order('sell_num desc')->limit(0,4)->select();
            }
            for($i=0;$i<count($hots);$i++){
                $hot[$i]['pid'] = $hots[$i]['id'];
                $hot[$i]['title'] = $hots[$i]['name'].$hots[$i]['title'];
                $hot[$i]['pic'] = 'http://'.$_SERVER['SERVER_NAME'].$hots[$i]['image'];
                $hot[$i]['price'] = $hots[$i]['gprice'];
                $hot[$i]['marketPrice'] = $hots[$i]['market_price'];
            }
            $message['hot'] = $hot;

            //拼团热选
            $spells = M('spell')->where(array('status'=>1,'is_home'=>1))->select();
            if (!$spells){
                $spells = M('spell')->where(array('status'=>1))->order('sell_num desc')->limit(0,2)->select();
            }
            for($i=0;$i<count($spells);$i++){
                $spell[$i]['sid'] = $spells[$i]['id'];
                $spell[$i]['title'] = $spells[$i]['title'];
                $spell[$i]['pic'] = 'http://'.$_SERVER['SERVER_NAME'].$spells[$i]['image'];
                $spell[$i]['price'] = $spells[$i]['price'];
                $spell[$i]['marketPrice'] = $spells[$i]['oldprice'];
                $spell[$i]['start'] = $spells[$i]['start_date'];
                $spell[$i]['end'] = $spells[$i]['end_date'];
                $spell[$i]['state'] = $spells[$i]['state'];//拼团状态，1未开始，2拼团中，3拼团结束(3拼团完成，4拼团失败)
                $spell[$i]['num'] = $spells[$i]['num'];
            }
            $message['spell'] = $spell;

            //产品类目
            $arr = [];
            $category = M('category')->where(array('display'=>1, 'pid'=>array('neq', 0)))->field('id,title')->select();
            for ($j=0;$j<count($category);$j++){
                $rs = $db->where(array('status'=>1, 'category_id'=>$category[$j]['id']))->limit(0, 4)->select();
                if ($rs)
                {
                    $arr[$j]['title'] = $category[$j]['title'];
                    for ($i=0;$i<count($rs);$i++){
                        $arr[$j]['list'][$i]['pid'] = $rs[$i]['id'];
                        $arr[$j]['list'][$i]['title'] = $rs[$i]['title'];
                        $arr[$j]['list'][$i]['url'] = $rs[$i]['image']?$rs[$i]['image']:'/public/Home/img/zhanwei.png';
                        $arr[$j]['list'][$i]['price'] = $rs[$i]['gprice'];
                        $arr[$j]['list'][$i]['marketPrice'] = $rs[$i]['market_price'];
                        $arr[$j]['list'][$i]['sellNum'] = $rs[$i]['sell_num'];
                    }
                }
            }
            $message['pro'] = $arr;

            $this->ApiReturn(0,'成功',$message);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }

    public function getContact()
    {
        try{
            $rs = M('WebSite')->find();
            $data['phone'] = $rs['phone'];
            $data['qq'] = $rs['qq'];
            $this->ApiReturn(0, '成功', $data);
        } catch (\Exception $e){
            $this->ApiReturn(10002,'系统错误');
        }
    }
}