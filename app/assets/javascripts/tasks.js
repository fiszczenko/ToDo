$(document).ready(function(){
	$(document).on("click", ".icon-remove", function(e){
		e.preventDefault();
		var $link = $(this).attr("href");
		$(this).attr("href","#");
		$(this).attr("class", "icon-ok");
		$.get($link);
		return false;
	});
});
