$(document).ready(function() {
	var check = true;
	var check2 = true;

	$("#hamburger").click(function() {
		if (check) {
			$(this).attr("src","icons/cross.svg");
			$("nav").addClass("open");
			$("main").addClass("open-menu");
			check = false;
		} else {
			$(this).attr("src","icons/hamburger.svg");
			$("nav").removeClass("open");
			$("main").removeClass("open-menu");
			check = true;
		}
	});

	$("#notifications").click(function() {
		if (check2) {
			$("#action-menu").addClass("actions-open");
			$('#triangle')
			  	.delay(750)
			  	.queue(function (next) { 
			    	$(this).css('visibility', 'visible'); 
			   		next(); 
			});
			check2 = false;
		} else {
			$("#triangle").css({
				visibility: "hidden"
			});
			$("#action-menu").removeClass("actions-open");
			check2 = true;
		}
	});

});