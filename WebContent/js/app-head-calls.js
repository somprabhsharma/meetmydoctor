/*jshint jquery:true */
jQuery(document).ready(function(){
	"use strict";
	jQuery(window).scroll(function(){
		if (jQuery(this).scrollTop() > 100) {
			jQuery('.scrollup').fadeIn();
		} else {
			jQuery('.scrollup').fadeOut();
		}
	});

	jQuery('#back-to-top a').click(function(){
		jQuery("html, body").animate({ scrollTop: 0 }, 600);
		return false;
	});
 
});