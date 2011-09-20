# encoding: utf-8
module StrangeSiteLinkHelper

  def link_to_remove_fieldsx(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(raw(name), ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def link_to_add_fineline_abschnitt(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(raw(name), ("add_fineline_abschnitt(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def add_new_fineline_abschnitt(name, f, association, options = {})
    options.assert_valid_keys(  :stuff_typ,   :stuff_param,   :protected,   :gruppe_id,   :system_stuff,  
                                :modul,       :modul_typ,     :modul_id,    :class,       :title        )
    options.reverse_merge! :stuff_typ     =>    nil   unless options.key? :stuff_typ
    options.reverse_merge! :stuff_param   =>    nil     unless options.key? :stuff_param
    options.reverse_merge! :protected     =>    false   unless options.key? :protected
    options.reverse_merge! :system_stuff  =>    false   unless options.key? :protected
    options.reverse_merge! :gruppe_id     =>    nil     unless options.key? :gruppe_id
    options.reverse_merge! :modul         =>    nil     unless options.key? :modul
    options.reverse_merge! :modul_typ     =>    nil     unless options.key? :modul_typ
    options.reverse_merge! :modul_id      =>    nil     unless options.key? :modul_id
    options.reverse_merge! :title         =>    nil     unless options.key? :title
    options.reverse_merge! :class         =>    nil     unless options.key? :class

    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      if options[:stuff_typ]
        render("seiten/abschnitte/" + options[:stuff_typ] + "_new", :f => builder, :this_stuff_typ => options[:stuff_typ], :this_stuff_param => options[:stuff_param], :this_protected => options[:protected], :this_system_stuff => options[:system_stuff], :this_gruppe_id => options[:gruppe_id], :this_modul => options[:modul], :this_modul_typ => options[:modul_typ], :this_modul_id => options[:modul_id])
      else
        render(association.to_s.singularize + "_fields", :f => builder)
      end
    end
    link_to_function(raw(name), ("add_fineline_abschnitt(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class => options[:class], :title => options[:title])
  end
  
  
  
  def link_to_add_fck_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(raw(name), ("add_fck_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def link_to_remove_fields(helpa, f = nil, options = {})
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :dataType => 'script'
    options.reverse_merge! :tooltip => t("strange_sites.links.delete_abschnitt")
    options.reverse_merge! :icon => 24
    options.reverse_merge! :blur => Strangecms::Stylez::Config[:front_systemButton_icon_blur]
    options.reverse_merge! :size => Strangecms::Stylez::Config[:front_systemButton_icon_size]
    options.reverse_merge! :color => Strangecms::Stylez::Config[:front_systemButton_icon_color]
    options.reverse_merge! :success => "function(r){ $(link).prev('input[type=hidden]').val('1');	$(link).closest('.fields').hide(); }"
    opt_pix = [18, 24, 32, 48]
    size = opt_pix.include?(options[:size]) ? options[:size] : 18
    f.hidden_field(:_destroy, :class => "remova_"+helpa) + link_to_function(
    
    finelineIcon(		:icon => options[:icon], 
								      :blur => options[:blur], 
								      :color => options[:color], 
								      :size => options[:size]  ), 
      "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
          if(r){
        
              $('##{'remova_'+helpa}').prev('input[type=hidden]').val('1');
              $('##{'remova_'+helpa}').parent().parent().parent().addClass('geloescht');
              $('##{'remova_'+helpa}').parent().parent().parent().find('span.handle').hide();
              $('##{'remova_'+helpa}').parent().hide();
          
      
          }
          });", :class => "flb#{size} system finelineButton #{ Strangecms::Stylez::Config[:front_systemButton_style] } tooltiped", :title => options[:tooltip], :id => "remova_"+helpa)
  end
  
  def strange_show_link(helpa)
    if helpa.class.to_s == 'Seite'
      strange_icon_link('show', t("Show"), "#{helpa.slug}")
    else
      strange_icon_link('show', t("Show"), helpa)
    end
  end
  
  def strange_admin_show_link(helpa)

      strange_icon_link('show', t("Show"), [:admin, helpa])

  end

  def strange_edit_link(helpa)
    strange_icon_link('edit', t("Edit"), [:edit, :admin, helpa])
  end
  
  def strange_remote_edit_link(helpa)
    strange_remote_icon_link('edit', t("Edit"), [:edit, :admin, helpa])
  end
  
  def strange_antwort_link(helpa)
    strange_icon_link('edit', t("Edit"), [:antwort, :admin, helpa])
  end

  def strange_delete_link(helpa, options = {})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :stuff)
    options.reverse_merge! :url => "#{helpa.class.to_s.pluralize.downcase}/#{helpa.id}" unless options.key? :url
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :dataType => 'script'
    options.reverse_merge! :success => "function(r){ jQuery('##{dom_id helpa}').fadeOut('hide'); }"
    link_to_function icon("delete"), "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });", :class => 'strange_icon_link', :title => t("Destroy")
  end
  
  def strange_delete_text_link(helpa, options = {})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :stuff, :link_text)
    options.reverse_merge! :url => "#{helpa.class.to_s.pluralize.downcase}/#{helpa.id}" unless options.key? :url
    options.reverse_merge! :link_text => t('delete') unless options.key? :link_text
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :dataType => 'script'
    options.reverse_merge! :success => "function(r){ jQuery('##{dom_id helpa}').fadeOut('hide'); }"
    link_to_function options[:link_text], "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });", :title => t("Destroy")
  end
  
  def strange_delete(helpa, options = {})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :stuff)
    options.reverse_merge! :url => "#{helpa.class.to_s.pluralize.downcase}/#{helpa.id}" unless options.key? :url
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :dataType => 'html'
    options.reverse_merge! :success => 'function(r){ window.location.href = "/"; alert("Seite wurde in den Papierkorb gelegt!\nSystem-Seiten werden weiterhin angezeigt."); }'
    link_to_function '', "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });", :id => 'btn_del', :title => t("Destroy")
  end
  
  def fineline_delete(helpa, options = {})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :stuff)
    options.reverse_merge! :url => "#{helpa.class.to_s.pluralize.downcase}/#{helpa.id}" unless options.key? :url
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :dataType => 'html'
    options.reverse_merge! :success => "function(r){ jQuery('##{dom_id helpa}').fadeOut('hide'); }"
    link_to_function '', "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });", :id => 'btn_del', :title => t("Destroy")
  end
  
  def strange_rebuilder(helpa, version, options = {})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :stuff, :tooltip)
    options.reverse_merge! :url => "#{helpa.class.to_s.pluralize.downcase}/#{helpa.id}" unless options.key? :url
    options.reverse_merge! :caption => 'Sind Sie sicher das Sie Version '+version+' der Seite "'+helpa.titel+'" wiederhestellen möchten?'
    options.reverse_merge! :title => 'Wiederherstellung'
    options.reverse_merge! :tooltip => 'Diese Seite auf Version '+version+' zurücksetzen' unless options.key? :tooltip
    options.reverse_merge! :dataType => 'html'
    options.reverse_merge! :success => 'function(r){ window.location.href = "/"; alert("Seite wurde wiederhergestellt!"); }'
    link_to_function 'Wiederherstellen!', "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });", :title => options[:tooltip], :class => 'tooltiped'
  end

  def strange_icon_link(icon_name, text, url)
    link_to(icon(icon_name), url, :title => "#{text}", :class => 'strange_icon_link')
  end
  
  def strange_remote_icon_link(icon_name, text, url)
    link_to(icon(icon_name), url, :title => "#{text}", :class => 'strange_icon_link', :remote => true)
  end

  def icon(icon_name)
    image_tag("/images/btns/#{icon_name}.png")
  end
  
  def button_link_to_function(text, function, html_options = {})
    link_to_function(text_for_button_link(text, html_options), function, html_options_for_button_link(html_options))
  end
  
  
  
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def fineline_icon(name)
    image_tag( "/images/fineline/icons_16/#{name}.png", :class => 'fineline_icon_pic' )
  end
  

  
  def fineline_button( name, options = {})
    options.assert_valid_keys(:url, :title, :link_text, :class)
    options.reverse_merge! :url => nil unless options.key? :url
    options.reverse_merge! :title => nil unless options.key? :title
    options.reverse_merge! :class => nil unless options.key? :class
    options.reverse_merge! :link_text => nil unless options.key? :link_text
    raw( '<div class="fineline_button '+"#{options[:class].to_s unless options[:url]}"+'"'+"#{' title="'+options[:title]+'"' if options[:title]}"+'>'+
            "#{'<a href="'+options[:url]+'" class="'+options[:class].to_s+'">' if options[:url]}"+
            
                fineline_icon(name)+"#{'&nbsp;'+options[:link_text]+'&nbsp;&nbsp;' if options[:link_text]}"+
            
            "#{'</a>' if options[:url]}"+'</div>')
  end
  
  
  def fineline_button_delete(helpa, options = {})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :stuff, :link_text, :class, :tooltip)
    options.reverse_merge! :url => "#{helpa.class.to_s.pluralize.downcase}/#{helpa.id}" unless options.key? :url
    options.reverse_merge! :link_text => nil unless options.key? :link_text
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :class => '' unless options.key? :class
    options.reverse_merge! :tooltip => t("Destroy") unless options.key? :tooltip
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :dataType => 'script'
    options.reverse_merge! :success => "function(r){ jQuery('##{dom_id helpa}').fadeOut('hide'); }"
    link_to_function fineline_button( 'loeschen', :link_text => options[:link_text], :class => options[:class] ), "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });", :title => options[:tooltip], :class => 'tooltiped'
  end
  
  def fineline_icon_delete(helpa, options = {})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :stuff, :link_text, :class, :tooltip)
    options.reverse_merge! :url => "#{helpa.class.to_s.pluralize.downcase}/#{helpa.id}" unless options.key? :url
    options.reverse_merge! :link_text => nil unless options.key? :link_text
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :class => '' unless options.key? :class
    options.reverse_merge! :tooltip => t("Destroy") unless options.key? :tooltip
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :dataType => 'script'
    options.reverse_merge! :success => "function(r){ jQuery('##{dom_id helpa}').fadeOut('hide'); }"
    link_to_function fineline_icon( 'loeschen'), "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });", :title => options[:tooltip], :class => 'tooltiped'
  end
  
  def strange_selected_delete(helpa, options = {})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :antwort, :class, :tooltip)
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :antwort => 'Verknüpfung wurde gelöscht!'
    options.reverse_merge! :class => '' unless options.key? :class
    options.reverse_merge! :tooltip => t("Destroy") unless options.key? :tooltip
    options.reverse_merge! :dataType => 'html'
    options.reverse_merge! :success => "function(r){ jQuery('##{dom_id helpa}').fadeOut('hide'); }"
    link_to_function fineline_button( 'loeschen', :class => options[:class] ), "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });", :title => options[:tooltip], :class => 'tooltiped in_box_top_delete'
  end
    
  
  
end