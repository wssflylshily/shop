;(function($){
	function bindDB(options,callback){
		var opt = options || {},
			$bindDB = $(".bindDB"),
			len = 0,
			nameText = "";
		if(!$bindDB[0]){$.error("对象不存在！");return false;};
		len = $bindDB.length;
		
		$(".bindDB").live("change",function() {
			
			if(this.name && this.tagName == "SELECT")
			{
				var that = $(this);
				that.nextAll(".bindDB").remove();
				len=$(".bindDB").length;
				if(/_/g.test(this.name)){
					nameText = this.name.split("_")[0]+"_";
					this.name = nameText+(len-1);
				}else{
					nameText = this.name+"_";
					this.name = nameText+(len-1);
				};
				$.ajax({
					url:opt.ajaxurl,
					dataType:"json",
					data:{id:$(this).val()},
					timeout:5000,
					/*error: function(error){
						alert("网络超时！");
					},*/
					success: function(data){
						if(data){
							var option = "";
							$.each(data,function(k,v){
								option+= "<option value='"+v.val+"'>"+v.text+"</option>"
							});
							that.after("<select class='bindDB' name='"+nameText+len+"'>"+option+"</select>");
							
							$(".bindDB:last").change();
						}
						var lastval = $(".bindDB:last option:checked").text();
						if($.isFunction(callback))callback(lastval);
					}
				});
			}
		});
	}
	window.bindDB = bindDB;
})(jQuery)