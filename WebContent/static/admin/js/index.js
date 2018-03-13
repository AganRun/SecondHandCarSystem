// JavaScript Document
$(function() {
	//完整菜单效果1
	$(".menu_list").hide();
	$(".menu_list_first").show();
	$(".a_list").click(function() {
		var len = $('.a_list').length;
		var index = $(".a_list").index(this);
		for(var i = 0; i < len; i++) {
			if(i == index) {
				$('.menu_list').eq(i).slideToggle(300);
			} else {
				$('.menu_list').eq(i).slideUp(300);
			}
		}
	});
	//完整菜单效果2
	/*$(".a_list").each(function(l){
		$(this).click(function(){
			var len = $('.a_list').length;
			for(var i=0;i<len;i++){
				if(i == l){
					$('.menu_list').eq(i).slideToggle(100);
				}else
				{
					$('.menu_list').eq(i).slideUp(100);
				}
			}
		})	
	})*/
})

//点击显示隐藏完成菜单和简洁菜单
$(function() {
	$(".menu-oc").click(function() {
		$(".leftmenu1").animate({
			left: "-292px"
		});
		$(".leftmenu2").animate({
			left: "0px"
		})
		$(".rightcon").css("margin-left", "52px")
	})
	$(".menu-oc1").click(function() {
		$(".leftmenu1").animate({
			left: "0px"
		});
		$(".leftmenu2").animate({
			left: "-192px"
		});
		$(".rightcon").css("margin-left", "240px");
	})
})

//简洁菜单点击效果
/*
$(function(){
	$(".j_menu_list").hide();
	$(".j_a_list").click(function(){
		var len = $('.j_a_list').length;
		var index = $(".j_a_list").index(this);
		for(var i=0;i<len;i++){
			if(i == index){
				$('.j_menu_list').eq(i).slideToggle(300);
				}else{
					$('.j_menu_list').eq(i).slideUp(300);
				}
			}
	});
	$(".j_menu_list>span>i").click(function(){
		$(".j_menu_list").slideUp(300)	
	})
})*/
//简洁菜单移动效果
$(function() {
	$(".j_menu_list").hide();
	$(".j_a_list").hover(function() {
		$(".leftmenu2 ul li").hover(function() {
			$(this).find('.j_menu_list').show();
		}, function() {
			$(this).find('.j_menu_list').hide();
		});
	})
})

//时间函数
function startTime() {
	var today = new Date(); //定义日期对象     
	var yyyy = today.getFullYear(); //通过日期对象的getFullYear()方法返回年      
	var MM = today.getMonth() + 1; //通过日期对象的getMonth()方法返回年      
	var dd = today.getDate(); //通过日期对象的getDate()方法返回年       
	var hh = today.getHours(); //通过日期对象的getHours方法返回小时     
	var mm = today.getMinutes(); //通过日期对象的getMinutes方法返回分钟     
	var ss = today.getSeconds(); //通过日期对象的getSeconds方法返回秒     
	// 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09     
	MM = checkTime(MM);
	dd = checkTime(dd);
	mm = checkTime(mm);
	ss = checkTime(ss);
	var day; //用于保存星期（getDay()方法得到星期编号）  
	if(today.getDay() == 0) day = "星期日 "
	if(today.getDay() == 1) day = "星期一 "
	if(today.getDay() == 2) day = "星期二 "
	if(today.getDay() == 3) day = "星期三 "
	if(today.getDay() == 4) day = "星期四 "
	if(today.getDay() == 5) day = "星期五 "
	if(today.getDay() == 6) day = "星期六 "
	document.getElementById('nowDateTimeSpan').innerHTML = yyyy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + "   " + day;
	setTimeout('startTime()', 1000); //每一秒中重新加载startTime()方法   
}

function checkTime(i) {
	if(i < 10) {
		i = "0" + i;
	}
	return i;
}