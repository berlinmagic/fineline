# encoding: utf-8
class StrangeCommentsHooks < Strangecms::ThemeSupport::HookListener
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/kommentare/icon' %>"
  # => end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Kommentare', 
                                          :modul_name => StrangeComments::name.to_s, 
                                          :modul_version => StrangeComments::VERSION.to_s,
                                          :modul_url => admin_kommentare_url,
                                          :modul_icon => 'kommentare',
                                          :modul_info => 'Modul zum Kommentieren.' %>"
  end
  
  insert_after :admin_module_sub_tabs do
    "<li class='<%= 'nav_aktiv' if @sub_aktivio == 'kommentare' %>'>
          <%= link_to 'Kommentare', admin_kommentare_url, :class => ('aktiv' if @sub_aktivio == 'kommentare') %>
    </li>"
  end
  
  # => insert_after :admin_after_head do
  # =>   "<%= render 'stylesheetz/strange_comments' %>"
  # => end
  # => insert_after :site_after_head do
  # =>   "<%= render 'stylesheetz/strange_comments' %>"
  # => end
  
  insert_after :finestyles do
    "<%= render 'stylesheetz/comments' %>"
  end
  
  insert_after :all_js_scriptz do
    "<%= render 'javascriptz/strange_comments' %>"
  end
  
  insert_after :admin_settings_sidebar do
    "<li><%= link_to 'Kommentare', '/admin/settings/kommentare', :class => ('aktiv' if @u_aktiv == 'kommentar_settings') %></li>"
  end
  
end
