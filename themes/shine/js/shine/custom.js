
/*--------| UItoTop jQuery Plugin 1.1-------------------*/
(function($){
	$.fn.UItoTop = function(options) {

 		var defaults = {
			text: '',
			min: 200,
			inDelay:600,
			outDelay:400,
  			containerID: 'toTop',
			containerHoverID: 'toTopHover',
			scrollSpeed: 1200,
			easingType: 'linear'
 		};

 		var settings = $.extend(defaults, options);
		var containerIDhash = '#' + settings.containerID;
		var containerHoverIDHash = '#'+settings.containerHoverID;
		
		$('body').append('<a href="#" id="'+settings.containerID+'">'+settings.text+'</a>');
		$(containerIDhash).hide().click(function(){
			$('html, body').animate({scrollTop:0}, settings.scrollSpeed, settings.easingType);
			$('#'+settings.containerHoverID, this).stop().animate({'opacity': 0 }, settings.inDelay, settings.easingType);
			return false;
		})
		.prepend('<span id="'+settings.containerHoverID+'"></span>')
		.hover(function() {
				$(containerHoverIDHash, this).stop().animate({
					'opacity': 1
				}, 600, 'linear');
			}, function() { 
				$(containerHoverIDHash, this).stop().animate({
					'opacity': 0
				}, 700, 'linear');
			});
					
		$(window).scroll(function() {
			var sd = $(window).scrollTop();
			if(typeof document.body.style.maxHeight === "undefined") {
				$(containerIDhash).css({
					'position': 'absolute',
					'top': $(window).scrollTop() + $(window).height() - 50
				});
			}
			if ( sd > settings.min ) 
				$(containerIDhash).fadeIn(settings.inDelay);
			else 
				$(containerIDhash).fadeOut(settings.Outdelay);
		});

};
})(jQuery);
jQuery(window).load(function() {
  jQuery().UItoTop();
	});


$(document).ready(function(){
   
    
     jQuery('ul#nav').superfish({ 
                     delay:       600,                            
                     animation:{opacity:'show',height:'show'},  
                     speed:       '600',                          
                     autoArrows:  false,                          
                     dropShadows: false                            
             }); 
      jQuery('.search-icon a').click(function (){
             jQuery('.search-section').fadeIn('slow'); 
         })
    
          jQuery('.search-box .cross-icon img').click(function (){
             jQuery('.search-section').fadeOut('slow'); 
         })   
                    
             
  }); 
   jQuery(document).ready(function($){
        $(".pdt-nav .item-nav1").click(function(e) {
        $(".magik-pdt-content .pdt_best_sales").fadeIn();
        $(".magik-pdt-content .pdt_new_arrivals").fadeOut();
        $(this).addClass('tab-nav-actived');
        $('.pdt-nav .item-nav2').removeClass('tab-nav-actived');
        $('.magik-pdt-content .pdt_new_arrivals').removeClass('tab-content-actived');
        $(".magik-pdt-content .pdt_best_sales").addClass('tab-content-actived');
        
        e.preventDefault();
        });
        $(".pdt-nav .item-nav2").click(function(e) {
       $(".magik-pdt-content .pdt_best_sales").fadeOut();
        $(".magik-pdt-content .pdt_new_arrivals").fadeIn();
         $(this).addClass('tab-nav-actived');
        $('.pdt-nav .item-nav1').removeClass('tab-nav-actived');
        $('.magik-pdt-content .pdt_best_sales').removeClass('tab-content-actived');
        $(".magik-pdt-content .pdt_new_arrivals").addClass('tab-content-actived');
        $(".magik-producttabs .magik-pdt-content .pdt-content .play .item-animate").css('opacity: 1;');
       
        e.preventDefault(); });
        })