//去掉苹果回弹
var overscroll = function(el) {
    el.addEventListener('touchstart', function() {
        var top = el.scrollTop
            ,totalScroll = el.scrollHeight
            ,currentScroll = top + el.offsetHeight;
        if(top === 0) {
            el.scrollTop = 1;
        }else if(currentScroll === totalScroll) {
            el.scrollTop = top - 1;
        }
    });

    el.addEventListener('touchmove', function(evt) {
        if(el.offsetHeight < el.scrollHeight)
            evt._isScroller = true;
    });
};
window.addEventListener('DOMContentLoaded',function(){
    var all=document.querySelectorAll('.fastscroll');
    for(var i=0;i<all.length;i++){
        overscroll(all[i]);    
    }

    document.body.addEventListener('touchmove', function(evt) {
        if(!evt._isScroller) {
            evt.preventDefault();
        }
    });
});