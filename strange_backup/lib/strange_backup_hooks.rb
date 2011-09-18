# encoding: utf-8
class StrangeBackupHooks < Strangecms::ThemeSupport::HookListener
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/backups/icon' %>"
  # => end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Backups', 
                                          :modul_name => StrangeBackup::name.to_s, 
                                          :modul_version => StrangeBackup::VERSION.to_s,
                                          :modul_url => Strangecms::Config[:show_backups] ? admin_backups_url : '#',
                                          :modul_icon => 'disk2',
                                          :modul_info => 'Modul sichert jede Seiten-Änderung.' %>"
  end
  
  
  insert_after :strange_sidebar do
    '<%= render "sidebars/seiten_backups" %>'
  end
  
  insert_after :admin_module_sub_tabs do
    "<% if Strangecms::Config[:show_backups] || site_master %>
        <li class='<%= 'nav_aktiv' if @sub_aktivio == 'backup' %>'>
            <%= link_to 'Backups', admin_backups_path, :class => ('aktiv' if @sub_aktivio == 'backup') %>
        </li>    
    <% end %>"
  end
  
  
  
  
  # => insert_after :admin_after_head do
  # =>   "<%= render 'stylesheetz/strange_backup' %>"
  # => end
  # => insert_after :site_after_head do
  # =>   "<%= render 'stylesheetz/strange_backup' %>"
  # => end
  
  insert_after :finestyles do
    "<%= render 'stylesheetz/backup' %>"
  end
  
  insert_after :all_js_scriptz do
    "<%= render 'javascriptz/strange_backup' %>"
  end

  
  
end
