# encoding: utf-8
module FineStylerHelper
  
  def ff_fine_icon_styler( pref, options = {} )
    options.assert_valid_keys(:area, :hover, :active, :thing, :group, :preview, :blank, :boxfont)
    options.reverse_merge! :area    =>    'front'         unless    options.key? :area
    options.reverse_merge! :blank    =>    false          unless    options.key? :blank
    options.reverse_merge! :hover    =>    true           unless    options.key? :hover
    options.reverse_merge! :active   =>    true           unless    options.key? :active
    options.reverse_merge! :thing   =>    'box'           unless    options.key? :thing
    options.reverse_merge! :group   =>    'system'        unless    options.key? :group
    options.reverse_merge! :preview   =>  'navigation'    unless    options.key? :preview
    options.reverse_merge! :boxfont   =>   false          unless    options.key? :boxfont
    blank = options[:blank]
    area = options[:area]
    hover = options[:hover]
    active = options[:active]
    thing = options[:thing]
    group = options[:group]
    preview = options[:preview]
    boxfont = options[:boxfont]
    if (thing == 'headline_icon') || (thing == 'icon')
      siza = Strangecms::Stylez::Config["#{area}_#{pref}_icon_size"].to_s
    elsif (thing == 'box')
      siza = ( Strangecms::Stylez::Config["#{area}_#{pref}_padding_top"].to_i + Strangecms::Stylez::Config["#{area}_#{pref}_padding_top"].to_i + 20 ).to_s
    else
      siza = Strangecms::Stylez::Config["#{area}_#{pref}_line_height"].to_s
    end
      stuff = '<div class="toggle_list_inna_trigger">'
	      stuff += "<div class='fl_box_170'><h3 style='line-height: #{ siza }px'>"
	      stuff += (thing == 'headline_icon') || (thing == 'font') ? t("strange_stylez.fonts.#{ pref }") : t("strange_stylez.iconz.#{ pref }")
	      stuff += "</h3></div>"
  		  stuff += "<div class='fl_box_310' id='#{area}_#{pref}_vorschau'>"
  		  stuff += "#{ render( "admin/settings/fl_#{ thing }", :pref => pref, :area => area, :group => group, :preview => preview  ) }"
  		  stuff += "</div>"
  		  stuff += "<div class='fl_box_110 zeus'><div class='settings_callback #{area}_#{ pref }'>&nbsp;</div></div>"
		    stuff += '<div class="clearfix"></div>'
		    stuff += '<div class="toggle_list_inna_box">'
	      stuff += '<form accept-charset="UTF-8" action="/admin/settings/stylez" data-remote="true" method="post">
	                <div style="margin:0;padding:0;display:inline">
	                  <input name="utf8" type="hidden" value="✓" />
	                  <input name="_method" type="hidden" value="put"><input id="name" name="name" size="50" type="hidden" value="stylez" />
	                  <input id="pref" name="pref" size="50" type="hidden" value="'+ pref +'" />
	                  <input id="area" name="area" size="50" type="hidden" value="'+ area +'" />
	                  <input id="thing" name="thing" size="50" type="hidden" value="'+ thing +'" />
	                  <input id="group" name="group" size="50" type="hidden" value="'+ group +'" />
	                  <input id="preview" name="preview" size="50" type="hidden" value="'+ preview +'" />
	                  <input name="authenticity_token" type="hidden" value="' + form_authenticity_token + '" />
	                </div>'
	    
	    if ( thing == 'icon' ) || ( thing == 'headline_icon' )
          stuff += fl_icon_size( pref, area )
          stuff += fl_icon_color( pref, area )
          stuff += fl_icon_blur( pref, area )
      end
	    if ( thing == 'font' ) || ( thing == 'headline_icon' ) || ( thing == 'box' && boxfont == true )
          stuff += ff_font_selecta( pref, area, blank )
          stuff += ff_font_format( pref, area )
          stuff += ff_font_color( pref, area )
          stuff += ff_line_height( pref, area ) if ( thing == 'font' ) || ( thing == 'box' && boxfont == true )
          stuff += fl_text_shadow( pref, area )
	    end
      if ( thing == 'icon' ) || ( thing == 'box' )
          stuff += fl_border_tag( pref, area, '', true, true, true )
          if thing == 'box'
              stuff += ff_padding_tag( pref, area )
              stuff += fl_opacity( pref, area )
          end
          stuff += fl_icon_style( pref, area )
          stuff += fl_background( pref, area )
          stuff += fl_box_shadow( pref, area )
          
          stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
          stuff += '<div class="fl_box_170"><label class="norm1"><strong> (Mouseover) </strong></label></div>'
          stuff += '<div class="clearfix"></div>'
          stuff += fl_border_tag( pref, area, 'hover', false, true, true )
          if thing == 'box'
              stuff += fl_opacity( pref, area, 'hover' )
              if boxfont
                stuff += ff_font_color( pref, area, 'hover' )
                stuff += fl_text_shadow( pref, area, 'hover' )
              end
          end
          stuff += fl_background( pref, area, 'hover' )
          stuff += fl_box_shadow( pref, area, 'hover' )
          
          stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
          stuff += '<div class="fl_box_170"><label class="norm1"><strong> (Click) </strong></label></div>'
          stuff += '<div class="clearfix"></div>'
          stuff += fl_border_tag( pref, area, 'active', false, true, true )
          if thing == 'box'
              stuff += fl_opacity( pref, area, 'active' )
              if boxfont
                stuff += ff_font_color( pref, area, 'active' )
                stuff += fl_text_shadow( pref, area, 'active' )
              end
          end
          stuff += fl_background( pref, area, 'active' )
          stuff += fl_box_shadow( pref, area, 'active' )
      end
      stuff += '<div class="fl_box_170">&nbsp;</div>'
      stuff += '<div class="fl_box_230">'+ submit_tag('speichern') +'<div class="clearfix"></div></div><div class="clearfix"></div>'
      stuff += '</form>'
      stuff += '</div>'
      stuff += '</div>'
      raw( stuff )
  end
  
  
  
  def ff_fine_icon_scripter( pref, options = {} )
    options.assert_valid_keys( :area, :hover, :active, :thing )
    options.reverse_merge! :area    =>    'front'   unless    options.key? :area
    options.reverse_merge! :hover    =>    true      unless    options.key? :hover
    options.reverse_merge! :active   =>    true      unless    options.key? :active
    options.reverse_merge! :thing   =>    'icon'      unless    options.key? :thing
    area = options[:area]
    hover = options[:hover]
    active = options[:active]
      js = ""
      states = []
      states << ''
      states << '_hover' if hover
      states << '_active' if active
      
      unless options[:thing] == 'box'
        # => Slider
        blur = Strangecms::Stylez::Config["#{area}_#{pref}_icon_blur"].to_i
        js += "$( '##{area}_#{pref}_icon_blur_slider' ).slider({ min: 1, max: 100, value: #{ blur }, 
      	slide: function( event, ui ) { $( '#preferences_#{area}_#{pref}_icon_blur' ).val( ui.value ); } });
      	$( '#preferences_#{area}_#{pref}_icon_blur' ).val( $( '##{area}_#{pref}_icon_blur_slider' ).slider( 'value' ) );"
  	  end
    	
    	
    	states.each do |state|
    	  if options[:thing] == 'box'
    	  js += "$( '##{ area }_#{ pref }_opacity#{ state }_slider' ).slider({ min: 1, max: 100, value: #{ Strangecms::Stylez::Config["#{area}_#{pref}_opacity#{ state }"].to_i }, 
      	slide: function( event, ui ) { $( '#preferences_#{area}_#{pref}_opacity#{ state }' ).val( ui.value ); } });
      	$( '#preferences_#{area}_#{pref}_opacity#{ state }' ).val( $( '##{ area }_#{ pref }_opacity#{ state }_slider' ).slider( 'value' ) );"
    	  end
    	  js += "$('.#{ area }_#{ pref }_farbwahl#{ state }').change(function(){
    	            var this_c = $(this).val();
    	            if ( this_c == 'transparent' ) {
    	              $(this).parent().parent().parent().find('.#{ area }_#{ pref }_color_1#{ state }').addClass('invisible');
    	              $(this).parent().parent().parent().find('.#{ area }_#{ pref }_color_2#{ state }').addClass('invisible');
    	            } else {
    	              if ( this_c == 'farbe' ) {
    	                $(this).parent().parent().parent().find('.#{ area }_#{ pref }_color_1#{ state }').removeClass('invisible');
      	              $(this).parent().parent().parent().find('.#{ area }_#{ pref }_color_2#{ state }').addClass('invisible');
    	              } else {
    	                $(this).parent().parent().parent().find('.#{ area }_#{ pref }_color_1#{ state }').removeClass('invisible');
      	              $(this).parent().parent().parent().find('.#{ area }_#{ pref }_color_2#{ state }').removeClass('invisible');
    	              }
    	            }
    	            });"
    	end
      
      js += "$('.#{area}_#{ pref }_icon_style').change(function(){
                  if ( $(this).val() == 'gerunded' ) {
                      $('.#{area}_#{ pref }_btn_rds').removeClass('invisible');
                  } else {
                      $('.#{area}_#{ pref }_btn_rds').addClass('invisible');
                  }
                  });"
      raw( js )
  end
  
  
  
  def fine_font_style( object, area='front', inherit=true, state='' )
    state = state.blank? ? '' : "_#{ state }"
    stuff  = fine_font_family( Strangecms::Stylez::Config[ "#{area}_#{ object }_font_family" ], inherit )
    stuff += "font-size: #{ Strangecms::Stylez::Config[ "#{area}_#{ object }_font_size" ] }px;"
    stuff += "color: ##{ Strangecms::Stylez::Config[ "#{area}_#{ object }_font_color#{ state }" ] };"
    unless object == 'headline'
      stuff += "line-height: #{ Strangecms::Stylez::Config[ "#{area}_#{ object }_line_height" ] }px;"
    end
    stuff += "font-weight: #{ Strangecms::Stylez::Config[ "#{area}_#{ object }_font_weight" ] };"
    stuff += "font-style: #{ Strangecms::Stylez::Config[ "#{area}_#{ object }_font_style" ] };"
    unless Strangecms::Stylez::Config[ "#{area}_#{ object }_text_shadow#{ state }" ].blank?
      stuff += "#{ fine_textShadow( Strangecms::Stylez::Config[ "#{area}_#{ object }_text_shadow#{ state }" ] ) }"
    end
    raw( stuff )
  end
  
  
  
  def fl_icon_css( icon, options={} )
	  options.assert_valid_keys( :area, :state, :class, :important )
    options.reverse_merge! :area      =>  'front'   unless    options.key? :area
    options.reverse_merge! :important =>  false      unless   options.key? :important
    options.reverse_merge! :state     =>  ''        unless    options.key? :state
    state = options[:state]
    state = state.blank? ? '' : "_#{ state }"
    area = options[:area]
    imp = options[:important] == true ? ' !important' : ''
    size = Strangecms::Stylez::Config["#{ area }_#{ icon }_icon_size"].to_s
    css = "outline: none; overflow: hidden; position: relative;"
    unless (state == 'hover') || (state == 'active')
	    if Strangecms::Stylez::Config["#{ area }_#{ icon }_style"] == 'gerunded'
		    css += fine_borderRadius( "#{ Strangecms::Stylez::Config["#{ area }_#{ icon }_border_radius"] }px#{ imp }" )
		  elsif Strangecms::Stylez::Config["#{ area }_#{ icon }_style"] == 'rund'
		    css += fine_borderRadius( "50px#{ imp }" )
		  else
		    css += fine_borderRadius( "none#{ imp }" )
		  end
		end
		css += 
		css += "width: #{ size }px#{ imp }; height: #{ size }px#{ imp }; line-height: #{ size }px#{ imp };"
	  css += "border-style: #{Strangecms::Stylez::Config["#{ area }_#{ icon }_border_style"]}#{ imp };"
	  css += "border-width: #{Strangecms::Stylez::Config["#{ area }_#{ icon }_border_width#{ state }"]}px#{ imp };"
	  css += "border-color: ##{Strangecms::Stylez::Config["#{ area }_#{ icon }_border_color#{ state }"]}#{ imp };" if !Strangecms::Stylez::Config["#{ area }_#{ icon }_border_color#{ state }"].blank?
	  
	  if Strangecms::Stylez::Config["#{ area }_#{ icon }_bg_style#{ state }"] == 'verlauf'
	    css += fine_backgroundGradient( "##{Strangecms::Stylez::Config["#{ area }_#{ icon }_bg_color1#{ state }"]}", "##{Strangecms::Stylez::Config["#{ area }_#{ icon }_bg_color2#{ state }"]}" )
	  elsif Strangecms::Stylez::Config["#{ area }_#{ icon }_bg_style#{ state }"] == 'farbe'
	    css += "background: ##{Strangecms::Stylez::Config["#{ area }_#{ icon }_bg_color1#{ state }"]}#{ imp };"
	  else
	    css += "background: transparent#{ imp };"
	  end
	  raw( css )
	end
	
	
	def fine_box_css(pref, area='front', state='')
    state = state.blank? ? '' : "_#{ state }"
    css = "outline: none; overflow: hidden;"
    unless !state.blank?
	    if Strangecms::Stylez::Config["#{ area }_#{ pref }_style"] == 'gerunded'
		    css += fine_borderRadius( "#{ Strangecms::Stylez::Config["#{ area }_#{ pref }_border_radius"] }px" )
		  elsif Strangecms::Stylez::Config["#{ area }_#{ pref }_style"] == 'rund'
		    css += fine_borderRadius( "50px" )
		  else
		    css += fine_borderRadius( )
		  end
		end
		unless Strangecms::Stylez::Config[ "#{area}_#{ pref }_box_shadow#{ state }" ] != ''
		  css += "#{ fine_boxShadow( Strangecms::Stylez::Config[ "#{area}_#{ pref }_box_shadow#{ state }" ] ) }"
	  end
		css += "#{ fine_opacity( Strangecms::Stylez::Config["#{ area }_#{ pref }_opacity#{ state }"] ) }"
		css += "padding: #{ Strangecms::Stylez::Config["#{ area }_#{ pref }_padding_top"] }px #{ Strangecms::Stylez::Config["#{ area }_#{ pref }_padding_right"] }px #{ Strangecms::Stylez::Config["#{ area }_#{ pref }_padding_bottom"] }px #{ Strangecms::Stylez::Config["#{ area }_#{ pref }_padding_left"] }px;"
	  css += "border: #{Strangecms::Stylez::Config["#{ area }_#{ pref }_border_style"]} #{Strangecms::Stylez::Config["#{ area }_#{ pref }_border_width#{ state }"]}px ##{Strangecms::Stylez::Config["#{ area }_#{ pref }_border_color#{ state }"]};"
	  
	  if Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_style#{ state }"] == 'verlauf'
	    css += fine_backgroundGradient( "##{Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color1#{ state }"]}", "##{Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color2#{ state }"]}" )
	  elsif Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_style#{ state }"] == 'farbe'
	    css += "background: ##{Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color1#{ state }"]};"
	  else
	    css += "background: transparent;"
	  end
	  raw( css )
	end
  
end
