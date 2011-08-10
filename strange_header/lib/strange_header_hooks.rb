# encoding: utf-8
class StrangeHeaderHooks < Strangecms::ThemeSupport::HookListener
  
  insert_after :admin_seiten_sub_tabs do
    "<%= link_to 'Header', admin_headers_path, :class => ('aktiv' if @sub_aktivio == 'headers') %>"
  end
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/headers/icon' %>"
  # => end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Bild-Banner', 
                                          :modul_name => StrangeHeader::name.to_s, 
                                          :modul_version => StrangeHeader::VERSION.to_s,
                                          :modul_url => admin_headers_path,
                                          :modul_icon => 'header',
                                          :modul_kats => 'Header, Banner',
                                          :modul_info => 'Modul zur anzeige von Header-Bildern und Bannern.' %>"
  end
  
  #insert_after :strange_banner do
  #  "<%= render :partial => 'header/show' %>"
  #end
  
  replace :strange_banner, 'header/show'
  
end
