<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 系统配文件
 * 所有系统级别的配置
 */
return array(
    /* 模块相关配置 */
    'AUTOLOAD_NAMESPACE' => array('Addons' => ONETHINK_ADDON_PATH), //扩展模块列表
    'DEFAULT_MODULE'     => 'Home',
    'MODULE_DENY_LIST'   => array('Common', 'User'),
    'MODULE_ALLOW_LIST'  => array('Home','Admin','Member','Clientapi'),

    /* 系统数据加密设置 */
    'DATA_AUTH_KEY' => '{[3Zm/YWD>=:C~O|XAj%<;q50uiL&c+)V`k($n.@', //默认数据加密KEY

    /* 调试配置 */
    'SHOW_PAGE_TRACE' => false,

    /* 用户相关设置 */
    'USER_MAX_CACHE'     => 1000, //最大缓存用户数
    'USER_ADMINISTRATOR' => 1, //管理员用户ID

    /* URL配置 */
    'URL_CASE_INSENSITIVE' => true, //默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL'            => 2, //URL模式
    'VAR_URL_PARAMS'       => '', // PATHINFO URL参数变量
    'URL_PATHINFO_DEPR'    => '/', //PATHINFO URL分割符

    /* 全局过滤配置 */
    'DEFAULT_FILTER' => '', //全局过滤函数

    /* 数据库配置 */
    'DB_TYPE'   => 'mysqli', // 数据库类型
    'DB_HOST'   => '192.168.1.180', // 服务器地址
    'DB_NAME'   => 'fqmall_v1.1.1',//'chanmao', // 数据库名
    'DB_USER'   => 'root',//'fanqie', // 用户名
    'DB_PWD'    => '',	//'111111',  // 密码
    'DB_PORT'   => '3306', // 端口
    'DB_PREFIX' => 'onethink_', // 数据库表前缀

    /* 文档模型配置 (文档模型核心配置，请勿更改) */
    'DOCUMENT_MODEL_TYPE' => array(2 => '主题', 1 => '目录', 3 => '段落'),
    'WEBSITE'=>'http://www.miguaner.cn',

    //'配置项'=>'配置值'
    define('WEB_HOST', 'http://fqmall.tjtomato.com'),
    /*微信支付配置*/
    'WxPayConf_pub'=>array(
        'APPID' => 'wx8c1297a2aafcb715',
        'MCHID' => '1394179202',
        'KEY' => 'tjtomato20160101tjtomato74915036',
        'APPSECRET' => '27bec66d6eabb65dc637af562a17da46',
        'JS_API_CALL_URL' => WEB_HOST.'/clientapi/Wxpay/jsApiCall',
        'SSLCERT_PATH' => WEB_HOST.'/ThinkPHP/Library/Vendor/WxPayPubHelper/cacert/apiclient_cert.pem',
        'SSLKEY_PATH' => WEB_HOST.'/ThinkPHP/Library/Vendor/WxPayPubHelper/cacert/apiclient_key.pem',
        'NOTIFY_URL' =>  WEB_HOST.'/clientapi/Wxpay/notify',
        'CURL_TIMEOUT' => 30
    ),
    /*微信APP登陆支付配置*/
    'WxAppPayConf_pub'=>array(
        'APPID' => 'wxd499ba851d8d047f',
        'APPSECRET' => '55c03abb3e79f84b0bdf2f94c679c3be',
    )


);
