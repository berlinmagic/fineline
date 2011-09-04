# encoding: utf-8
class StrangeHeaderHooks < Strangecms::ThemeSupport::HookListener
  
  insert_after :admin_seiten_sub_tabs do
    "<li class='<%= ' nav_aktiv' if @sub_aktivio == 'headers' %>'>
        <%= link_to 'Header', admin_headers_path, :class => ('aktiv' if @sub_aktivio == 'headers') %>
    </li>"
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
  
  # => replace :strange_banner, 'header/show'
  
  replace :strange_banner do
    "<%= render_cell :header, :display, :seite => @seite %>"
  end
  
  insert_after :fineline_javascript do
    "<%= render_cell :header, :script, :seite => @seite %>"
  end
  
  insert_after :all_js_scriptz do
    "<%= render 'javascriptz/strange_header' %>"
  end
  
  insert_after :finestyles do
    "<%= render 'stylesheetz/header' %>"
  end
  
  insert_after :admin_settings_sidebar do
    "<li><%= link_to 'Header', '/admin/settings/header', :class => ('aktiv' if @u_aktiv == 'header_settings') %></li>"
  end
  
end
