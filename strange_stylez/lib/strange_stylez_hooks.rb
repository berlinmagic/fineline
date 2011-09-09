# encoding: utf-8
class StrangeStylezHooks < Strangecms::ThemeSupport::HookListener
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/sidebars/icon' %>"
  # => end
  insert_after :admin_main_navigation do
    "<%= link_to 'Stylez', admin_fine_styles_path, :class => ('aktiv' if @aktivio == 'stylez') %>"
  end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'FreiStil', 
                                          :modul_name => StrangeSidebars::name.to_s, 
                                          :modul_version => StrangeSidebars::VERSION.to_s,
                                          :modul_url => '',
                                          :modul_icon => 'news_1',
                                          :modul_kats => 'Anzeige',
                                          :modul_info => 'Stylesheet-Verwaltungs-Modul.<br/>Ab jetzt bestimmen Sie, wie Ihre Seiten aussehen.' %>"
  end
  
end
