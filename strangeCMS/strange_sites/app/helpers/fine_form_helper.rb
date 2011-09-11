# encoding: utf-8
module FineFormHelper

    def ff_font_select_row(pref,blank=true, area='front')
      stuff   =   "<tr><th>"
      stuff   +=  t("strange_stylez.#{ area }_#{ pref }_font_family")
      stuff   +=  "</th><td colspan='3'>"
      stuff   +=  '<div class="field">
      		<div class="fineline_select std_select">
      			<a href="#" class="fineline_select_trigger"></a>
      			<div class="fineline_select_box hidden">
      				<ul>'
      if blank
        stuff   +=  '<li class="blank">' + link_to( " - - - - - ", "" ) + '</li>'
      end
      StylezConfiguration::FONTZ_TYPES.each do |font|
        stuff   +=  '<li class="level_0">' + link_to( t("strange_stylez.font_namez.#{ font }"), font, :style => "#{ fine_font_family(font) }" ) + '</li>'
      end
      stuff   +=  '</ul>
      			</div>
      				 <span class="fineline_select_text selected">'
      stuff   +=  Strangecms::Stylez::Config[ "#{ area }_#{ pref }_font_family" ].blank? ? ' - - - ' : t("strange_stylez.font_namez.#{ Strangecms::Stylez::Config["#{ area }_#{ pref }_font_family"] }")
      stuff   +=  '</span>'
      stuff   +=  hidden_field_tag( "preferences[#{ area }_#{ pref }_font_family]", Strangecms::Stylez::Config[ "#{ area }_#{ pref }_font_family" ], :class => 'fineline_select_box_input' )
      stuff   +=  '</div></div><div class="clearfix"></div>'
      stuff   +=  "</td></tr>"
      raw( stuff )
		end
		
		
		def ff_font_selecta(pref,blank=true, area='front')
      stuff   = '<div class="fineline_select fineFont_select">
                    <a href="#" class="fineline_select_trigger"></a>
                    <div class="fineline_select_box hidden">
                      <ul>'
      if blank
        stuff   +=  '<li class="blank">' + link_to( " - - - - - ", "" ) + '</li>'
      end
      StylezConfiguration::FONTZ_TYPES.each do |font|
        
        stuff   +=  '<li class="level_0">' + link_to( t("strange_stylez.font_namez.#{ font }"), font, :style => "#{ fine_font_family(font) }" ) + '</li>'
      end
      
      stuff   +=  '</ul></div><span class="fineline_select_text">'
        stuff   +=  Strangecms::Stylez::Config[ "#{ area }_#{ pref }_font_family" ].blank? ? ' - - - ' : t("strange_stylez.font_namez.#{ Strangecms::Stylez::Config["#{ area }_#{ pref }_font_family"] }")
      stuff   +=  '</span>'
      stuff   +=  hidden_field_tag( "preferences[#{ area }_#{ pref }_font_family]", Strangecms::Stylez::Config["#{ area }_#{ pref }_font_family"], :class => 'fineline_select_box_input' )
      stuff   +=  '</div>'
      stuff   +=  '<div class="clearfix"></div>'
      raw( stuff )
		end
		
		
		def ff_fine_font_styler( pref, area='front', blank=true )

  	    stuff  = ""
  	    stuff += '<div class="toggle_list_inna_trigger">'
  		      stuff += "<div class='fl_box_170'><h3 style='line-height: #{Strangecms::Stylez::Config["#{area}_#{pref}_line_height"]}px'>"
    		      stuff += t("strange_stylez.fonts.#{ pref }")
    		    stuff += "</h3></div>"
    		    stuff += "<div class='fl_box_230'><div class='vorschau' style='#{ fine_font_style( pref ) }'>"
    		      stuff += t('strange_stylez.sample_text')
    		    stuff += '</div></div>'
    		stuff += "<div class='fl_box_150'><div class='settings_callback #{ pref }'> </div></div>"
  		      stuff += '<div class="clearfix"></div>'
  	    
  	        stuff += '<div class="toggle_list_inna_box">'
  	        
  	          stuff += '<form accept-charset="UTF-8" action="/admin/settings/stylez" data-remote="true" method="post">
  	                      <div style="margin:0;padding:0;display:inline">
  	                          <input name="utf8" type="hidden" value="✓">
  	                          <input name="_method" type="hidden" value="put">
  	                          <input id="name" name="name" size="50" type="hidden" value="stylez">
  	                          <input id="pref" name="pref" size="50" type="hidden" value="'+ pref +'">
  	                          <input name="authenticity_token" type="hidden" value="' + form_authenticity_token + '" class="rauto" />
  	                      </div>'
  	            
      	        stuff += '<div class="fl_box_170"><label class="norm1">'
      		          stuff += t("strange_stylez.font_family")
      		      stuff += '</label></div>'
      		      stuff += '<div class="fl_box_230">'
      		          stuff += ff_font_selecta( pref )
      		      stuff += '</div>'
  		      
      		      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'

      		      stuff += '<div class="fl_box_170"><label class="norm1">'
      		          stuff += t("strange_stylez.font_format")
      		      stuff += '</label></div>'
      		      
      		      stuff += '<div class="grid_5">'
      		          stuff += select_tag("preferences[#{area}_#{ pref }_font_style]",
              								        options_for_select(
              								            StylezConfiguration::FONT_STYLES.map { |c| [ I18n.t("strange_stylez.font_styloz.#{ c }"),c ] },
              								            Strangecms::Stylez::Config["#{area}_#{ pref }_font_style"] ), :class => 'ff_font_style' )
      		      stuff += '</div>'
      		      stuff += '<div class="grid_5">'
      		          stuff += select_tag("preferences[#{area}_#{ pref }_font_weight]",
              								        options_for_select(
              								            StylezConfiguration::FONT_WEIGHTS.map { |c| [ I18n.t("strange_stylez.font_styloz.#{ c }"),c ] },
              								            Strangecms::Stylez::Config["#{area}_#{ pref }_font_weight"] ), :class => 'ff_font_weight' )
      		      stuff += '</div>'
      		      stuff += '<div class="grid_3">'
      		          stuff += select_tag("preferences[#{area}_#{ pref }_font_size]",
              								        options_for_select(
              								            StylezConfiguration::FONT_SIZES.map { |c| [c, c] },
              								            Strangecms::Stylez::Config["#{area}_#{ pref }_font_size"] ), :class => 'ff_font_size' )
      		      stuff += '</div>'
      		      
      		      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
      		      
      		      stuff += '<div class="fl_box_170"><label class="norm1">'
      		          stuff += t("strange_stylez.font_color")
      		      stuff += '</label></div>'
      		      stuff += '<div class="fl_box_150">'
      		          stuff += text_field_tag("preferences[#{area}_#{ pref }_font_color]", Strangecms::Stylez::Config[ "#{area}_#{ pref }_font_color" ], :class => 'half pick_color' )
      		      stuff += '</div>'
      		      
      		      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
      		      
      		      stuff += '<div class="fl_box_170"><label class="norm1">'
      		          stuff += t("strange_stylez.line_height")
      		      stuff += '</label></div>'
      		      stuff += '<div class="fl_box_150">'
      		          stuff += select_tag("preferences[#{area}_#{ pref }_line_height]",
              								        options_for_select(
              								            StylezConfiguration::LINE_HEIGHTS.map { |c| [c, c] },
              								            Strangecms::Stylez::Config[ "#{area}_#{ pref }_line_height" ] ), :class => 'ff_line_height' )
      		      stuff += '</div>'
      		      
      		      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
      		      
      		      stuff += '<div class="fl_box_170">&nbsp;</div>'
      		      stuff += '<div class="fl_box_230">'
      		          stuff += '<input name="commit" type="submit" value="Einstellungen speichern" />'
      		      stuff += '<div class="clearfix"></div></div><div class="clearfix"></div>'

      		      
      		    stuff += '</form>'

      	    stuff += '</div>'
  	    
  	    stuff += '</div>'

        raw( stuff )
    end
		
		def ff_google_font_row(pref)
		  stuff   =   "<tr><th>"
		  stuff   +=  t("strange_stylez.google_font_#{ pref }")
		  stuff   +=  "</th><td>"
		  stuff   +=  text_field_tag("preferences[google_font_#{ pref }]", Strangecms::Stylez::Config[ "google_font_#{ pref }" ] )
		  stuff   +=  "</td><td>"
		  stuff   +=  t("strange_stylez.google_font_default_#{ pref }")
		  stuff   +=  "</td><td>"
		  stuff   +=  select_tag("preferences[google_font_default_#{ pref }]",
								        options_for_select(
								            StylezConfiguration::FONTS_ALTS.map { |c| [t("strange_stylez.font_alts.#{c}"), c] },
								            Strangecms::Stylez::Config[ "google_font_#{ pref }" ] ) )
		  stuff   +=  "</td></tr>"
      raw( stuff )
		end
		
		def ff_font_color_row(pref, area='front')
		  stuff   =   "<tr><th>"
		  stuff   +=  t("strange_stylez.font_color")
		  stuff   +=  "</th><td colspan='3'>"
		  stuff   +=  text_field_tag("preferences[#{area}_#{ pref }_font_color]", Strangecms::Stylez::Config[ "#{area}_#{ pref }_font_color" ], :class => 'half pick_color' )
		  stuff   +=  "</td></tr>"
      raw( stuff )
		end
		
		def ff_font_size_row(pref, area='front')
		  stuff   =   "<tr><th>"
		  stuff   +=  t("strange_stylez.font_size")
		  stuff   +=  "</th><td colspan='3'>"
		  stuff   +=  select_tag("preferences[#{area}_#{ pref }_font_size]",
								        options_for_select(
								            StylezConfiguration::FONT_SIZES.map { |c| [c, c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ pref }_font_size" ] ) )
		  stuff   +=  "</td></tr>"
      raw( stuff )
		end
		
		def ff_font_style_row(pref, area='front')
		  stuff   =   "<tr><th>"
		  stuff   +=  t("strange_stylez.font_style")
		  stuff   +=  "</th><td colspan='3'>"
		  stuff   +=  select_tag("preferences[#{area}_#{ pref }_font_style]",
								        options_for_select(
								            StylezConfiguration::FONT_STYLES.map { |c| [t("strange_stylez.font_styles.#{c}"), c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ pref }_font_style" ] ) )
		  stuff   +=  "</td></tr>"
      raw( stuff )
		end
    
		def ff_font_weight_row(pref, area='front')
		  stuff   =   "<tr><th>"
		  stuff   +=  t("strange_stylez.font_weight")
		  stuff   +=  "</th><td colspan='3'>"
		  stuff   +=  select_tag("preferences[#{area}_#{ pref }_font_weight]",
								        options_for_select(
								            StylezConfiguration::FONT_WEIGHTS.map { |c| [t("strange_stylez.font_styles.#{c}"), c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ pref }_font_weight" ] ) )
		  stuff   +=  "</td></tr>"
      raw( stuff )
		end
    
		def ff_line_height_row(pref, area='front')
		  stuff   =   "<tr><th>"
		  stuff   +=  t("strange_stylez.line_height")
		  stuff   +=  "</th><td colspan='3'>"
		  stuff   +=  select_tag("preferences[#{area}_#{ pref }_line_height]",
								        options_for_select(
								            StylezConfiguration::LINE_HEIGHTS.map { |c| [c, c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ pref }_line_height" ] ) )
		  stuff   +=  "</td></tr>"
      raw( stuff )
		end
    
		def ff_head_row(pref)
		  stuff   =   "<tr><th colspan='4' class='group'>#{ t("strange_stylez.fonts.#{ pref }") }</th></tr>"
      raw( stuff )
		end
		
		def ff_font_row( pref, area='front', blank=true )
		  stuff   =   ""
		  stuff   +=  ff_head_row(pref)
		  stuff   +=  ff_font_select_row(pref,blank, area)
		  stuff   +=  ff_font_color_row(pref, area)
		  stuff   +=  ff_font_size_row(pref, area)
		  stuff   +=  ff_font_weight_row(pref, area)
		  stuff   +=  ff_font_style_row(pref, area)
		  unless pref == 'headline'
		    stuff   +=  ff_line_height_row(pref, area)
		    stuff   +=  "<tr><th colspan='4' class='group'>&nbsp;</th></tr>"
	    end
      raw( stuff )
		end
		
		def fine_font_style( object, area='front', inherit=true )
      stuff  = fine_font_family( Strangecms::Stylez::Config[ "#{area}_#{ object }_font_family" ], inherit )
      stuff += "font-size: #{ Strangecms::Stylez::Config[ "#{area}_#{ object }_font_size" ] }px;"
      stuff += "color: ##{ Strangecms::Stylez::Config[ "#{area}_#{ object }_font_color" ] };"
      unless object == 'headline'
        stuff += "line-height: #{ Strangecms::Stylez::Config[ "#{area}_#{ object }_line_height" ] }px;"
      end
      stuff += "font-weight: #{ Strangecms::Stylez::Config[ "#{area}_#{ object }_font_weight" ] };"
      stuff += "font-style: #{ Strangecms::Stylez::Config[ "#{area}_#{ object }_font_style" ] };"
      raw( stuff )
    end
    
    
    
    def fine_font_gnames( font_family=nil, inherit=true )
      if font_family == 'Google_one'
        "#{Strangecms::Stylez::Config[:google_font_one].gsub(/(:)(.)*/, '')}, #{Strangecms::Stylez::Config[:google_font_default_one]}"
      elsif font_family == 'Google_two'
        "#{Strangecms::Stylez::Config[:google_font_two].gsub(/(:)(.)*/, '')}, #{Strangecms::Stylez::Config[:google_font_default_two]}"
      elsif font_family == 'Google_three'
        "#{Strangecms::Stylez::Config[:google_font_three].gsub(/(:)(.)*/, '')}, #{Strangecms::Stylez::Config[:google_font_default_three]};"
      end
    end
    
    
    
    def finestyler( stuff, path=nil )
      if !path.blank?
        Strangecms::Stylez::Config["#{path}_#{stuff}"]
      else
        if request.fullpath.start_with?('/admin')
          Strangecms::Stylez::Config["admin_#{stuff}"]
        elsif request.fullpath.start_with?('/system')
          Strangecms::Stylez::Config["admin_#{stuff}"]
        else
          Strangecms::Stylez::Config["front_#{stuff}"]
        end
      end
    end
    
    def fine_font_family( font_family=nil, inherit=true )
      if font_family == 'Google_one'
        "font-family: #{Strangecms::Stylez::Config[:google_font_one].gsub(/(:)(.)*/, '')}, #{Strangecms::Stylez::Config[:google_font_default_one]};"
      elsif font_family == 'Google_two'
        "font-family: #{Strangecms::Stylez::Config[:google_font_two].gsub(/(:)(.)*/, '')}, #{Strangecms::Stylez::Config[:google_font_default_two]};"
      elsif font_family == 'Google_three'
        "font-family: #{Strangecms::Stylez::Config[:google_font_three].gsub(/(:)(.)*/, '')}, #{Strangecms::Stylez::Config[:google_font_default_three]};"
      elsif font_family.blank?
        if inherit
          "font-family: inherit;"
        else
          "font-family: sans-serif;"
        end
      else
        "font-family: #{ StylezConfiguration::FONTZ[ font_family ].to_s };"
      end
    end
    
    
    
    
    
    def ff_fine_icon_styler( pref, area='front', blank=true )
        siza = Strangecms::Stylez::Config["#{area}_#{pref}_icon_size"].to_s
  	    stuff  = ""
  	    stuff += '<div class="toggle_list_inna_trigger">'
  		      stuff += "<div class='fl_box_170'><h3 style='line-height: #{ siza }px'>"
    		        stuff += t("strange_stylez.iconz.#{ pref }") + ' .. ' + area
    		    stuff += "</h3></div>"
    		    stuff += "<div class='fl_box_230'><div class='icon_vorschau' style='line-height: #{ siza }px' id='#{area}_#{pref}_vorschau'>"
    		    stuff += '<style>#' + area + '_' + pref + '_vorschau { '
    		    stuff += fine_icn_css( pref, area)
    		    stuff += 'width: ' + siza + 'px; height: ' + siza + 'px; }' 
    		    stuff += '#' + area + '_' + pref + '_vorschau:hover { ' + fine_icn_css( pref, area, 'hover') + ' } '
    		    stuff += '#' + area + '_' + pref + '_vorschau:active { ' + fine_icn_css( pref, area, 'active') + ' } '
    		    stuff += '</style>'
    		      stuff += finelineIcon(:icon => 38, :color => Strangecms::Stylez::Config["#{area}_#{pref}_icon_color"], :size => Strangecms::Stylez::Config["#{area}_#{pref}_icon_size"], :blur => Strangecms::Stylez::Config["#{area}_#{pref}_icon_blur"] )
    		    stuff += '</div></div>'
    		    
    		    stuff += "<div class='fl_box_150'><div class='settings_callback #{ pref }'> </div></div>"
  		      stuff += '<div class="clearfix"></div>'
  	    
  	        stuff += '<div class="toggle_list_inna_box">'
  	        
  	          stuff += '<form accept-charset="UTF-8" action="/admin/settings/stylez" data-remote="true" method="post">
  	                      <div style="margin:0;padding:0;display:inline">
  	                          <input name="utf8" type="hidden" value="✓">
  	                          <input name="_method" type="hidden" value="put">
  	                          <input id="name" name="name" size="50" type="hidden" value="stylez">
  	                          <input id="pref" name="pref" size="50" type="hidden" value="'+ pref +'">
  	                          <input name="authenticity_token" type="hidden" value="' + form_authenticity_token + '" class="rauto" />
  	                      </div>'
  	            
  	            
  	            
  	            
      	        stuff += '<div class="fl_box_170"><label class="norm1">'+ t("strange_stylez.icon_atr.size") +'</label></div>'
      		      stuff += '<div class="fl_box_230">' + fine_Btn_size_tag( pref, area ) + '</div>'
  		          stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
  		          
  		          stuff += '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.icon_color") + '</label></div>'
      		      stuff += '<div class="fl_box_170">' + fine_Btn_icon_color_tag( pref, area ) + '</div>'
  		          stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
  		          
  		          stuff += '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.blur") + '</label></div>'
  		          stuff += '<div class="grid_4">'
      		        stuff += text_field_tag("preferences[#{ area }_#{ pref }_icon_blur]", Strangecms::Stylez::Config["#{ area }_#{ pref }_icon_blur"], :class => 'no_view' )
    						stuff += '</div><div class="grid_8 push_1">'
    						  stuff += '<div class="slider_holder"><div id="' + area + '_' + pref + '_icon_blur_slider"></div></div>'
    						stuff += '</div><div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
    						
    						
  		          
  		          
  		          
  		          # => stuff += '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.border_width") + '</label></div>'
      		      # => stuff += '<div class="fl_box_230">' + fine_Btn_border_width_tag( pref ) + '</div>'
  		          # => stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
  		          # => stuff += '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.border_color") + '</label></div>'
      		      # => stuff += '<div class="grid_4">' + fine_Btn_border_color_tag( pref ) + '</div>'
  		          # => stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
  		          
  		          stuff += fine_Btn_brdr( pref, area )
  		          
  		          stuff += '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.style") + '</label></div>'
      		      stuff += '<div class="grid_4">' + fine_Btn_style_tag( pref, area ) + '</div>'
      		      stuff += "<div class='grid_4 push_1'><div class='btn_rds #{ 'hidden' unless Strangecms::Stylez::Config["#{ area }_#{ pref }_style"] == 'gerunded' } '> #{ fine_Btn_border_radius_tag( pref ) } px </div></div>"
  		          stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
  		          
  		          
  		          stuff += fine_Btn_bger( pref, area )
  		          
  		          
  		          stuff += fine_Btn_bshadow(pref, area )
                

                
                
  		          stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
  		          stuff += '<div class="fl_box_170"><label class="norm1"><strong> (Mouseover) </strong></label></div>'
  		          stuff += '<div class="clearfix"></div>'
                
                stuff += fine_Btn_brdr( pref, area, 'hover' )
                
                stuff += fine_Btn_bger( pref, area, 'hover' )
                
                stuff += fine_Btn_bshadow( pref, area, 'hover' )
                
                stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
  		          stuff += '<div class="fl_box_170"><label class="norm1"><strong> (Click) </strong></label></div>'
  		          stuff += '<div class="clearfix"></div>'
                
                stuff += fine_Btn_brdr( pref, area, 'active' )
                
                stuff += fine_Btn_bger( pref, area, 'active' )
                
                stuff += fine_Btn_bshadow( pref, area, 'active' )
                
                
                
                
                
      		      
      		      stuff += '<div class="fl_box_170">&nbsp;</div>'
      		      stuff += '<div class="fl_box_230">'
      		          stuff += '<input name="commit" type="submit" value="Einstellungen speichern" />'
      		      stuff += '<div class="clearfix"></div></div><div class="clearfix"></div>'

      		      
      		    stuff += '</form>'

      	    stuff += '</div>'
  	    
  	    stuff += '</div>'

        raw( stuff )
    end
    
    def ff_fine_icon_scripter( pref, area='front', blank=true )
        raw( "$( '##{area}_#{pref}_icon_blur_slider' ).slider({ min: 1, max: 100, value: #{ Strangecms::Stylez::Config["#{area}_#{pref}_icon_blur"] || 50 }, 
      	slide: function( event, ui ) { $( '#preferences_#{area}_#{pref}_icon_blur' ).val( ui.value ); } });
      	$( '#preferences_#{area}_#{pref}_icon_blur' ).val( $( '##{area}_#{pref}_icon_blur_slider' ).slider( 'value' ) );" )
    end
    
    
    
    
    
    
    def fine_Btn_size_tag( icon, area='front' )
        raw( select_tag("preferences[#{area}_#{ icon }_icon_size]",
								        options_for_select(
								            StylezConfiguration::ICON_SIZE.map { |c| [c, c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ icon }_icon_size" ].to_i ), :class => 'ff_Btn_size' )   )
    end
    
    def fine_Btn_border_style_tag( icon, area='front' )
        raw( select_tag("preferences[#{area}_#{ icon }_border_style]",
								        options_for_select(
								            StylezConfiguration::BORDER_STYLEZ.map { |c| [c, c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ icon }_border_style" ] ), :class => 'ff_Btn_border_style' )   )
    end
    
    def fine_Btn_border_width_tag( icon, area='front',  state="" )
        state = state.blank? ? '' : "_#{ state }"
        raw( select_tag("preferences[#{area}_#{ icon }_border_width#{ state }]",
								        options_for_select(
								            StylezConfiguration::BORDER_WIDTHS.map { |c| [c, c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ icon }_border_width#{ state }" ].to_i ), :class => 'ff_Btn_border_width' )   )
    end
    
    def fine_Btn_border_color_tag( icon, area='front', state="" )
        state = state.blank? ? '' : "_#{ state }"
        raw( 
          text_field_tag( "preferences[#{area}_#{ icon }_border_color#{ state }]", 
                Strangecms::Stylez::Config[ "#{area}_#{ icon }_border_color#{ state }" ], :class => "ff_Btn_pick_color#{ state }", :size => '6' )
            )
    end
    
    def fine_Btn_border_radius_tag( icon, area='front' )
        raw( select_tag("preferences[#{area}_#{ icon }_border_radius]",
								        options_for_select(
								            StylezConfiguration::BORDER_WIDTHS.map { |c| [c, c] },
								            Strangecms::Stylez::Config["#{area}_#{ icon }_border_radius"].to_i ), :class => 'ff_Btn_border_radius' )   )
    end
    
    
    def fine_Btn_icon_color_tag( icon, area='front' )
        raw( select_tag("preferences[#{area}_#{ icon }_icon_color]",
								        options_for_select(
								            StylezConfiguration::ICON_COLOR.map { |c| [c, c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ icon }_icon_color" ] ), :class => 'ff_Btn_icon_color' )   )
    end
    
    def fine_Btn_icon_color_tag( icon, area='front' )
        raw( select_tag("preferences[#{area}_#{ icon }_icon_color]",
								        options_for_select(
								            StylezConfiguration::ICON_COLOR.map { |c| [c, c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ icon }_icon_color" ] ), :class => 'ff_Btn_icon_color' )   )
    end
    
    
    def fine_Btn_style_tag( icon, area='front' )
        raw( select_tag("preferences[#{area}_#{ icon }_style]",
								        options_for_select(
								            StylezConfiguration::BUTTON_STYLEZ.map { |c| [c, c] },
								            Strangecms::Stylez::Config[ "#{area}_#{ icon }_style" ] ), :class => 'ff_Btn_style' )   )
    end
    
    def fine_Btn_bger(pref, area='front', state='')
      state = state.blank? ? '' : "_#{ state }"
      stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.bg_style") + '</label></div>'
      stuff += '<div class="grid_4">'
        stuff += select_tag("preferences[#{ area }_#{ pref }_bg_style#{ state }]",
								options_for_select(StylezConfiguration::BUTTON_BG_STYLEZ.map { |c| [I18n.t("strange_stylez.icon_atr.bg_colorz.#{c}"), c] }, Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_style#{ state }"]), :class => "farbwahl#{ state }")
			stuff += '</div><div class="grid_4 push_1">'
			  stuff += text_field_tag("preferences[#{ area }_#{ pref }_bg_color1#{ state }]", Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color1#{ state }"], :class => 'ff_Btn_pick_color', :size => '6' )
			stuff += "</div><div class='grid_4 push_3'><div class='color_2#{ state } #{ 'invisible' if Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_style#{ state }"] == 'farbe' } '>"
			  stuff += text_field_tag("preferences[#{ area }_#{ pref }_bg_color2#{ state }]", Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color2#{ state }"], :class => 'ff_Btn_pick_color', :size => '6' )
			stuff += '</div></div><div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
			raw ( stuff )
		end
		
		def fine_Btn_bshadow(pref, area='front', state='')
		  state = state.blank? ? '' : "_#{ state }"
		  stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.box_shadow") + '</label></div>'
      stuff += '<div class="fl_box_230">'
        stuff += text_field_tag("preferences[#{ area }_#{ pref }_box_shadow#{ state }]", Strangecms::Stylez::Config["#{ area }_#{ pref }_box_shadow#{ state }"], :size => 35 )
			stuff += '</div><div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
			raw( stuff )
		end
		
		def fine_Btn_brdr(pref, area='front', state='')
		  state = state.blank? ? '' : "_#{ state }"
		  # => stuff += '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.border_style") + '</label></div>'
      stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.border") + '</label></div>'
      unless !state.blank?
        stuff += '<div class="grid_4">' + fine_Btn_border_style_tag( pref, area ) + '</div>'
      end
      stuff += '<div class="grid_3">' + fine_Btn_border_width_tag( pref, area, state ) + '</div>'
      stuff += '<div class="grid_4">' + fine_Btn_border_color_tag( pref, area, state ) + '</div>'
      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
      raw( stuff )
    end
    
    def fine_icn_css(pref, area='front', state=nil)
      state = state.blank? ? '' : "_#{ state }"
      css = ""
      unless !state.blank?
		    if Strangecms::Stylez::Config["#{ area }_#{ pref }_style"] == 'gerunded'
  		    css += fine_borderRadius( "#{ Strangecms::Stylez::Config["#{ area }_#{ pref }_border_radius"] }px" )
  		  elsif Strangecms::Stylez::Config["#{ area }_#{ pref }_style"] == 'rund'
  		    css += fine_borderRadius( "50px" )
  		  else
  		    css += fine_borderRadius( "" )
  		  end
  		end
  		css += "outline: none;"
  		css += "overflow: hidden;"
		  css += "border: #{Strangecms::Stylez::Config["#{ area }_#{ pref }_border_style"]} #{Strangecms::Stylez::Config["#{ area }_#{ pref }_border_width#{ state }"]}px ##{Strangecms::Stylez::Config["#{ area }_#{ pref }_border_color#{ state }"]};"
		  
		  if Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_style#{ state }"] == 'verlauf'
		    css += fine_backgroundGradient( "##{Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color1#{ state }"]}", "##{Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color2#{ state }"]}" )
		  elsif Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_style#{ state }"] == 'farbe'
		    css += "background: ##{Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color1#{ state }"]};"
		  else
		    css += "background: transparent;"
		  end
		end
  
end