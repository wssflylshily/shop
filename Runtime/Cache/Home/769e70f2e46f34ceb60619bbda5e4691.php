<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html style="max-width: 720px">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
		<title><?php echo C('WEB_SITE_TITLE');?></title>
		<link rel="stylesheet" href="/Public/Home/css/swiper-3.3.1.min.css">
		<script src="/Public/Home/js/swiper-3.3.1.min.js"></script>

		<link rel="stylesheet" href="/Public/Home/css/common.css">
		<link rel="stylesheet" href="/Public/Home/css/main.css">
		<script src="/Public/Home/js/jquery-1.8.3.min.js"></script>
		<script src="/Public/Home/js/common.js"></script>
		<script src="/Public/Home/js/delIOS_huitan.js"></script>
		<?php
require_once "./sample/php/jssdk.php"; $jssdk = new JSSDK("wx73f8f21829bef9c6", "00ea7e3072f302d457e88b7402dc6429"); $signPackage = $jssdk->GetSignPackage(); ?>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
	wx.config({
			      debug: false,
			      appId: '<?php echo $signPackage["appId"];?>',
			      timestamp: <?php echo $signPackage["timestamp"];?>,
			      nonceStr: '<?php echo $signPackage["nonceStr"];?>',
			      signature: '<?php echo $signPackage["signature"];?>',
			      jsApiList: [
			        'checkJsApi',
			        'onMenuShareTimeline',
			        'onMenuShareAppMessage',
			        'onMenuShareQQ',
			        'onMenuShareWeibo',
			        'onMenuShareQZone',
			      ]
			  });
			
		wx.ready(function(){
			var weiurl = "<?php echo ($weiurl); ?>";
			var weilink = window.location.href;
			var weititle = "<?php echo C('WEB_SITE_TITLE');?>";
			var imgurl = "http://www.miguaner.cn/Public/share/img/chanmaologo.png";
			console.log(weiurl);
	        wx.checkJsApi({
	            jsApiList: ['onMenuShareAppMessage'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
	        });
	         wx.onMenuShareTimeline({
	            title: weititle, 
	            link: weiurl,
	            imgUrl: imgurl, // 分享图标
	            trigger:function(res){
	            },
	            success: function () {
	                //alert('已分享');
	            },
	            cancel: function () {
	            },
	            fail:function(){
	            } 
	        });
	        wx.onMenuShareAppMessage({
	            title: weititle, // 分享标题
	            desc: weilink, // 分享描述
	            link: weiurl, // 分享链接
	            imgUrl: imgurl, // 分享图标
	            type: 'link', // 分享类型,music、video或link，不填默认为link
	            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
	            success: function () {
	              //  alert('hello');
	            },
	            cancel: function () {
	            }
	        });
	         //分享到QQ
	        wx.onMenuShareQQ({
	            title: weititle,
	            desc: weilink,
	            link: weiurl,
	            imgUrl: imgurl, // 分享图标
	            success: function () { 
	               // 用户确认分享后执行的回调函数
	            },
	            cancel: function () { 
	               // 用户取消分享后执行的回调函数
	            }
	        });
	        //分享到腾讯微博
	        wx.onMenuShareWeibo({
	            title: weititle,
	            desc: weilink,
	            link: weiurl,
	            imgUrl: imgurl, // 分享图标
	            success: function () { 
	               // 用户确认分享后执行的回调函数
	            },
	            cancel: function () { 
	                // 用户取消分享后执行的回调函数
	            }
	        });

	        // 分享到qq空间
	        wx.onMenuShareQZone({
			    title: weititle, // 分享标题
			    desc: weilink, // 分享描述
			    link: weiurl, // 分享链接
			    imgUrl: imgurl, // 分享图标
			    success: function () { 
			       // 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
			        // 用户取消分享后执行的回调函数
			    }
			});
    	});
</script>

	</head>
	<body style="max-width: 720px;background:#fff" class="box">
		<!--遮罩层-->
		<div id="zhezhao" style="display:none"></div>
		<!--点击左上角会员按钮出现的 侧边栏-->
		<div id="indexleftBar" style="display: none">
			<div class="top">
				<div class="contain maxWidth">
					<p class="img">
						<?php if($user["image"] == ''): ?><span class="touxiang" style="background-image:url(/Public/Home/img/mytouxiang.png)"></span>
						<?php else: ?>
						<span class="touxiang" style="background-image:url(<?php echo ($user["image"]); ?>)"></span><?php endif; ?>
					</p>
					<p class="nologin"><a href="<?php echo U('Reg/index');?>">注册</a><em>|</em><a href="<?php echo U('/Member/Login/index');?>">登录</a></p>
					<p class="login" style="display: none"><?php echo ($user["login_user"]); ?></p>
				</div>
			</div>
			<div class="main">
				<div class="contain maxWidth">
					<a href="<?php echo U('/Search/pageindex');?>">
						<span class="hz">&#xe607;</span>
						<span>搜索</span>
					</a>
					<a href="<?php echo U('/Member/Order');?>" class="active">
						<span class="hz">&#xe610;</span>
						<span>全部订单</span>
					<?php
 if($is_login==1) { ?>
						<?php if($order_num > 0): ?><em class="dingdanNum"><?php echo ($order_num); ?></em><?php endif; ?>
					<?php
 } ?>
					</a>
					<a href="<?php echo U('/Member/UserAddress');?>">
						<span class="hz">&#xe60d;</span>
						<span>收货地址</span>
					</a>
					<a href="<?php echo U('/Member/Collection/index');?>">
						<span class="hz">&#xe60f;</span>
						<span>我的收藏</span>
					</a>
					<a href="<?php echo U('Cart/index');?>">
						<span class="hz">&#xe601;</span>
						<span>我的购物车</span>
					<?php
 if($is_login==1) { ?>
						<?php if($cart_num > 0): ?><em class="cartNum"><?php echo ($cart_num); ?></em><?php endif; ?>
					<?php
 } ?>
					</a>
					<a href="<?php echo U('/Member/Index/couponlist');?>">
						<span class="hz">&#xe611;</span>
						<span>我的优惠券</span>
					<?php
 if($is_login==1) { ?>
						<?php if($coupon_num > 0): ?><em class="couponNum"><?php echo ($coupon_num); ?></em><?php endif; ?>
					<?php
 } ?>
					</a>
					<!-- <a href="/Member/Index/infolist">
						<span class="hz">&#xe6a9;</span>
						<span>我的消息</span>
						<?php
 if($is_login==1) { ?>
						<?php if($info_num > 0): ?><em class="xiaoxiNum"><?php echo ($info_num); ?></em><?php endif; ?>
					<?php
 } ?>
					</a> -->
				</div>
			</div>
		</div>
		<!--正文区域-->
		<div id="indexTop">
			<div class="contain maxWidth clear">
				<div class="col-6"><img src="/Public/Home/img/logo.png"></div>
				<div class="col-6 search">
					<div class="inputArea">
						<span class="hz search">&#xe6e5;</span>
						<input type="text" id="keywords" placeholder="搜索">
					</div>
				</div>
			</div>
		</div>
		<div id="indexTop1">
			<div class="maxWidth">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<?php if(is_array($all_cates)): $i = 0; $__LIST__ = $all_cates;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
							<a href="<?php echo U('Index/catelist',array('id'=>$cate['id']));?>"><?php echo ($cate["title"]); ?></a>
						</div><?php endforeach; endif; else: echo "" ;endif; ?>
						<!-- 最后这个不放到循环里面 这个是一定要有的-->
						<div class="swiper-slide">
							<a href="<?php echo U('Search/index');?>">所有产品 <span class="hz">&#xe6e6;</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="indexMain" class="fastscroll">
			<div class="maxWidth">
				<!-- 轮播区域-->
				<div class="lunbo lunbotop">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<?php if(is_array($focuslist1)): $i = 0; $__LIST__ = $focuslist1;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
									<a href="<?php echo ($item["link_url"]); ?>">
										<img src="<?php echo ($item["image"]); ?>"/>
									</a>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
				<!-- 蜜罐儿热销榜-->
				<div class="rexiaoBang">
					<div class="title">蜜罐儿热销榜</div>
					<div class="clear">
						<div class="l ban">
							<p class="tit">当日单品热销榜</p>
							<!-- <span class="img"></span>这个会自动根据li的序号显示相应的图片-->
							<ul>
								<?php if(is_array($prolist)): $i = 0; $__LIST__ = $prolist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pro): $mod = ($i % 2 );++$i;?><li>
									<a href="<?php echo U('Product/detail',array('id'=>$pro['id']));?>">
										<span class="img"></span>
										<span class="text"><?php echo ($pro["title"]); ?></span>
									</a>
								</li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
						<div class="line l">&nbsp;</div>
						<div class="l ban">
							<p class="tit">当月单品热销榜</p>
							<!-- <span class="img"></span>这个会自动根据li的序号显示相应的图片-->
							<ul>
								<?php if(is_array($prolist1)): $i = 0; $__LIST__ = $prolist1;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pros): $mod = ($i % 2 );++$i;?><li>
									<a href="<?php echo U('Product/detail',array('id'=>$pros['id']));?>">
										<span class="img"></span>
										<span class="text"><?php echo ($pros["title"]); ?></span>
									</a>
								</li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
					</div>
				</div>
				<!-- 拼团秒杀-->
				<div class="pintuanMiaosha">
					<p class="tit"><img src="/Public/Home/img/index/ptTit.jpg" /></p>
					<!--
						status1代表距离开始 status2代表距离结束
						liendTimeStr='2016/12/24 16:46:10';
						从后台读取的时间截止的毫秒数 1478350790050 传ms数或者，这种格式的字符串都行
					-->
					<ul class="lie">
						<?php if(is_array($spell)): $i = 0; $__LIST__ = $spell;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li data-juStartTime="<?php echo date('Y/m/d H:i:s',$vo['start_date']);?>" data-juEndTime="<?php echo date('Y/m/d H:i:s',$vo['end_date']);?>" data-status="<?php echo ($vo["state"]); ?>">
							<a href="<?php echo U('Spell/detail',array('id'=>$vo['id']));?>">
								<img src="<?php echo ($vo["image"]); ?>"/>
								<div class="line1">
									<span class="share"><?php echo ($statearr[$vo['state']]); ?></span>
									<?php if($vo['state'] < 3): ?><span class="daojishi"><span class="daojishiText">距结束</span> <span class="time"><b class="shi">08</b>:<b class="fen">26</b>:<b class="miao">58</b></span></span><?php endif; ?>
								</div>
								<div class="line2"><?php echo ($vo["title"]); ?></div>
								<div class="line3">
									<span class="xian">&yen;<span class="money"><?php echo ($vo["price"]); ?></span></span>
									<del>&yen;<span class="money"><?php echo ($vo["oldprice"]); ?></span></del>
								</div>
								<div class="line4 textR">
								<span class="goKaituan">
									<?php echo ($vo["num"]); ?>人团<span class="line"></span>去开团
								</span>
								</div>
							</a>
						</li><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
					<div class="more">
						<a href="<?php echo U('Spell/index');?>">查看更多 <span class="hz">&#xe60c;</span></a>
					</div>
				</div>
				<!-- com美丽-->
				<div class="com" id="beautiful">
					<div class="tit">
						<a href="/index.php?s=/Home/Index/catelist/id/14"><img src="/Public/Home/img/index/index_tit1.jpg" /></a>
					</div>
					<div class="lunbo">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<?php if(is_array($list2)): $i = 0; $__LIST__ = $list2;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l2): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
									<a href="<?php echo ($l2["link_url"]); ?>">
										<img src="<?php echo ($l2["image"]); ?>"/>
									</a>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
								
							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
					<ul class="lie clear">
						<?php if(is_array($products1)): $i = 0; $__LIST__ = $products1;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pro1): $mod = ($i % 2 );++$i;?><li>
							<a href="<?php echo U('Product/detail',array('id'=>$pro1['id']));?>">
								<img src="<?php echo ($pro1["image"]); ?>"/>
								<div class="line1"><?php echo ($pro1["title"]); ?></div>
								<div class="line2">
									<span class="xian">&yen;<span class="money"><?php echo ($pro1["gprice"]); ?></span></span>
									<del>&yen;<span class="money"><?php echo ($pro1["market_price"]); ?></span></del>
								</div>
							</a>
						</li><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
				</div>
				<!-- com健康-->
				<div class="com" id="health">
					<div class="tit">
						<a href="/index.php?s=/Home/Index/catelist/id/16"><img src="/Public/Home/img/index/index_tit2.jpg" /></a>
					</div>
					<div class="lunbo">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<?php if(is_array($list3)): $i = 0; $__LIST__ = $list3;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l3): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
									<a href="<?php echo ($l3["link_url"]); ?>">
										<img src="<?php echo ($l3["image"]); ?>"/>
									</a>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
					<ul class="lie clear">
						<?php if(is_array($products2)): $i = 0; $__LIST__ = $products2;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pro2): $mod = ($i % 2 );++$i;?><li>
							<a href="<?php echo U('Product/detail',array('id'=>$pro2['id']));?>">
								<img src="<?php echo ($pro2["image"]); ?>"/>
								<div class="line1"><?php echo ($pro2["title"]); ?></div>
								<div class="line2">
									<span class="xian">&yen;<span class="money"><?php echo ($pro2["gprice"]); ?></span></span>
									<del>&yen;<span class="money"><?php echo ($pro2["market_price"]); ?></span></del>
								</div>
							</a>
						</li><?php endforeach; endif; else: echo "" ;endif; ?>
						
					</ul>
				</div>
				<!-- com玩乐-->
				<div class="com" id="wanle">
					<div class="tit">
						<a href="/index.php?s=/Home/Index/catelist/id/17"><img src="/Public/Home/img/index/index_tit3.jpg" /></a>
					</div>
					<div class="lunbo">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<?php if(is_array($list4)): $i = 0; $__LIST__ = $list4;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l4): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
									<a href="<?php echo ($l4["link_url"]); ?>">
										<img src="<?php echo ($l4["image"]); ?>"/>
									</a>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
					<ul class="lie clear">
						<?php if(is_array($products4)): $i = 0; $__LIST__ = $products4;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pro4): $mod = ($i % 2 );++$i;?><li>
							<a href="<?php echo U('Product/detail',array('id'=>$pro4['id']));?>">
								<img src="<?php echo ($pro4["image"]); ?>"/>
								<div class="line1"><?php echo ($pro4["title"]); ?></div>
								<div class="line2">
									<span class="xian">&yen;<span class="money"><?php echo ($pro4["gprice"]); ?></span></span>
									<del>&yen;<span class="money"><?php echo ($pro4["market_price"]); ?></span></del>
								</div>
							</a>
						</li><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
				</div>
				<!-- com家居-->
				<!-- <div class="com" id="jiaju">
					<div class="tit">
						<a href="/index.php?s=/Home/Index/catelist/id/5"><img src="/Public/Home/img/index/index_tit4.jpg" /></a>
					</div>
					<div class="lunbo">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<?php if(is_array($list5)): $i = 0; $__LIST__ = $list5;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l5): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
									<a href="<?php echo ($l5["link_url"]); ?>">
										<img src="<?php echo ($l5["image"]); ?>"/>
									</a>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
					<ul class="lie clear">
						<?php if(is_array($products4)): $i = 0; $__LIST__ = $products4;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pro4): $mod = ($i % 2 );++$i;?><li>
							<a href="<?php echo U('Product/detail',array('id'=>$pro4['id']));?>">
								<img src="<?php echo ($pro4["image"]); ?>"/>
								<div class="line1"><?php echo ($pro4["title"]); ?></div>
								<div class="line2">
									<span class="xian">&yen;<span class="money"><?php echo ($pro4["gprice"]); ?></span></span>
									<del>&yen;<span class="money"><?php echo ($pro4["market_price"]); ?></span></del>
								</div>
							</a>
						</li><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
				</div> -->
				
			</div>
		</div>
		<div id="botBar">
			<div class="contain maxWidth">
				<div>
					<a href="/" class="<?php echo ($home_active); ?>">
						<span class="hz">&#xe604;</span>
						<em>首页</em>
					</a>
				</div>
				<div>
					<a href="<?php echo U('Spell/index');?>" class="<?php echo ($spell_active); ?>">
						<span class="hz">&#xe6a8;</span>
						<em>拼团</em>
					</a>
				</div>
				<div>
					<a href="<?php echo U('Cart/index');?>" class="<?php echo ($cart_active); ?>">
						<span class="hz">&#xe601;</span>
						<em>购物车</em>
					</a>
				</div>
				<div>
					<a href="<?php echo U('/Member/Order/index');?>" class="<?php echo ($order_active); ?>">
						<span class="hz">&#xe602;</span>
						<em>订单</em>
					</a>
				</div>
				<div>
					<a href="<?php echo U('/Member/Index/index');?>" class="<?php echo ($member_active); ?>">
						<span class="hz">&#xe605;</span>
						<em>我的</em>
					</a>
				</div>
			</div>
		</div>

		<script>
			//点击搜索区域
			$('#indexTop .search .inputArea').on('click',function(){
				location.href="<?php echo U('Search/pageindex');?>";
			});

			//顶部轮播 720 400
			//设置图片高度
			setTopLunboH();
			function setTopLunboH(){
				var w=$('#indexMain .lunbotop .swiper-slide a img').width();
				$('#indexMain .lunbotop .swiper-slide a img').height(400*w/720);
			}
			var mySwiper = new Swiper('#indexMain .lunbotop .swiper-container', {
				autoplay: 3000,
				loop:true,
				autoplayDisableOnInteraction:false,
				pagination : '.swiper-pagination'
			});

			//水平滑动 不固定用这个
			var mySwiper1 = new Swiper('#indexTop1 .swiper-container',{
				freeMode : true,
				slidesPerView: 'auto'
			});

			//拼团秒杀 700 400
			setPintuanMiaoshaH();
			function setPintuanMiaoshaH(){
				var w=$('#indexMain .pintuanMiaosha .lie li img').width();
				$('#indexMain .pintuanMiaosha .lie li img').height(400*w/700);
			}
			//拼团 money显示.0
			CashToZero1('#indexMain .pintuanMiaosha .money');

			//com tit img高度720 110
			setcomTitimgH();
			function setcomTitimgH(){
				var w=$('#indexMain .com .tit img').width();
				$('#indexMain .com .tit img').height(110*w/720);
			}
			//轮播
			var mySwiperCom = new Swiper('#indexMain .com .lunbo .swiper-container', {
				autoplay: 3000,
				loop:true,
				autoplayDisableOnInteraction:false,
				pagination : '.swiper-pagination'
			});
			//700 /400
			setComLunboH();
			function setComLunboH(){
				var w=$('#indexMain .com .lunbo .swiper-slide a img').width();
				$('#indexMain .com .lunbo .swiper-slide a img').height(400*w/700);
			}
			//商品图片h 345/300
			setComImgH();
			function setComImgH(){
				var w=$('#indexMain .com .lie li img').width();
				$('#indexMain .com .lie li img').height(300*w/345);
			}
			//money 显示.0
			CashToZero1('#indexMain .com .money');

			//拼团倒计时////////////////////////////////////////////////////////////////////////////////////////////
			//距离结束 距离开始 公共调用的函数
			function setPTtime(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer){
				var NowTime = new Date();
				var t =licurrTime.getTime() - NowTime.getTime();
				var d=0;
				var h=0;
				var m=0;
				var s=0;
				if(t>=0){
					d=Math.floor(t/1000/60/60/24);
					h=Math.floor(t/1000/60/60%24);
					m=Math.floor(t/1000/60%60);
					s=Math.floor(t/1000%60);
				}else{
					clearInterval(litimer);
					//距离开始倒计时结束后，直接走距离结束的倒计时
					if(listatus==1){
						listatus=2;
						juliEndTimer(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer);
						//ajax 把后台的status设置为2
						$.ajax({
							type: 'GET',
							url: "<?php echo U('Spell/updateSpell');?>",
							dataType: 'json',
							success: function(data){

							},
							error: function(xhr, type){
								console.log('Ajax error!');
							}
						});
					}
				}
				
				//天转换成小时
				h+=d*24;
				$(li).find('.line1 .daojishi .time .shi').text(zhuanTwo(h));
				$(li).find('.line1 .daojishi .time .fen').text(zhuanTwo(m));
				$(li).find('.line1 .daojishi .time .miao').text(zhuanTwo(s));
			}
			function zhuanTwo(v){
				//时分秒转成两位数
				if(v<10){
					return '0'+v;
				}else{
					return ''+v;
				}
			}
			//距离结束
			function juliEndTimer(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer){
				var liEndTime= new Date(liendTimeStr);
				licurrTime=liEndTime;
				$(li).find('.daojishiText').text('距离结束');
				litimer=setInterval(function(){
					setPTtime(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer);
				},30);
			}
			//距离开始
			function juliStartTimer(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer){
				var liStartTime= new Date(listartTimeStr);
				licurrTime=liStartTime;
				$(li).find('.daojishiText').text('距离开始');
				litimer=setInterval(function(){
					setPTtime(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer);
				},30);
			}
			//根据status走不同的定时器
			function setliDaojishi(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer){
				if(listatus==1){
					juliStartTimer(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer);
				}else if(listatus==2){
					juliEndTimer(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer);
				}
			}
			//获取所有的li，执行倒计时操作
			var allli=$('#indexMain .pintuanMiaosha .lie li');
			for(var x=0;x<allli.length;x++){
				//设置
				allli[x].timer=null;
				allli[x].currTime=null;

				//获取
				var li=$(allli[x]);
				var listatus=$(allli[x]).attr('data-status');
				var listartTimeStr=$(allli[x]).attr('data-juStartTime');
				var liendTimeStr=$(allli[x]).attr('data-juEndTime');
				var licurrTime=allli[x].currTime;
				var litimer=allli[x].timer;

				//执行倒计时操作
				setliDaojishi(li,listatus,listartTimeStr,liendTimeStr,licurrTime,litimer);
			}
		</script>
	</body>
</html>