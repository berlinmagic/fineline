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
      				<ul>' +
      				  if blank
      				      '<li class="blank"><%= link_to " - - - - - ", "" %></li>' + 
      				  end
      					StylezConfiguration::FONTZ_TYPES.each do |font|
      					  '<li class="level_0">' + link_to( t("strange_stylez.font_namez.#{ font }"), font, :style => "#{ fine_font_family(font) }" ) + '</li>'
      					end + '
      				</ul>
      			</div>
      				 <span class="fineline_select_text selected">' +
      				    font.blank? ? ' - - - ' : t("strange_stylez.font_namez.#{ font }")  +
      			  '</span>' +
      			  hidden_field( "preferences[#{ area }_#{ pref }_font_family]", :value => Strangecms::Stylez::Config[ "#{ area }_#{ pref }_font_family" ], :class => 'fineline_select_box_input' ) +
      		'</div>
      	</div><div class="clearfix"></div>'
        
        
          select_tag( "preferences[#{ area }_#{ pref }_font_family]",
								  options_for_select(
								      StylezConfiguration::FONTZ_TYPES.map { |c| [t("strange_stylez.font_namez.#{c}"), c] },
								      Strangecms::Stylez::Config[ "#{ area }_#{ pref }_font_family" ] ),
								      :include_blank => true   )
								else
					select_tag( "preferences[#{ area }_#{ pref }_font_family]",
								  options_for_select(
								      StylezConfiguration::FONTZ_TYPES.map { |c| [t("strange_stylez.font_namez.#{c}"), c] },
								      Strangecms::Stylez::Config[ "#{ area }_#{ pref }_font_family" ] )  )
								end
      stuff   +=  "</td></tr>"
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
    
    
    
    
    
    
    
    def finestyler(stuff)
      if request.fullpath.start_with?('/admin')
        Strangecms::Stylez::Config["admin_#{stuff}"]
      elsif request.fullpath.start_with?('/system')
        Strangecms::Stylez::Config["admin_#{stuff}"]
      else
        Strangecms::Stylez::Config["front_#{stuff}"]
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
    
  
end