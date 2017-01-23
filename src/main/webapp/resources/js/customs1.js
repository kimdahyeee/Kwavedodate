/* Theme Name: KWAVE D Web Service
 * Author: Choi Hong Hee(Adler)
 * Author URI: http://kwavedonate.com
 * Author e-mail: vvshinevv@naver.com
 * Created: Jan 2017
 * File Description: Custom scripts
 */
$(document).ready(function() {
	/* swiper */
    var swiper = new Swiper('.swiper-container', {
    	initialSlide: 2,
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 1,
        centeredSlides: true,
        paginationClickable: true,
        spaceBetween: 10,
        breakpoints: {
        	320: {
        		slidesPerView: 1, 
        		spaceBetween: 10
        	},
        	480: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
        	640: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
        	767: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
        	991: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
        	1199: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
            1280: {
                slidesPerView: 2,
                spaceBetween: 20
            },

        	1320: {
        		slidesPerView: 2,
        		spaceBetween: 20
        	},
        	1640: {
				slidesPerView: 2,
        		spaceBetween: 20
        	},
        	2000: {
        		slidesPerView: 3,
        		spaceBetween: 30
        	},
        	3000: {
				slidesPerView: 3,
        		spaceBetween: 30
        	},
        	4000: {
				slidesPerView: 3,
        		spaceBetween: 30
        	},
        	6000: {
        		slidesPerView: 5,
        		spaceBetween: 30
        	}
        }
    });
});
