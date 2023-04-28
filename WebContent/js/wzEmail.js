function click1() {
			document.getElementById('compose').innerHTML = "<iframe src='compose.html'" + "style=' width: 100%;height:100%;'" + "></iframe>";
	}
function(){
			$('#box_frame>ul>li:first').find('.wrap').css({display: 'block'});
			$('#box_frame>ul>li').click(function() {
	        $(this).siblings('li').find('.wrap').css({display: 'none'});
	        $(this).find('.wrap').css({display: 'block'});
			})
		}