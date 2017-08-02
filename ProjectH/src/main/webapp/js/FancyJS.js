jQuery(function($){


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
					             '</tr><tr class="tr1"><td class="td1">${fvo.getKcal()}</td><td class="td1">1</td><td class="td1">1</td>'+
					             '<td class="td1">1</td><td class="td1">1</td><td class="td1">1</td></tr></table><br><div class="command0">바삭한 베이컨과 신선한 야채 그리고 담백한 롱~ 치킨패티의 완벽한 조화!</div></div></div>';
				}
			});
		$(".fancybox3").fancybox({				
			padding : 0,
			beforeShow: function () {
				
				this.title = '<div class="dd1"><div class="dd2">'+ this.title +
				             '<br><table class="tt1"><tr class="tr1"><td class="td1">열량(Kcal)</td><td class="td1">중량(g/ml)</td>'+
				             '<td class="td1">단백질1(g)</td><td class="td1">나트륨(mg)</td><td class="td1">당류(g)</td><td class="td1">포화지방(g)</td>'+
				             
				             '</tr><tr class="tr1"><td class="td1">2</td><td class="td1">2</td><td class="td1">1</td>'+
				             '<td class="td1">1</td><td class="td1">2</td><td class="td1">2</td></tr></table><br><div class="command0">바삭한 베이컨과 신선한 야채 그리고 담백한 롱~ 치킨패티의 완벽한 조화!</div></div></div>';

				
				
			},
			helpers : {
			
			}
		});
			
	}
}


$(document).ready(function(){
	
	BRUSHED.fancyBox2();
	BRUSHED.fancyBox3();

});

});
