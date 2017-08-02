jQuery(function($){

var BRUSHED = window.BRUSHED || {};

/* ==================================================
   Slider Options
================================================== */

BRUSHED.slider = function(){
	$.supersized({
		// Functionality
		slideshow               :   1,			// Slideshow on/off
		autoplay				:	1,			// Slideshow starts playing automatically
		start_slide             :   1,			// Start slide (0 is random)
		stop_loop				:	0,			// Pauses slideshow on last slide
		random					: 	0,			// Randomize slide order (Ignores start slide)
		slide_interval          :   12000,		// Length between transitions
		transition              :   1, 			// 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
		transition_speed		:	300,		// Speed of transition
		new_window				:	1,			// Image links open in new window/tab
		pause_hover             :   0,			// Pause slideshow on hover
		keyboard_nav            :   1,			// Keyboard navigation on/off
		performance				:	1,			// 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)
		image_protect			:	1,			// Disables image dragging and right click with Javascript
												   
		// Size & Position						   
		min_width		        :   0,			// Min width allowed (in pixels)
		min_height		        :   0,			// Min height allowed (in pixels)
		vertical_center         :   1,			// Vertically center background
		horizontal_center       :   1,			// Horizontally center background
		fit_always				:	0,			// Image will never exceed browser width or height (Ignores min. dimensions)
		fit_portrait         	:   1,			// Portrait images will not exceed browser height
		fit_landscape			:   0,			// Landscape images will not exceed browser width
												   
		// Components							
		slide_links				:	'blank',	// Individual links for each slide (Options: false, 'num', 'name', 'blank')
		thumb_links				:	0,			// Individual thumb links for each slide
		thumbnail_navigation    :   0,			// Thumbnail navigation
		slides 					:  	[			// Slideshow Images
											{image : 'http://localhost:9000/projectH/img/slider-images/image01.jpg', title : '<div class="slide-content">HamburgerStore</div>', thumb : '', url : ''},
											{image : 'http://localhost:9000/projectH/img/slider-images/image02.jpg', title : '<div class="slide-content">HamburgerStore</div>', thumb : '', url : ''},
											{image : 'http://localhost:9000/projectH/img/slider-images/image03.jpg', title : '<div class="slide-content">HamburgerStore</div>', thumb : '', url : ''},
											{image : 'http://localhost:9000/projectH/img/slider-images/image04.jpg', title : '<div class="slide-content">HamburgerStore</div>', thumb : '', url : ''}  
									],
									
		// Theme Options			   
		progress_bar			:	0,			// Timer for each slide							
		mouse_scrub				:	0
		
	});

}


/* ==================================================
   Navigation Fix
================================================== */

BRUSHED.nav = function(){
	$('.sticky-nav').waypoint('sticky');
}


/* ==================================================
   Filter Works
================================================== */

BRUSHED.filter = function (){
	if($('#projects').length > 0){		
		var $container = $('#projects');
		
		$container.imagesLoaded(function() {
			$container.isotope({
			  // options
			  animationEngine: 'best-available',
			  itemSelector : '.item-thumbs',
			  layoutMode : 'fitRows'
			});
		});
	
		
		// filter items when filter link is clicked
		var $optionSets = $('#options .option-set'),
			$optionLinks = $optionSets.find('a');
	
		  $optionLinks.click(function(){
			var $this = $(this);
			// don't proceed if already selected
			if ( $this.hasClass('selected') ) {
			  return false;
			}
			var $optionSet = $this.parents('.option-set');
			$optionSet.find('.selected').removeClass('selected');
			$this.addClass('selected');
	  
			// make option object dynamically, i.e. { filter: '.my-filter-class' }
			var options = {},
				key = $optionSet.attr('data-option-key'),
				value = $this.attr('data-option-value');
			// parse 'false' as false boolean
			value = value === 'false' ? false : value;
			options[ key ] = value;
			if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
			  // changes in layout modes need extra logic
			  changeLayoutMode( $this, options )
			} else {
			  // otherwise, apply new options
			  $container.isotope( options );
			}
			
			return false;
		});
	}
}


/* ==================================================
   FancyBox
================================================== */

BRUSHED.fancyBox = function(){
}

BRUSHED.fancyBox2 = function(){
	if($('.fancybox2').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
		
		$(".fancybox2").fancybox({				
				padding : 0,
				beforeShow: function () {
					
					this.title = '<div class="dd1"><div class="dd2">'+ this.title +
					             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
					             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
					             '</tr><tr class="tr1"><td class="td1">642</td>'+
					             '<td class="td1">269</td><td class="td1">28</td>'+
					             '<td class="td1">1217</td><td class="td1">3</td>'+
					             '<td class="td1">6</td></tr></table><br><div class="command0">바삭한 베이컨과 신선한 야채 그리고 담백한 롱~ 치킨패티의 완벽한 조화!</div></div></div>';
				}
			});
	 
			
	}
}
BRUSHED.fancyBox3 = function(){
if($('.fancybox3').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
		
		$(".fancybox3").fancybox({				
				padding : 0,
				beforeShow: function () {
					
					this.title = '<div class="dd1"><div class="dd2">'+ this.title +
		             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
		             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
		             '</tr><tr class="tr1"><td class="td1">740</td>'+
		             '<td class="td1">279</td><td class="td1">22</td>'+
		             '<td class="td1">1050</td><td class="td1">5</td>'+
		             '<td class="td1">5</td></tr></table><br>'+
		             '<div class="command0">매콤한 치킨, 바삭한 옥수수, 그리고 신선한 토마토와<br> 아삭한 피클까지!</div></div></div>';

					
					
				},
				helpers : {
				
				}
			});
			
		$('.fancybox-media').fancybox({
			openEffect  : 'none',
			closeEffect : 'none',
			helpers : {
				media : {}
			}
		});
	}
}
BRUSHED.fancyBox4 = function(){
	if($('.fancybox4').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox4").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">731</td>'+
			             '<td class="td1">225</td><td class="td1">22</td>'+
			             '<td class="td1">1049</td><td class="td1">3</td>'+
			             '<td class="td1">5</td></tr></table><br>'+
			             '<div class="command0">매콤한 치킨과 바삭한 옥수수의 조화, 크런치치킨!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox5 = function(){
	if($('.fancybox5').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox5").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">741</td>'+
			             '<td class="td1">328</td><td class="td1">34</td>'+
			             '<td class="td1">989</td><td class="td1">5</td>'+
			             '<td class="td1">15</td></tr></table><br>'+
			             '<div class="command0">적화 방식으로 구운 100% 순쇠고기 패티에 갈릭페퍼<br> 통새우와 스파이시토마토소스가 더해진 프리미엄 버거</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox6 = function(){
	if($('.fancybox6').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox6").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">839</td>'+
			             '<td class="td1">348</td><td class="td1">37</td>'+
			             '<td class="td1">1437</td><td class="td1">5</td>'+
			             '<td class="td1">19</td></tr></table><br>'+
			             '<div class="command0">적화 방식으로 구운 100% 순쇠고기 패티에 갈릭페퍼<br> 통새우와 스파이시토마토소스가 더해진 프리미엄 버거</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox7 = function(){
	if($('.fancybox7').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox7").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">545</td>'+
			             '<td class="td1">230</td><td class="td1">24</td>'+
			             '<td class="td1">983</td><td class="td1">9</td>'+
			             '<td class="td1">9</td></tr></table><br>'+
			             '<div class="command0">100% 순쇠고기 패티가 두장! 달콤 상큼한 스위트<br> 사우전드 소스의 완벽한 조화</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox8 = function(){
	if($('.fancybox8').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox8").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">716</td>'+
			             '<td class="td1">303</td><td class="td1">33</td>'+
			             '<td class="td1">1288</td><td class="td1">7</td>'+
			             '<td class="td1">16</td></tr></table><br>'+
			             '<div class="command0">불에 직접 구운 순 쇠고기 패티가 들어간 <br>와퍼에 고소한 치즈까지!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox9 = function(){
	if($('.fancybox9').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox9").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">619</td>'+
			             '<td class="td1">278</td><td class="td1">29</td>'+
			             '<td class="td1">809</td><td class="td1">11</td>'+
			             '<td class="td1">13</td></tr></table><br>'+
			             '<div class="command0">불에 직접 구운 순 쇠고기 패티에 싱상한 야채가<br> 한가득~ HBGS의 대표 메뉴!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox10 = function(){
	if($('.fancybox10').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox10").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">682</td>'+
			             '<td class="td1">278</td><td class="td1">28</td>'+
			             '<td class="td1">912</td><td class="td1">6</td>'+
			             '<td class="td1">14</td></tr></table><br>'+
			             '<div class="command0">불에 직접 구운 순 쇠고기 패티가 들어간 와퍼에<br> 달콤한 불고기 소스까지!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox11 = function(){
	if($('.fancybox11').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox11").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">619</td>'+
			             '<td class="td1">278</td><td class="td1">29</td>'+
			             '<td class="td1">809</td><td class="td1">11</td>'+
			             '<td class="td1">13</td></tr></table><br>'+
			             '<div class="command0">부드러운 국내산 붉은 대게살 패티와 100% <br>순쇠고기 패티,올드베이 베이스 시즈닝이 <br>가미된 타르타르 소스까지!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox12 = function(){
	if($('.fancybox12').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox12").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">769</td>'+
			             '<td class="td1">309</td><td class="td1">40</td>'+
			             '<td class="td1">1051</td><td class="td1">6</td>'+
			             '<td class="td1">20</td></tr></table><br>'+
			             '<div class="command0">진짜 불맛을 즐겨라, 4가지 고퓸격 치즈와 <br>불에 직접 구운 와퍼 패티의 만남!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox13 = function(){
	if($('.fancybox13').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox13").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">619</td>'+
			             '<td class="td1">278</td><td class="td1">29</td>'+
			             '<td class="td1">809</td><td class="td1">11</td>'+
			             '<td class="td1">13</td></tr></table><br>'+
			             '<div class="command0">불에 직접 구운 순 쇠고기 패티가 들어간 <br>와퍼의 주니어 버전~ 작지만 꽉 찼다!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox14 = function(){
	if($('.fancybox14').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox14").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">302</td>'+
			             '<td class="td1">84</td><td class="td1">13</td>'+
			             '<td class="td1">338</td><td class="td1">1</td>'+
			             '<td class="td1">4</td></tr></table><br>'+
			             '<div class="command0">갈릭의 풍부한 향과 달콤한 소스의 만남!<br>더욱 고소하고 바삭한 쉬림프 치킨 프라이</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox15 = function(){
	if($('.fancybox15').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox15").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">232</td>'+
			             '<td class="td1">84</td><td class="td1">16</td>'+
			             '<td class="td1">357</td><td class="td1">1</td>'+
			             '<td class="td1">4</td></tr></table><br>'+
			             '<div class="command0">어니언과 갈릭의 향긋한 풍미의 치킨프라이!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox16 = function(){
	if($('.fancybox16').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox16").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">332</td>'+
			             '<td class="td1">91</td><td class="td1">5</td>'+
			             '<td class="td1">476</td><td class="td1">3</td>'+
			             '<td class="td1">3</td></tr></table><br>'+
			             '<div class="command0">오직 HBGS에서만 즐길 수 있다! 어니언의 맛있는 변신!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox17 = function(){
	if($('.fancybox17').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox17").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">347</td>'+
			             '<td class="td1">195</td><td class="td1">14</td>'+
			             '<td class="td1">723</td><td class="td1">1</td>'+
			             '<td class="td1">5</td></tr></table><br>'+
			             '<div class="command0">바삭~ 촉촉 한입에 쏙 부드러운 너겟킹!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox18 = function(){
	if($('.fancybox18').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox18").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">117</td><td class="td1">8</td>'+
			             '<td class="td1">434</td><td class="td1">1</td>'+
			             '<td class="td1">3</td></tr></table><br>'+
			             '<div class="command0">바삭~ 촉촉 한입에 쏙 부드러운 너겟킹!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox19 = function(){
	if($('.fancybox19').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox19").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">139</td>'+
			             '<td class="td1">78</td><td class="td1">6</td>'+
			             '<td class="td1">289</td><td class="td1">1</td>'+
			             '<td class="td1">2</td></tr></table><br>'+
			             '<div class="command0">바삭~ 촉촉 한입에 쏙 부드러운 너겟킹!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox20 = function(){
	if($('.fancybox20').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox20").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">285</td>'+
			             '<td class="td1">102</td><td class="td1">4</td>'+
			             '<td class="td1">326</td><td class="td1">1</td>'+
			             '<td class="td1">3</td></tr></table><br>'+
			             '<div class="command0">HBGS만의 특제 기름을 통해 만든 바삭한 감자튀김!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox21 = function(){
	if($('.fancybox21').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox21").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
			             '</tr><tr class="tr1"><td class="td1">424</td>'+
			             '<td class="td1">153</td><td class="td1">8</td>'+
			             '<td class="td1">624</td><td class="td1">2</td>'+
			             '<td class="td1">6</td></tr></table><br>'+
			             '<div class="command0">HBGS만의 특제 기름을 통해 만든 바삭한 감자튀김!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox22 = function(){
	if($('.fancybox22').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox22").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">달콤한 초코, 따듯하게 즐겨요!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox23 = function(){
	if($('.fancybox23').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox23").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">HBGS 특제 카페라떼, 좋아요!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox24 = function(){
	if($('.fancybox24').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox24").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">HBGS 특제 카페라떼, 좋아요!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox25 = function(){
	if($('.fancybox25').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox25").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">HBGS 특제 아메리카노, 좋아요!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox26 = function(){
	if($('.fancybox26').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox26").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">HBGS 특제 아메리카노, 좋아요!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox27 = function(){
	if($('.fancybox27').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox27").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">코카 콜라로 더 짜릿하게!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox28 = function(){
	if($('.fancybox28').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox28").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">코카 콜라로 더 짜릿하게!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox29 = function(){
	if($('.fancybox29').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox29").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">100% 짜릿함, 칼로리는 제로!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox30 = function(){
	if($('.fancybox30').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox30").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">100% 짜릿함, 칼로리는 제로!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox31 = function(){
	if($('.fancybox31').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox31").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">나를 깨우는 상쾌함!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox32 = function(){
	if($('.fancybox32').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox32").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">나를 깨우는 상쾌함!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
BRUSHED.fancyBox33 = function(){
	if($('.fancybox33').length > 0 || $('.fancybox-media').length > 0 || $('.fancybox-various').length > 0){
			
			$(".fancybox33").fancybox({				
					padding : 0,
					beforeShow: function () {
						
						this.title = '<div class="dd1"><div class="dd2">'+ this.title +
			             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
			             '<td class="td1">단백질(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td><td class="td1">카페인</td>'+
			             '</tr><tr class="tr1"><td class="td1">210</td>'+
			             '<td class="td1">227</td><td class="td1">2</td>'+
			             '<td class="td1">86</td><td class="td1">23</td>'+
			             '<td class="td1">4</td><td class="td1">0</td></tr></table><br>'+
			             '<div class="command0">오렌지맛 탄산의 상쾌함!</div></div></div>';

						
						
					},
					helpers : {
					
					}
				});
				
			$('.fancybox-media').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',
				helpers : {
					media : {}
				}
			});
		}
	}
/* ==================================================
   Contact Form
================================================== */

BRUSHED.contactForm = function(){
	$("#contact-submit").on('click',function() {
		$contact_form = $('#contact-form');
		
		var fields = $contact_form.serialize();
		
		$.ajax({
			type: "POST",
			url: "_include/php/contact.php",
			data: fields,
			dataType: 'json',
			success: function(response) {
				
				if(response.status){
					$('#contact-form input').val('');
					$('#contact-form textarea').val('');
				}
				
				$('#response').empty().html(response.html);
			}
		});
		return false;
	});
}


/* ==================================================
   Twitter Feed
================================================== */

BRUSHED.tweetFeed = function(){
	
	var valueTop = -64; // Margin Top Value
	
    $("#ticker").tweet({
          modpath: '_include/js/twitter/',
          username: "Bluxart", // Change this with YOUR ID
          page: 1,
          avatar_size: 0,
          count: 10,
		  template: "{text}{time}",
		  filter: function(t){ return ! /^@\w+/.test(t.tweet_raw_text); },
          loading_text: "loading ..."
	}).bind("loaded", function() {
	  var ul = $(this).find(".tweet_list");
	  var ticker = function() {
		setTimeout(function() {
			ul.find('li:first').animate( {marginTop: valueTop + 'px'}, 500, 'linear', function() {
				$(this).detach().appendTo(ul).removeAttr('style');
			});	
		  ticker();
		}, 5000);
	  };
	  ticker();
	});
	
}


/* ==================================================
   Menu Highlight
================================================== */

BRUSHED.menu = function(){
	$('#menu-nav, #menu-nav-mobile').onePageNav({
		currentClass: 'current',
    	changeHash: false,
    	scrollSpeed: 750,
    	scrollOffset: 30,
    	scrollThreshold: 0.5,
		easing: 'easeOutExpo',
		filter: ':not(.external)'
	});
}

/* ==================================================
   Next Section
================================================== */

BRUSHED.goSection = function(){
	$('#nextsection').on('click', function(){
		$target = $($(this).attr('href')).offset().top-30;
		
		$('body, html').animate({scrollTop : $target}, 750, 'easeOutExpo');
		return false;
	});
}

/* ==================================================
   GoUp
================================================== */

BRUSHED.goUp = function(){
	$('#goUp').on('click', function(){
		$target = $($(this).attr('href')).offset().top-30;
		
		$('body, html').animate({scrollTop : $target}, 750, 'easeOutExpo');
		return false;
	});
}


/* ==================================================
	Scroll to Top
================================================== */

BRUSHED.scrollToTop = function(){
	var windowWidth = $(window).width(),
		didScroll = false;

	var $arrow = $('#back-to-top');

	$arrow.click(function(e) {
		$('body,html').animate({ scrollTop: "0" }, 750, 'easeOutExpo' );
		e.preventDefault();
	})

	$(window).scroll(function() {
		didScroll = true;
	});

	setInterval(function() {
		if( didScroll ) {
			didScroll = false;

			if( $(window).scrollTop() > 1000 ) {
				$arrow.css('display', 'block');
			} else {
				$arrow.css('display', 'none');
			}
		}
	}, 250);
}

/* ==================================================
   Thumbs / Social Effects
================================================== */

BRUSHED.utils = function(){
	
	$('.item-thumbs').bind('touchstart', function(){
		$(".active").removeClass("active");
      	$(this).addClass('active');
    });
	
	$('.image-wrap').bind('touchstart', function(){
		$(".active").removeClass("active");
      	$(this).addClass('active');
    });
	
	$('#social ul li').bind('touchstart', function(){
		$(".active").removeClass("active");
      	$(this).addClass('active');
    });
	
}

/* ==================================================
   Accordion
================================================== */

BRUSHED.accordion = function(){
	var accordion_trigger = $('.accordion-heading.accordionize');
	
	accordion_trigger.delegate('.accordion-toggle','click', function(event){
		if($(this).hasClass('active')){
			$(this).removeClass('active');
		   	$(this).addClass('inactive');
		}
		else{
		  	accordion_trigger.find('.active').addClass('inactive');          
		  	accordion_trigger.find('.active').removeClass('active');   
		  	$(this).removeClass('inactive');
		  	$(this).addClass('active');
	 	}
		event.preventDefault();
	});
}

/* ==================================================
   Toggle
================================================== */

BRUSHED.toggle = function(){
	var accordion_trigger_toggle = $('.accordion-heading.togglize');
	
	accordion_trigger_toggle.delegate('.accordion-toggle','click', function(event){
		if($(this).hasClass('active')){
			$(this).removeClass('active');
		   	$(this).addClass('inactive');
		}
		else{
		  	$(this).removeClass('inactive');
		  	$(this).addClass('active');
	 	}
		event.preventDefault();
	});
}

/* ==================================================
   Tooltip
================================================== */

BRUSHED.toolTip = function(){ 
    $('a[data-toggle=tooltip]').tooltip();
}


/* ==================================================
	Init
================================================== */

BRUSHED.slider();

$(document).ready(function(){
	
	
	// Preload the page with jPreLoader
	$('body').jpreLoader({
		splashID: "#jSplash",
		showSplash: true,
		showPercentage: true,
		autoClose: true,
		splashFunction: function() {
			$('#circle').delay(250).animate({'opacity' : 1}, 500, 'linear');
		}
	});
	
	
	BRUSHED.nav();
	BRUSHED.menu();
	BRUSHED.goSection();
	BRUSHED.goUp();
	BRUSHED.filter();
	
	
	BRUSHED.fancyBox2();
	BRUSHED.fancyBox3();
	BRUSHED.fancyBox4();
	BRUSHED.fancyBox5();
	BRUSHED.fancyBox6();
	BRUSHED.fancyBox7();
	BRUSHED.fancyBox8();
	BRUSHED.fancyBox9();
	BRUSHED.fancyBox10();
	
	
	
	
	
	BRUSHED.fancyBox11();
	BRUSHED.fancyBox12();
	BRUSHED.fancyBox13();
	BRUSHED.fancyBox14();
	BRUSHED.fancyBox15();
	BRUSHED.fancyBox16();
	BRUSHED.fancyBox17();
	BRUSHED.fancyBox18();
	BRUSHED.fancyBox19();
	BRUSHED.fancyBox20();
	
	
	
	
	BRUSHED.fancyBox21();
	BRUSHED.fancyBox22();
	BRUSHED.fancyBox23();
	BRUSHED.fancyBox24();
	BRUSHED.fancyBox25();
	BRUSHED.fancyBox26();
	BRUSHED.fancyBox27();
	BRUSHED.fancyBox28();
	BRUSHED.fancyBox29();
	BRUSHED.fancyBox30();
	
	BRUSHED.fancyBox31();
	BRUSHED.fancyBox32();
	BRUSHED.fancyBox33();
	
	BRUSHED.contactForm();
	BRUSHED.tweetFeed();
	BRUSHED.scrollToTop();
	BRUSHED.utils();
	BRUSHED.accordion();
	BRUSHED.toggle();
	BRUSHED.toolTip();
});

});
