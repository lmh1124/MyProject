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
					             '<br><table class="tt1"><tr class="tr1"><td class="td1">����(Kcal)</td><td class="td1">�߷�(g/ml)</td>'+
					             '<td class="td1">�ܹ���(g)</td><td class="td1">��Ʈ��(mg)</td><td class="td1">���(g)</td><td class="td1">��ȭ����(g)</td>'+
					             '</tr><tr class="tr1"><td class="td1">${fvo.getKcal()}</td><td class="td1">1</td><td class="td1">1</td>'+
					             '<td class="td1">1</td><td class="td1">1</td><td class="td1">1</td></tr></table><br><div class="command0">�ٻ��� �������� �ż��� ��ä �׸��� ����� ��~ ġŲ��Ƽ�� �Ϻ��� ��ȭ!</div></div></div>';
				}
			});
		$(".fancybox3").fancybox({				
			padding : 0,
			beforeShow: function () {
				
				this.title = '<div class="dd1"><div class="dd2">'+ this.title +
				             '<br><table class="tt1"><tr class="tr1"><td class="td1">����(Kcal)</td><td class="td1">�߷�(g/ml)</td>'+
				             '<td class="td1">�ܹ���1(g)</td><td class="td1">��Ʈ��(mg)</td><td class="td1">���(g)</td><td class="td1">��ȭ����(g)</td>'+
				             
				             '</tr><tr class="tr1"><td class="td1">2</td><td class="td1">2</td><td class="td1">1</td>'+
				             '<td class="td1">1</td><td class="td1">2</td><td class="td1">2</td></tr></table><br><div class="command0">�ٻ��� �������� �ż��� ��ä �׸��� ����� ��~ ġŲ��Ƽ�� �Ϻ��� ��ȭ!</div></div></div>';

				
				
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
