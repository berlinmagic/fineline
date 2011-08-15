# encoding: utf-8
class StrangeFineformHooks < Strangecms::ThemeSupport::HookListener
  
  insert_after :admin_main_navigation do
    "<%= link_to 'E-Mails', admin_finemails_url, :class => ('aktiv' if @aktivio == 'finemail') %>"
  end
  
  insert_after :admin_module_sub_tabs do
    "<li class='<%= 'nav_aktiv' if @sub_aktivio == 'fineform' %>'>
          <%= link_to 'fineforms', admin_fineforms_path, :class => ('aktiv' if @sub_aktivio == 'fineform') %>
    </li>"
  end
  
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/fineforms/icon' %>"
  # => end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Feine Formulare', 
                                          :modul_name => StrangeFineform::name.to_s, 
                                          :modul_version => StrangeFineform::VERSION.to_s,
                                          :modul_url => admin_fineforms_url,
                                          :modul_icon => 'mail4',
                                          :modul_kats => 'Formulare, E-Mail',
                                          :modul_info => 'Modul zum freien Erstellen von Formularen.' %>"
  end
  
  
  # => insert_after :admin_after_head do
  # =>   "<%= render 'admin/fineforms/stylesheet' %>"
  # => end
  # => insert_after :site_after_head do
  # =>   "<%= render 'fineforms/stylesheet' %>"
  # => end
  
  insert_after :finestyles do
    "<%= render 'stylesheetz/fineform' %>"
  end
  
  insert_after :strange_admin_js_stuff do
    "<%= render 'admin/fineforms/javascript' %>"
  end
  
  # => insert_after :strange_front_js_stuff do
  # =>   "<%= render 'fineforms/javascript' %>"
  # => end
  
  insert_after :strange_front_js_stuff do
    "<%= render 'javascriptz/strange_fineform' %>"
  end
  
  insert_after :in_form_abschnitte do
     '<%= render "seiten/ff_abschnitt_fields", :f => f %>'
  end
  
  insert_after :seiten_abschnitte_if do
     '<%= render "fineforms/ff_show", :abschnitt => abschnitt, :index => index %>'
  end
  
  insert_after :abschnitt_content_choose do
    '<%= render "fineforms/fineform_chooser" %>'
  end
  
  insert_after :admin_settings_sidebar do
    "<li><%= link_to 'Formulare (fine)', admin_fineform_settings_path, :class => ('aktiv' if @u_aktiv == 'fineform_settings') %></li>"
  end
  
  insert_after :admin_dashboard do
    "<%= render 'admin/shared/fineform_dash' %>"
  end
  
  
  
end
