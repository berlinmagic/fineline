$().ready(function() {
		
		$('.on_off_schalter.an').live('mouseover mouseout', function(event) {
			if (event.type == 'mouseover') {
				$(this).css("-webkit-box-shadow", "0px 0px 10px #2e6fa5");
				$(this).stop().animate({backgroundPosition: '-76px 0px'},300);
			} else {
				$(this).css("-webkit-box-shadow", "none");
				$(this).stop().animate({backgroundPosition: '0px 0px'},200);
			}
		});
		$(".on_off_schalter.an").live('click', function(event){
				event.preventDefault();
				$(this).prev("input[type=hidden]").val("0");
				$(this).removeClass('an');
				$(this).addClass('aus');
				$(this).css("-webkit-box-shadow", "none");
				$(this).css("background-position", "-76px 0px");
			});
		$('.on_off_schalter.aus').live('mouseover mouseout', function(event) {
			if (event.type == 'mouseover') {
				$(this).css("-webkit-box-shadow", "0px 0px 10px #2e6fa5");
				$(this).stop().animate({backgroundPosition: '0px 0px'},300);
			} else {
				$(this).css("-webkit-box-shadow", "none");
				$(this).stop().animate({backgroundPosition: '-76px 0px'},200);
			}
		});
		$(".on_off_schalter.aus").live('click', function(event){
				event.preventDefault();
				$(this).prev("input[type=hidden]").val("1");
				$(this).removeClass('aus');
				$(this).addClass('an');
				$(this).delay('500').css("-webkit-box-shadow", "none");
				$(this).css("background-position", "0px 0px");
			});
		
		$('#login_help').click(function(){
			$('#login_help').hide();
			$('#login_help_links').show();
		});
		
		$('div.flash').delay(9000).slideUp(700);
		
		/*$(".tolltips").tooltip();
		
		$('#right2 a').tooltip({ showURL: false, positionLeft: true });
		
		$(".tolltips_del").tooltip({ layout: "<div class='del_link'><span/></div>"});
		
		$(".tolltips_edit").tooltip({ layout: "<div class='edit_link'><span/></div>"}); */
		
		$('.tooltip').tooltip({ showURL: false, positionLeft: true, top: -45, left: 8, track: true  });
		$('.tooltips').tooltip({ showURL: false, positionLeft: true, top: -45, left: 8, track: true  });
		$('.tooltiped').tooltip({ showURL: false, positionLeft: true, top: -45, left: 8, track: true  });
		$('.tolltips').tooltip({ showURL: false, positionLeft: true, top: -45, left: 8, track: true  });
		$('.tolltips_del').tooltip({ showURL: false, positionLeft: true, top: -45, left: 8, track: true  });
		$('.tolltips_edit').tooltip({ showURL: false, positionLeft: true, top: -45, left: 8, track: true });
		
		
		$('.side_box').each(function(index) {
			if ( index == 0 ) {
				$(this).find('.sidebar_head').addClass('aktiv_box');
			} else {
				if ( $(this).find('.sidebar_head').count > 0 ){
					
					if ( $(this).find('.sidebar_head').hasClass('aktiv_box')) {

					} else {
						$(this).find('ul.sidebar').slideToggle();
					}
				}
				
			}
		  });
		$('.sidebar_head a').live('click', function(event){
			event.preventDefault();
			$(this).parent().toggleClass('aktiv_box');
			$(this).parent().parent().find('ul.sidebar').slideToggle();
		});
		
		
		
		
		/*
		$('.system_abschnitt').each(function(){
			if ( $(this).val() == "true" ) {
				$(this).next('a').addClass('aktiv');
				$(this).parent().parent().find(".edit_nested_form").hide();
				$(this).parent().parent().find(".remove_nested_form").hide();
			}
		});
		
		$(".admin_system_stuff_link").live('click',function(){
			if ( $(this).hasClass('aktiv') ) {
				$(this).prev(".system_abschnitt").val('0');
				$(this).removeClass('aktiv');
				$(this).parent().parent().find(".edit_nested_form").show();
				$(this).parent().parent().find(".remove_nested_form").show();
			} else {
				$(this).prev(".system_abschnitt").val('1');
				$(this).addClass('aktiv');
				$(this).parent().parent().find(".edit_nested_form").hide();
				$(this).parent().parent().find(".remove_nested_form").hide();
			}
		});
		*/
		$('.system_abschnitt').each(function(){
			if ( $(this).val() == "true" ) {
				$(this).parent().parent().find(".edit_nested_form").hide();
				$(this).parent().parent().find(".remove_nested_forms").hide();
			}
		});
		$(".admin_system_stuff_link").live('click',function(){
				$(this).prev(".system_abschnitt").val('1');
				$(this).addClass('hidden');
				$(this).parent().find(".admin_system_stuff_unlink").removeClass('hidden');
				$(this).parent().parent().find(".edit_nested_form").hide();
				$(this).parent().parent().find(".remove_nested_forms").hide();
		});
		$(".admin_system_stuff_unlink").live('click',function(){
				$(this).prev(".system_abschnitt").val('0');
				$(this).addClass('hidden');
				$(this).parent().find(".admin_system_stuff_link").removeClass('hidden');
				$(this).parent().parent().find(".edit_nested_form").show();
				$(this).parent().parent().find(".remove_nested_forms").show();
		});
		
		
		
		$('.Pagez_remote_link').click(function(event){
			var xlinkx = $(this);
	        event.preventDefault();
	        $.ajax({type: 'GET', url: this.href, data: ({authenticity_token: AUTH_TOKEN}), success: function(r){ xlinkx.parent().parent().html(r);} });
	      });
		/*
		$('.add_text_field a').live('click', function(){
			$(this).parent().parent().hide();
		});
		*/
		
		$('.add_text_field a').live('click', function(event){
			event.preventDefault();
			
			$(this).parent().parent().parent().find('.abs_text_box').hide().removeClass("hidden").fadeIn('900');
			$(this).parent().parent().parent().find('.new_abs_param_stuff_typ input').val('text');
			
			$(this).parent().parent().parent().find('.abschnitt_choose_toolz').html('').hide();
			
		});
		
		$('.new_text_abschnitt a').live('click', function(event){
			event.preventDefault();
			var this_box = $(this).parent().parent().parent();
			this_box.find('.abschnitt_choose_toolz').fadeOut('900').html('');
			var js_path = "/javascripts";
		    var base_path = js_path+"/fckeditor/";
			var fck_height = "200px";
			var fck_width = "731px";
			var fck_toolz = "Strange"
			var text_stuff = this_box.find('textarea.new_abs_fck').attr("id");
			var oFCKeditor = new FCKeditor(text_stuff, fck_width, fck_height, fck_toolz);
			oFCKeditor.BasePath = base_path;
			oFCKeditor.Config['GoogleMaps_Key'] = STRANGE_G_MAP_KEY;
			oFCKeditor.Config['CustomConfigurationsPath'] = js_path+'/fckcustom.js';
			oFCKeditor.ReplaceTextarea();
			
			this_box.find('.abs_text_box').hide().removeClass("hidden").fadeIn('900');
			this_box.find('.new_abs_stuff_typ input').val('text');
			this_box.find('.abschnitt_inhalt_anker_feld').hide().removeClass("hidden").fadeIn('900');
			
			
		});

		$('.add_k_form a').live('click', function(event){
			event.preventDefault();
			$(this).parent().parent().parent().find('.new_abs_stuff_typ input').val('k_form');
			$(this).parent().parent().html('<br/><h2> [:: Kontakt - Formular ::] </h2><br/>');
		});
		
		$('.add_trenn_linie a').live('click', function(event){
			event.preventDefault();
			$(this).parent().parent().parent().find('.new_abs_stuff_typ input').val('trenn_linie');
			$(this).parent().parent().html('<div class="trenn_linie"></div>');
		});
		
		$('.Pagez__toggle_remote_link').live('click', function(event){
			event.preventDefault();
			$(this).parent().parent().parent().find('div.show_text').fadeOut('300').hide();
	        $(this).parent().parent().parent().find('div.hidden').hide().removeClass("hidden").fadeIn('900');
			$(this).fadeOut('500');
	      });




		
   });

function remove_fields(link) {
	$('#web_ref_add_link').fadeIn();
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".fields").hide();
}

function remove_fieldz(link) {
  $(link).find("input[type=hidden]").val("1");
  $(link).hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().parent().before(content.replace(regexp, new_id));
}

function add_fineline_abschnitt(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().parent().parent().find('#fineline_seite_form_abschnitt_area').append(content.replace(regexp, new_id));
}

function add_fck_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().parent().before(content.replace(regexp, new_id));
	var js_path = "/javascripts";
    var base_path = js_path+"/fckeditor/";
	var fck_height = "200px";
	var fck_width = "731px";
	var fck_toolz = "Strange";
  $('textarea.ajax-fck').each(function(){
		var text_stuff = $(this).attr('id');
		var oFCKeditor = new FCKeditor(this.id, fck_width, fck_height, fck_toolz);
		oFCKeditor.BasePath = base_path;
		oFCKeditor.GoogleMaps_Key = STRANGE_G_MAP_KEY;
		oFCKeditor.Config['GoogleMaps_Key'] = STRANGE_G_MAP_KEY;
		oFCKeditor.Config['CustomConfigurationsPath'] = js_path+'/fckcustom.js';
		oFCKeditor.ReplaceTextarea();
	});


}