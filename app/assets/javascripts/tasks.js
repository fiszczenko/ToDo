$(document).ready(function(){
	$(".icon-remove").click(function(){
		var $link = $(this).attr("href");
		$(this).attr("class", "icon-ok");
		$(this).attr("href", "#");
		$.get($link)
		return false;
	});
});
