# encoding: utf-8
class StrangeCoreHooks < Strangecms::ThemeSupport::HookListener
  
  insert_after :admin_main_right_navigation do
    "<%= link_to 'Einstellungen', admin_settings_url, :class => ('aktiv' if @aktivio == 'settings') %>"
  end
  
  
end
