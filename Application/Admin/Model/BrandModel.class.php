<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 品牌模型
 * @author huajie <banhuajie@163.com>
 */

class BrandModel extends Model {

    /* 自动验证规则 */
    protected $_validate = array(
        array('title', 'require', '名称不能为空', self::MUST_VALIDATE, ),
    );
	/**
     * 文件模型自动完成
     * @var array
     */
    protected $_auto = array(
        array('admin_id', 'session', self::MODEL_INSERT, 'function', 'user_auth.uid'),
        array('addtime', NOW_TIME, self::MODEL_INSERT),
    );
}
