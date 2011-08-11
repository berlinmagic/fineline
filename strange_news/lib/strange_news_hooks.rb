# encoding: utf-8
class StrangeNewsHooks < Strangecms::ThemeSupport::HookListener
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/news/icon' %>"
  # => end
  
  insert_after :admin_main_navigation do
    "<%= link_to 'News', admin_news_index_path, :class => ('aktiv' if @aktivio == 'news') %>"
  end
  
  insert_after :admin_settings_sidebar do
    "<li><%= link_to 'News-Modul', admin_news_settings_path, :class => ('aktiv' if @u_aktiv == 'kontakt_settings') %></li>"
  end
  
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'News-Modul', 
                                          :modul_name => StrangeNews::name.to_s, 
                                          :modul_version => StrangeNews::VERSION.to_s,
                                          :modul_url => admin_news_index_path,
                                          :modul_icon => 'news_2',
                                          :modul_kats => 'News',
                                          :modul_info => 'News-Modul.' %>"
  end
  
  # => insert_after :admin_module_sub_tabs do
  # =>   "<%= link_to 'News', admin_news_index_path, :class => ('aktiv' if @sub_aktivio == 'news') %>"
  # => end
  
  insert_after :seiten_abschnitte_if do
     '<%= render "seiten/news_show", :abschnitt => abschnitt, :index => index %>'
  end
  
  insert_after :in_form_abschnitte do
     '<%= render "seiten/news_abschnitt_fields", :f => f %>'
  end
  
  insert_after :fineline_sidbar_content do
     '<%= render "seiten/news_sidebar" %>'
  end
  
  # => insert_after :admin_after_head do
  # =>   "<%= render 'stylesheetz/strange_news' %>"
  # => end
  # => insert_after :site_after_head do
  # =>   "<%= render 'stylesheetz/strange_news' %>"
  # => end
  
  insert_after :finestyles do
    "<%= render 'stylesheetz/news' %>"
  end
  
end
