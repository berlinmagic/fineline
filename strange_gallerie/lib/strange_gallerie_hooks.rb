# encoding: utf-8
class StrangeGallerieHooks < Strangecms::ThemeSupport::HookListener
  
  insert_after :admin_module_sub_tabs do
    "<%= link_to 'Gallerie', admin_bilder_url, :class => ('aktiv' if @sub_aktivio == 'gallerie') %>"
  end
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/gallerien/icon' %>"
  # => end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Bild-Gallerien', 
                                          :modul_name => StrangeGallerie::name.to_s, 
                                          :modul_version => StrangeGallerie::VERSION.to_s,
                                          :modul_url => admin_bilder_url,
                                          :modul_icon => 'bilder_1',
                                          :modul_kats => 'Bilder, Fotos',
                                          :modul_info => 'Bild und Gallerie-Modul.' %>"
  end
  
  insert_after :admin_settings_sidebar do
    "<li><%= link_to 'Gallerie-Bilder', admin_gallerie_settings_path, :class => ('aktiv' if @u_aktiv == 'gallerie_settings') %></li>"
  end
  
  # => insert_after :site_after_head do
  # =>   "<%= render 'stylesheetz/strange_gallerie' %>"
  # => end
  # => 
  # => insert_after :admin_after_head do
  # =>   "<%= render 'stylesheetz/strange_gallerie_admin' %>"
  # => end
  
  insert_after :finestyles do
    "<%= render 'stylesheetz/gallerie' %>"
  end
  
  insert_after :strange_admin_js_stuff do
    "<%= render 'javascriptz/strange_gallerie_admin' %>"
  end
  
  
  insert_after :strange_front_js_stuff do
    "<%= render 'javascriptz/strange_gallerie' %>"
  end
  
  
  insert_after :in_form_abschnitte do
     '<%= render "seiten/bg_abschnitt_fields", :f => f %>'
  end
  
  insert_after :seiten_abschnitte_if do
     '<%= render "gallerien/bg_show", :abschnitt => abschnitt, :index => index %>'
  end
  
  insert_after :abschnitt_content_choose do
    '<%= render "gallerien/gallerie_chooser" %>'
  end
  
  
  

  
end

