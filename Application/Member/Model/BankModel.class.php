<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Member\Model;
use Think\Model;

/**
 * 银行模型
 */
class BankModel extends Model{

	/* 自动验证规则 */
	protected $_validate = array(
		array('name', 'require', '持卡人不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
		array('card_num', 'require', '卡号不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_INSERT),
		array('mobile', 'require', '手机号不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_INSERT)
	);
}
