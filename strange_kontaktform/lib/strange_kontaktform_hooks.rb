# encoding: utf-8
class StrangeKontaktformHooks < Strangecms::ThemeSupport::HookListener
  
  insert_after :admin_main_navigation do
    "<%= link_to 'Post', admin_kontakt_formulare_url, :class => ('aktiv' if @aktivio == 'kontakt_formular') %>"
  end
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/kontakt_formulare/icon' %>"
  # => end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Kontakt-Formular', 
                                          :modul_name => StrangeKontaktform::name.to_s, 
                                          :modul_version => StrangeKontaktform::VERSION.to_s,
                                          :modul_url => admin_emails_url,
                                          :modul_icon => 'mail1',
                                          :modul_kats => 'Formulare, E-Mail',
                                          :modul_info => 'Kontakt-Formular-Modul.' %>"
  end
  
  insert_after :in_form_abschnitte do
     '<%= render "seiten/kf_abschnitt_fields", :f => f %>'
  end
  
  insert_after :seiten_abschnitte_if do
     '<%= render "seiten/kf_show", :abschnitt => abschnitt, :index => index %>'
  end
  
  insert_after :admin_settings_sidebar do
    "<li><%= link_to 'Kontaktformular', admin_kontakt_settings_path, :class => ('aktiv' if @u_aktiv == 'kontakt_settings') %></li>"
  end
  
  insert_after :abschnitt_content_choose do
    "<div class='abschnitt_choose_option add_k_form'><%= link_to finelineIcon( :icon => 45, 
              :blur => Strangecms::Stylez::Config[:front_systemButton_icon_blur], 
              :color => Strangecms::Stylez::Config[:front_systemButton_icon_color], 
              :size => Strangecms::Stylez::Config[:front_systemButton_icon_size])+' Kontakt Formular', '#' %></div>"
  end
  
  insert_after :admin_dashboard do
    "<%= render 'admin/shared/kontakt_dash' %>"
  end
  
  insert_after :finestyles do
    "<%= render 'stylesheetz/module/kontaktform' %>"
  end
  
end
