# encoding: utf-8
module FineFormHelper

    def ff_font_select_row(pref,blank=true, area='front')
      stuff   =   "<tr><th>"
      stuff   +=  t("strange_stylez.#{ area }_#{ pref }_font_family")
      stuff   +=  "</th><td colspan='3'>"
      stuff   +=  if blank
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
		  stuff   +=  ff_line_height_row(pref, area)
		  stuff   +=  "<tr><th colspan='4' class='group'>&nbsp;</th></tr>"
      raw( stuff )
		end
		
		
		
  
end