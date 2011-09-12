# encoding: utf-8
module FineStylerHelper
  
  def ff_fine_icon_styler( pref, options = {} )
    options.assert_valid_keys(:area, :hover, :active, :object)
    options.reverse_merge! :area    =>    'front'    unless    options.key? :edit
    options.reverse_merge! :hover    =>    true      unless    options.key? :safe
    options.reverse_merge! :active   =>    true      unless    options.key? :delete
    options.reverse_merge! :object   =>   'box'      unless    options.key? :delete
    area = options[:area]
    hover = options[:hover]
    active = options[:active]
      siza = Strangecms::Stylez::Config["#{area}_#{pref}_icon_size"].to_s
	    stuff = '<div class="toggle_list_inna_trigger">'
		      stuff += "<div class='fl_box_170'><h3 style='line-height: #{ siza }px'>"
  		        stuff += t("strange_stylez.iconz.#{ pref }") + ' .. ' + area
  		    stuff += "</h3></div>"
  		    stuff += "<div class='fl_box_230' id='#{area}_#{pref}_vorschau'>#{ render 'admin/settings/fl_icon', :pref => pref, :area => area, :siza => siza  }</div>"
  		    stuff += "<div class='fl_box_150'><div class='settings_callback #{ pref }'> </div></div>"
		      stuff += '<div class="clearfix"></div>'
	        stuff += '<div class="toggle_list_inna_box">'
	          stuff += '<form accept-charset="UTF-8" action="/admin/settings/stylez" data-remote="true" method="post">
	                      <div style="margin:0;padding:0;display:inline">
	                          <input name="utf8" type="hidden" value="✓">
	                          <input name="_method" type="hidden" value="put">
	                          <input id="name" name="name" size="50" type="hidden" value="stylez">
	                          <input id="pref" name="pref" size="50" type="hidden" value="'+ pref +'">
	                          <input id="area" name="area" size="50" type="hidden" value="'+ area +'">
	                          <input id="siza" name="siza" size="50" type="hidden" value="'+ siza +'">
	                          <input name="authenticity_token" type="hidden" value="' + form_authenticity_token + '" class="rauto" />
	                      </div>'
	            
	            stuff += fl_icon_size( pref, area )
		          stuff += fl_icon_color( pref, area )
		          stuff += fl_icon_blur( pref, area )
  						stuff += fl_border_tag( pref, area, '', true, true, true )
		          stuff += fl_icon_style( pref, area )
		          stuff += fl_background( pref, area )
		          stuff += fl_box_shadow( pref, area )
              
		          stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
		          stuff += '<div class="fl_box_170"><label class="norm1"><strong> (Mouseover) </strong></label></div>'
		          stuff += '<div class="clearfix"></div>'
              stuff += fl_border_tag( pref, area, 'hover', false, true, true )
              stuff += fl_background( pref, area, 'hover' )
              stuff += fl_box_shadow( pref, area, 'hover' )
              
              stuff += '<div class="clearfix"></div><div class="vspacer"></div><div class="clearfix"></div>'
		          stuff += '<div class="fl_box_170"><label class="norm1"><strong> (Click) </strong></label></div>'
		          stuff += '<div class="clearfix"></div>'
              stuff += fl_border_tag( pref, area, 'active', false, true, true )
              stuff += fl_background( pref, area, 'active' )
              stuff += fl_box_shadow( pref, area, 'active' )
              
    		      stuff += '<div class="fl_box_170">&nbsp;</div>'
    		      stuff += '<div class="fl_box_230">'
    		          stuff += '<input name="commit" type="submit" value="Einstellungen speichern" />'
    		      stuff += '<div class="clearfix"></div></div><div class="clearfix"></div>'
    		      
    		    stuff += '</form>'
    	    stuff += '</div>'
	    stuff += '</div>'
      raw( stuff )
  end
  
end
