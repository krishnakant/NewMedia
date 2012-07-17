(function($) {
	var rgbRE = /^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/;
	var colorRE = /^[a-fA-F0-9]{6}|[a-fA-F0-9]{3}$/;
	
	function mouseEnterColor(event){
		var rgbString = $(event.target).css("background-color");
		var parts = rgbString.match(rgbRE);
		if(parts!=null){
			delete (parts[0]);
			for (var i = 1; i <= 3; ++i) {
			    parts[i] = parseInt(parts[i]).toString(16);
			    if (parts[i].length == 1) parts[i] = '0' + parts[i];
			}
			var hexString = parts.join(''); 
			$("#SelColTxt").val(hexString).keyup();
		}else{
			$("#SelColTxt").val(rgbString.substring(1)).keyup();		
		}
	}
	
	function mouseClickColor(){
		colorSave();
	}
	
	function textKeyUp(event){
		color = $(event.target).val();
		if (color.match(colorRE)) {
			colorChange(color)
		}
		if (event.keyCode == 13) {//enter
			colorSave()
		}
	}
	
	function colorChange(color){
		$("#SelColDiv").css("background-color", "#"+color);
	}
	
	function colorSave(){
		if ($("#EventsCp").data("CpOnChange")) {
			color = $("#SelColTxt").val();
			if (color.match(colorRE)) {
				$("#EventsCp").data("CpOnChange")(color);
				close()
			}
		}
	}
	
	function close(){
		$("#EventsCp").hide().removeData("CpOnChange");
	}
	
	function createColorPicker(){
		var colors = ["#000000","#7F7F7F","#880015","#ED1C24","#FF7F27","#FFF200","#22B14C","#00A2E8","#3F48CC","#A349A4","#FFFFFF","#C3C3C3","#B97A57","#FFAEC9","#FFC90E","#EFE4B0","#B5E61D","#99D9EA","#7092BE","#C8BFE7"];
		
		$("body").append(('<div style="position:absolute;" id="EventsCp"><div id="EventsClrs"></div><input id="SelColTxt" type="text" maxlength="6"><div id="SelColDiv"></div></div>'))
		var colorHolder=$("#EventsClrs")
		$.each(colors, function(i, color){
			colorHolder.append('<div class="EventsClr" style="background-color:' + color + '" />')
		});
		$('.EventsClr').bind("mouseenter", mouseEnterColor).click(mouseClickColor);
		$("#SelColTxt").keyup(textKeyUp);
		$("#EventsCp").hide()
        $(document).bind('click', function(e){ 
            $("#EventsCp").hide();
        }); 
		$('#EventsCp,#EventsCp *').click(function(e){e.stopPropagation()})
	}
	
	$.fn.EventsCp = function(settings) {
		var config = {
			'onChange': function(value){}
		};
		
		if($("#EventsCp").length==0){
			createColorPicker()
		}

		if (settings) $.extend(config, settings);
	 
		this.each(function() {
			$(this).click(function(event){
				$("#EventsCp").hide()
								   .css("top", event.pageY)
								   .css("left", event.pageX)
								   .show("slow")
								   .data("CpOnChange", config["onChange"]);
			});
		});
		return this;
	};
})(jQuery);
 