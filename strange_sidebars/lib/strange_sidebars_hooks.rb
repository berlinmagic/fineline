class StrangeSidebarsHooks < Strangecms::ThemeSupport::HookListener
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/sidebars/icon' %>"
  # => end
  
  insert_after :admin_seiten_sub_tabs do
    "<li class='<%= ' nav_aktiv' if @sub_aktivio == 'sidebars' %>'>
        <%= link_to 'Sidebars', admin_sidebars_path, :class => ('aktiv' if @sub_aktivio == 'sidebars') %>
    </li>"
  end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'SeitenLeisten', 
                                          :modul_name => StrangeSidebars::name.to_s, 
                                          :modul_version => StrangeSidebars::VERSION.to_s,
                                          :modul_url => '',
                                          :modul_icon => 'news_1',
                                          :modul_kats => 'Anzeige, Inhalt',
                                          :modul_info => 'SeitenLeisten-Verwaltungs-Modul.' %>"
  end
  
end
