# encoding: utf-8
class StrangeCategoriesHooks < Strangecms::ThemeSupport::HookListener
  
  # => insert_after :admin_module_sub_tabs do
  # =>   "<%= link_to 'Tags', admin_tags_path, :class => ('aktiv' if @sub_aktivio == 'tags') %>"
  # => end
  # => insert_after :admin_module_sub_tabs do
  # =>   "<%= link_to 'Wertelisten', admin_wertelisten_path, :class => ('aktiv' if @sub_aktivio == 'werteliste') %>"
  # => end
  # => insert_after :admin_module_sub_tabs do
  # =>   "<%= link_to 'Kategorien', admin_kategorien_path, :class => ('aktiv' if @sub_aktivio == 'kategorien') %>"
  # => end
  
  insert_after :admin_module_sub_tabs do
    "<%= link_to 'Listen', admin_listen_path, :class => ('aktiv' if @sub_aktivio == 'listen') %>"
  end
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/tags/icon' %>"
  # => end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Tags-Modul.', 
                                          :modul_name => StrangeCategories::name.to_s, 
                                          :modul_version => StrangeCategories::VERSION.to_s,
                                          :modul_url => admin_tags_url,
                                          :modul_icon => 'whrite_1',
                                          :modul_kats => 'Sortierbarkeit',
                                          :modul_info => 'Tags-Verwaltungs-Modul.' %>"
  end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Wertelisten', 
                                          :modul_name => StrangeCategories::name.to_s, 
                                          :modul_version => StrangeCategories::VERSION.to_s,
                                          :modul_url => admin_wertelisten_url,
                                          :modul_icon => 'list3',
                                          :modul_kats => 'Listen',
                                          :modul_info => 'Modul zum erstellen und verwalten von Wertelisten.' %>"
  end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Kategorien', 
                                          :modul_name => StrangeCategories::name.to_s, 
                                          :modul_version => StrangeCategories::VERSION.to_s,
                                          :modul_url => admin_kategorien_path,
                                          :modul_icon => 'folder1',
                                          :modul_kats => 'Listen',
                                          :modul_info => 'Modul zum erstellen und verwalten von Kategorien.' %>"
  end
  
  # => insert_after :admin_after_head do
  # =>   "<%= render 'stylesheetz/strange_categories' %>"
  # => end
  # => insert_after :site_after_head do
  # =>   "<%= render 'stylesheetz/strange_categories' %>"
  # => end
  
  insert_after :finestyles do
    "<%= render 'stylesheetz/categories' %>"
  end
  
  insert_after :strange_admin_js_stuff do
    "<%= render 'javascriptz/strange_categories' %>"
  end
  
  
  insert_after :strange_front_js_stuff do
    "<%= render 'javascriptz/strange_categories' %>"
  end

  
end
