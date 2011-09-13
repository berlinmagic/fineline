# encoding: utf-8
module FineStylerHelper
  
  def ff_fine_icon_styler( pref, options = {} )
    options.assert_valid_keys(:area, :hover, :active, :thing, :group, :preview, :blank)
    options.reverse_merge! :area    =>    'front'         unless    options.key? :area
    options.reverse_merge! :blank    =>    false          unless    options.key? :blank
    options.reverse_merge! :hover    =>    true           unless    options.key? :hover
    options.reverse_merge! :active   =>    true           unless    options.key? :active
    options.reverse_merge! :thing   =>    'box'           unless    options.key? :thing
    options.reverse_merge! :group   =>    'system'        unless    options.key? :group
    options.reverse_merge! :preview   =>  'navigation'    unless    options.key? :preview
    blank = options[:blank]
    area = options[:area]
    hover = options[:hover]
    active = options[:active]
    thing = options[:thing]
    group = options[:group]
    preview = options[:preview]
    siza = Strangecms::Stylez::Config["#{area}_#{pref}_icon_size"].to_s
      stuff = '<div class="toggle_list_inna_trigger">'
	    if thing != 'font'
	      stuff += "<div class='fl_box_170'><h3 style='line-height: #{ siza }px'>"
	      stuff += thing == 'headline_icon' ? t("strange_stylez.fonts.#{ pref }") : t("strange_stylez.iconz.#{ pref }")
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
	    else
	      stuff += "<div class='fl_box_170'><h3 style='line-height: #{Strangecms::Stylez::Config["#{area}_#{pref}_line_height"]}px'>"
		    stuff += t("strange_stylez.fonts.#{ pref }")
		    stuff += "</h3></div>"
		    stuff += "<div class='fl_box_230'><div class='vorschau' style='#{ fine_font_style( pref ) }'>"
		    stuff += t('strange_stylez.sample_text')
		    stuff += "</div></div><div class='fl_box_150'><div class='settings_callback #{ pref }'> </div></div>"
	      stuff += '<div class="clearfix"></div><div class="toggle_list_inna_box">'
        stuff += '<form accept-charset="UTF-8" action="/admin/settings/stylez" data-remote="true" method="post">
                  <div style="margin:0;padding:0;display:inline">
                    <input name="utf8" type="hidden" value="✓" />
                    <input name="_method" type="hidden" value="put" /><input id="name" name="name" size="50" type="hidden" value="stylez" />
                    <input id="pref" name="pref" size="50" type="hidden" value="'+ pref +'" />
                    <input name="authenticity_token" type="hidden" value="' + form_authenticity_token + '" />
                  </div>'
      end
	    
	    if ( thing == 'icon' ) || ( thing == 'headline_icon' )
	      
          stuff += fl_icon_size( pref, area )
          stuff += fl_icon_color( pref, area )
          stuff += fl_icon_blur( pref, area )
          
      end
      
	    if ( thing == 'font' ) || ( thing == 'headline_icon' )
          stuff += ff_font_selecta( pref, area, blank )
          stuff += ff_font_format( pref, area )
          stuff += ff_font_color( pref, area )
          stuff += ff_line_height( pref, area ) if thing == 'font' 
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
          end
          
          stuff += fl_background( pref, area, 'hover' )
          stuff += fl_box_shadow( pref, area, 'hover' )
          
          stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
          stuff += '<div class="fl_box_170"><label class="norm1"><strong> (Click) </strong></label></div>'
          stuff += '<div class="clearfix"></div>'
          
          
          stuff += fl_border_tag( pref, area, 'active', false, true, true )
          
          if thing == 'box'
              stuff += fl_opacity( pref, area, 'active' )
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
  
end
