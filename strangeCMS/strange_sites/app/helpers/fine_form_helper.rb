# encoding: utf-8
module FineFormHelper
		
		def ff_font_select_tag( pref, area='front', blank=true )
      stuff   = '<div class="fineline_select fineFont_select"><a href="#" class="fineline_select_trigger"></a>
                  <div class="fineline_select_box hidden"><ul>'
      if blank
        stuff   +=  '<li class="blank">' + link_to( "- #{fine_font_names('') } -", '' ) + '</li>'
      end
      StylezConfiguration::FONTZ_TYPES.each do |font|
        stuff   +=  '<li>' + link_to( fine_font_names( font ), font, :style => "#{ fine_font_family(font) }" ) + '</li>'
      end
      stuff   +=  '</ul></div><span class="fineline_select_text">'
      stuff   +=  fine_font_names( Strangecms::Stylez::Config["#{ area }_#{ pref }_font_family"] ) + '</span>'
      stuff   +=  hidden_field_tag( "preferences[#{ area }_#{ pref }_font_family]", Strangecms::Stylez::Config["#{ area }_#{ pref }_font_family"], :class => 'fineline_select_box_input' )
      stuff   +=  '</div><div class="clearfix"></div>'
      raw( stuff )
		end
		
		def ff_fine_font_styler( pref, area='front', blank=true )
        stuff = '<div class="toggle_list_inna_trigger">'
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
      		          stuff += ff_font_select_tag( pref, area )
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
        "#{ fine_gfont_name( 'one', false, false ) }"
      elsif font_family == 'Google_two'
        "#{ fine_gfont_name( 'two', false, false ) }"
      elsif font_family == 'Google_three'
        "#{ fine_gfont_name( 'three', false, false ) }"
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
        "#{ fine_gfont_name( 'one', true, false ) }"
      elsif font_family == 'Google_two'
        "#{ fine_gfont_name( 'two', true, false ) }"
      elsif font_family == 'Google_three'
        "#{ fine_gfont_name( 'three', true, false ) }"
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
    
    def fine_font_names( font_family=nil )
      if font_family == 'Google_one'
        "#{ fine_gfont_name( 'one', false, true ) }"
      elsif font_family == 'Google_two'
        "#{ fine_gfont_name( 'two', false, true ) }"
      elsif font_family == 'Google_three'
        "#{ fine_gfont_name( 'three', false, true ) }"
      elsif font_family.blank?
        I18n.t("strange_stylez.font_namez.font_inherit")
      else
        I18n.t("strange_stylez.font_namez.#{ font_family }")
      end
    end
    
    def fine_gfont_name( gfont='one', system=false, read=false )
      start = system == true ? 'font-family: ' : ''
      ende = system == true ? ';' : ''
      mitte = read == true ? ' - ' : ', '
      "#{ start }#{Strangecms::Stylez::Config["google_font_#{ gfont }"].gsub(/(:)(.)*/, '').gsub('+', ' ')}#{ mitte }#{Strangecms::Stylez::Config["google_font_default_#{ gfont }"]}#{ ende }"
    end
    
    def ff_padding_tag( icon, area='front' )
      stuff = '<div class="fl_box_170"><label class="norm1">'+ t("strange_stylez.style_atr.padding") +'</label></div>'
      %w(top right bottom left).each do |xx|
        stuff += '<div class="grid_4">'
        stuff += select_tag("preferences[#{area}_#{ icon }_padding_#{ xx }]",
                    options_for_select(
                      StylezConfiguration::STYLE_SIZES.map { |c| [c, c] },
                      Strangecms::Stylez::Config[ "#{area}_#{ icon }_padding_#{ xx }" ].to_i ), :class => "ff_padding_#{ xx } #{area}_#{ icon }_padding_#{ xx }" )
        stuff += '</div>'
			end
      
      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
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
    
    
    
    def fl_icon_size( icon, area='front' )
      stuff = '<div class="fl_box_170"><label class="norm1">'+ t("strange_stylez.icon_atr.size") +'</label></div>'
      stuff += '<div class="fl_box_230">'
      stuff += select_tag("preferences[#{area}_#{ icon }_icon_size]",
							    options_for_select(
							      StylezConfiguration::ICON_SIZE.map { |c| [c, c] },
							      Strangecms::Stylez::Config[ "#{area}_#{ icon }_icon_size" ].to_i ), :class => "ff_icon_size #{area}_#{ icon }_icon_size" )
      stuff += '</div>'
      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
      raw( stuff )
    end
    
    def fl_icon_color( icon, area='front' )
      stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.icon_color") + '</label></div>'
      stuff += '<div class="fl_box_170">'
      stuff += select_tag( "preferences[#{area}_#{ icon }_icon_color]",
							    options_for_select(
							        StylezConfiguration::ICON_COLOR.map { |c| [c, c] },
							        Strangecms::Stylez::Config["#{area}_#{ icon }_icon_color"] ), :class => "fl_icon_blur #{area}_#{ icon }_icon_size")
      stuff += '</div>'
      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
    end
    
    def fl_icon_blur( icon, area='front' )
      stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.blur") + '</label></div>'
      stuff += '<div class="grid_4">'
        stuff += text_field_tag("preferences[#{ area }_#{ icon }_icon_blur]", Strangecms::Stylez::Config["#{ area }_#{ icon }_icon_blur"], :class => 'no_view' )
			stuff += '</div><div class="grid_8 push_1">'
			  stuff += '<div class="slider_holder"><div id="' + area + '_' + icon + '_icon_blur_slider"></div></div>'
			stuff += '</div><div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
    end
    
    def fl_icon_style( icon, area='front' )
      stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.style") + '</label></div>'
      stuff += '<div class="grid_4">'
      stuff += select_tag("preferences[#{area}_#{ icon }_style]",
							    options_for_select(
							        StylezConfiguration::BUTTON_STYLEZ.map { |c| [c, c] },
							        Strangecms::Stylez::Config[ "#{area}_#{ icon }_style" ] ), :class => "fl_icon_style #{area}_#{ icon }_icon_style" )
      stuff += '</div>'
      stuff += "<div class='grid_4 push_1'><div class='#{area}_#{ icon }_btn_rds #{ 'invisible' unless Strangecms::Stylez::Config["#{ area }_#{ icon }_style"] == 'gerunded' } '>"
      stuff += select_tag("preferences[#{area}_#{ icon }_border_radius]",
							    options_for_select(
							        StylezConfiguration::BORDER_WIDTHS.map { |c| [c, c] },
							        Strangecms::Stylez::Config["#{area}_#{ icon }_border_radius"].to_i ), :class => "fl_border_radius #{area}_#{ icon }_border_radius" )
      stuff += " px </div></div>"
      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
    end
    
    def fl_border_style( icon, area='front', state="" )
      state = state.blank? ? '' : "_#{ state }"
      raw( select_tag("preferences[#{area}_#{ icon }_border_style#{ state }]",
							        options_for_select(
							            StylezConfiguration::BORDER_STYLEZ.map { |c| [c, c] },
							            Strangecms::Stylez::Config[ "#{area}_#{ icon }_border_style#{ state }" ] ), :class => "fl_border_style #{area}_#{ icon }_border_style#{ state }" )   )
    end
    
    def fl_border_width( icon, area='front', state="" )
      state = state.blank? ? '' : "_#{ state }"
      raw( select_tag("preferences[#{area}_#{ icon }_border_width#{ state }]",
							  options_for_select(
							      StylezConfiguration::BORDER_WIDTHS.map { |c| [c, c] },
							      Strangecms::Stylez::Config[ "#{area}_#{ icon }_border_width#{ state }" ].to_i ), :class => "fl_border_width #{area}_#{ icon }_border_style#{ state }" )   )
    end
    
    def fl_border_color( icon, area='front', state="" )
      state = state.blank? ? '' : "_#{ state }"
      raw( text_field_tag( "preferences[#{area}_#{ icon }_border_color#{ state }]", 
              Strangecms::Stylez::Config[ "#{area}_#{ icon }_border_color#{ state }" ], 
              :class => "fl_border_color #{area}_#{ icon }_border_color#{ state }", :size => '6' )  )
    end
    
    def fl_border_tag( icon, area='front', state="", style=true, width=true, color=true )
      state = state.blank? ? '' : "_#{ state }"
      stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.border") + '</label></div>'
      stuff += '<div class="grid_4">' + fl_border_style( icon, area, state ) + '</div>' if style
      stuff += '<div class="grid_3">' + fl_border_width( icon, area, state ) + '</div>' if width
      stuff += '<div class="grid_4">' + fl_border_color( icon, area, state ) + '</div>' if color
      stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
			raw( stuff )
		end


    
    def fl_icon_color( icon, area='front', state="" )
      state = state.blank? ? '' : "_#{ state }"
    end
    
    def fl_background(pref, area='front', state='' )
      state = state.blank? ? '' : "_#{ state }"
      stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.bg_style") + '</label></div>'
      stuff += '<div class="grid_4">'
        stuff += select_tag("preferences[#{ area }_#{ pref }_bg_style#{ state }]",
								options_for_select(StylezConfiguration::BUTTON_BG_STYLEZ.map { |c| [I18n.t("strange_stylez.icon_atr.bg_colorz.#{c}"), c] }, Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_style#{ state }"]), :class => "#{ area }_#{ pref }_farbwahl#{ state }")
			stuff += "</div><div class='grid_4 push_1'><div class='#{ area }_#{ pref }_color_1#{ state } #{ 'invisible' if Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_style#{ state }"] == 'transparent' } '>"
			  
			  stuff += text_field_tag("preferences[#{ area }_#{ pref }_bg_color1#{ state }]", Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color1#{ state }"], :class => 'fl_pick_color', :size => '6' )
			  
			stuff += "</div></div><div class='grid_4 push_3'><div class='#{ area }_#{ pref }_color_2#{ state } #{ 'invisible' unless Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_style#{ state }"] == 'verlauf' } '>"
			  
			  stuff += text_field_tag("preferences[#{ area }_#{ pref }_bg_color2#{ state }]", Strangecms::Stylez::Config["#{ area }_#{ pref }_bg_color2#{ state }"], :class => 'fl_pick_color', :size => '6' )
			  
			stuff += '</div></div><div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
			raw ( stuff )
		end
		
		def fl_opacity( icon, area='front', state='' )
		  state = state.blank? ? '' : "_#{ state }"
      stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.style_atr.opacity") + '</label></div>'
      stuff += '<div class="grid_4">'
        stuff += text_field_tag("preferences[#{ area }_#{ icon }_opacity#{ state }]", Strangecms::Stylez::Config["#{ area }_#{ icon }_opacity#{ state }"], :class => 'no_view' )
			stuff += '</div><div class="grid_8 push_1">'
			  stuff += "<div class='slider_holder'><div id='#{ area }_#{ icon }_opacity#{ state }_slider'></div></div>"
			stuff += '</div><div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
    end
		
		def fl_box_shadow(pref, area='front', state='')
		  state = state.blank? ? '' : "_#{ state }"
		  stuff = '<div class="fl_box_170"><label class="norm1">' + t("strange_stylez.icon_atr.box_shadow") + '</label></div>'
      stuff += '<div class="fl_box_230">'
        stuff += text_field_tag("preferences[#{ area }_#{ pref }_box_shadow#{ state }]", Strangecms::Stylez::Config["#{ area }_#{ pref }_box_shadow#{ state }"], :size => 35 )
			stuff += '</div><div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
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
		
    def fine_icn_css(pref, area='front', state='')
      raw( fl_icon_css(pref, :area => area, :state => state) )
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