# encoding: utf-8
class StrangeBackupHooks < Strangecms::ThemeSupport::HookListener
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/backups/icon' %>"
  # => end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Backups', 
                                          :modul_name => StrangeBackup::name.to_s, 
                                          :modul_version => StrangeBackup::VERSION.to_s,
                                          :modul_url => admin_backups_url,
                                          :modul_icon => 'disk2',
                                          :modul_info => 'Modul sichert jede Seiten-Änderung.' %>"
  end
  
  insert_after :strange_sidebar do
    "<%= render 'backups/sidebar' %>"
  end
  
  insert_after :admin_module_sub_tabs do
    "<%= link_to 'Backups', admin_backups_path, :class => ('aktiv' if @sub_aktivio == 'backup') %>"
  end
  
  
  insert_after :admin_after_head do
    "<%= render 'stylesheetz/strange_backup' %>"
  end
  
  insert_after :site_after_head do
    "<%= render 'stylesheetz/strange_backup' %>"
  end
  
  insert_after :strange_admin_js_stuff do
    "<%= render 'javascriptz/strange_backup' %>"
  end
  
  
  insert_after :strange_front_js_stuff do
    "<%= render 'javascriptz/strange_backup' %>"
  end
  
  
end
