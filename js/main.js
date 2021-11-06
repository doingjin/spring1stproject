;(function () {
	
	'use strict';



	var isMobile = {
		Android: function() {
			return navigator.userAgent.match(/Android/i);
		},
			BlackBerry: function() {
			return navigator.userAgent.match(/BlackBerry/i);
		},
			iOS: function() {
			return navigator.userAgent.match(/iPhone|iPad|iPod/i);
		},
			Opera: function() {
			return navigator.userAgent.match(/Opera Mini/i);
		},
			Windows: function() {
			return navigator.userAgent.match(/IEMobile/i);
		},
			any: function() {
			return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
		}
	};

	var fullHeight = function() {

		// if ( !isMobile.any() ) {
			$('.js-fullheight').css('height', $(window).height());
			$(window).resize(function(){
				$('.js-fullheight').css('height', $(window).height());
			});
		// }

	};

	var parallax = function() {
		$(window).stellar({
			horizontalScrolling: false,
			hideDistantElements: false, 
			responsive: true

		});
	};

	var testimonialCarousel = function(){
		var owl = $('.owl-carousel-fullwidth');
		owl.owlCarousel({
			items: 1,
		    loop: true,
		    margin: 0,
		    responsiveClass: true,
		    nav: false,
		    dots: true,
		    smartSpeed: 500,
		    autoHeight: true
		});
	};


	// Animations

	var contentWayPoint = function() {
		var i = 0;
		$('.animate-box').waypoint( function( direction ) {

			if( direction === 'down' && !$(this.element).hasClass('animated') ) {
				
				i++;

				$(this.element).addClass('item-animate');
				setTimeout(function(){

					$('body .animate-box.item-animate').each(function(k){
						var el = $(this);
						setTimeout( function () {
							var effect = el.data('animate-effect');
							if ( effect === 'fadeIn') {
								el.addClass('fadeIn animated');
							} else if ( effect === 'fadeInLeft') {
								el.addClass('fadeInLeft animated');
							} else if ( effect === 'fadeInRight') {
								el.addClass('fadeInRight animated');
							} else {
								el.addClass('fadeInUp animated');
							}

							el.removeClass('item-animate');
						},  k * 200, 'easeInOutExpo' );
					});
					
				}, 100);
				
			}

		} , { offset: '85%' } );
	};

	var counter = function() {
		$('.js-counter').countTo({
			 formatter: function (value, options) {
	      return value.toFixed(options.decimals);
	    },
		});
	};

	var counterWayPoint = function() {
		if ($('#counter-animate').length > 0 ) {
			$('#counter-animate').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this.element).hasClass('animated') ) {
					setTimeout( counter , 400);					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '90%' } );
		}
	};

	var burgerMenu = function() {

		$('.js-fh5co-nav-toggle').on('click', function(event){
			event.preventDefault();
			var $this = $(this);

			if ($('body').hasClass('offcanvas')) {
				$this.removeClass('active');
				$('body').removeClass('offcanvas');	
			} else {
				$this.addClass('active');
				$('body').addClass('offcanvas');	
			}
		});



	};

	// Click outside of offcanvass
	var mobileMenuOutsideClick = function() {

		$(document).click(function (e) {
	    var container = $("#fh5co-aside, .js-fh5co-nav-toggle");
	    if (!container.is(e.target) && container.has(e.target).length === 0) {

	    	if ( $('body').hasClass('offcanvas') ) {

    			$('body').removeClass('offcanvas');
    			$('.js-fh5co-nav-toggle').removeClass('active');
			
	    	}
	    	
	    }
		});

		$(window).scroll(function(){
			if ( $('body').hasClass('offcanvas') ) {

    			$('body').removeClass('offcanvas');
    			$('.js-fh5co-nav-toggle').removeClass('active');
			
	    	}
		});

	};

	// Document on load.
	$(function(){
		fullHeight();
		parallax();
		testimonialCarousel();
		contentWayPoint();
		counterWayPoint();
		burgerMenu();
		mobileMenuOutsideClick();
	});


}());

// 여기서부터 내가 만든 JS

// 로그아웃 확인하기
function logout(){
	var res=confirm("Do you really want to log out?");
	//console.log(res);
	if (res==true) {
		  location.href="logout.do";
	} else {
		return false;
	}
}
// 회원 탈퇴 확인하기
function quitM(id){
	console.log(id);
	var res=confirm("Do you really want to quit?");
	//console.log(res);
	if (res==true) {
		  location.href="quit.do?mid="+id;
	} else {
		return false;
	}
}
// 게시물 삭제 확인하기
function deletep(pno){
	console.log("${data.pno}"+ pno);
	//console.log("${mid}"+mid);
	var res=confirm("Do you really want to delete?");
	if (res==true) {
		  location.href="delete.do?pno="+pno;
	} else {
		return false;
	}
}
// 로그인 되어있는지 확인
/*function insert(mem){
	console.log("확"+mem);
	if(mem!=null){
		location.href="insert.jsp";
	} else{
		location.href="login.jsp";
	}
}
function mypage(mem){
	console.log("인"+mem);
	if(mem==null){
		location.href="login.jsp";
	} else{
		location.href="mypage.jsp";
	}
}*/


/*function resize(img){
	  // 원본 이미지 사이즈 저장
	   var width = img.width;
	   var height = img.height;

	   console.log(width);
	   console.log(height);
	   console.log(width!=height);
	   


	   // 가로랑 세로 사이즈가 다르면 실행  
	   if(width != height){
		   resizeHeight = width;
	   }

	 

	   // 리사이즈한 크기로 이미지 크기 다시 지정
	   img.height = resizeHeight;
}*/

/*window.onload = function() {
	  var divs = document.querySelectorAll('.row > .work-item');
	  for (var i = 0; i < divs.length; ++i) {
	    var div = divs[i];
	    var divAspect = 100 / 100;
	    div.style.overflow = 'hidden';
	    
	    var img = div.querySelector('img');
	    var imgAspect = img.height / img.width;
	    console.log(i+", 가로"+img.width);
	    console.log("세로"+img.height);
	    
	    
	    if (imgAspect <= divAspect) {
	    	console.log("i<d");
	      // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
	      var imgWidthActual = div.offsetHeight / imgAspect;
	      var imgWidthToBe = div.offsetHeight / divAspect;
	      var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
	      img.style.cssText = 'width: auto; height: 100%; margin-left: '
	                      + marginLeft + 'px;'
	    } else {
	    	console.log("i>d");
	      // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
	      img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
	    }
	    console.log("수정"+i+", 가로"+img.width);
	    console.log("세로"+img.height);
	  }
}*/