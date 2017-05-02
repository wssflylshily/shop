//非空验证 
function notEmpty(str){
	var reg=/\S/;
    if(reg.test(str)){
        return true;
    }else{
        return false;
    }
}
//判断是不是手机号
function checkTel(tel){
    var reg=/^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\d{8}$/;
    if(reg.test(tel)){
        return true;
    }else{
        return false;
    }
}
//中文字母数字组成的字符串
function iscnENnum(str){
	var reg=/^[a-zA-Z0-9\u4e00-\u9fa5]+$/;
    if(reg.test(str)){
        return true;
    }else{
        return false;
    }
}
//邮政编码
function isYouZhengNum(str){
	var reg=/[1-9]\d{5}(?!\d)/;
    if(reg.test(str)){
        return true;
    }else{
        return false;
    }
}

//money显示.00
function CashToZero2(selectorstr){
    $(selectorstr).each(function(i,ele){
        $(ele).text(parseFloat($(ele).text()).toFixed(2));
    });
}

//money显示.0
function CashToZero1(selectorstr){
    $(selectorstr).each(function(i,ele){
        $(ele).text(parseFloat($(ele).text()).toFixed(1));
    });
}