# encoding: utf-8
class StrangeNewsletterHooks < Strangecms::ThemeSupport::HookListener
  
  # => insert_after :admin_module_list do
  # =>   "<%= render 'admin/newsletters/icon' %>"
  # => end
  
  insert_after :admin_module_list do
    "<%= render 'admin/base/modul_icon',  :modul_titel => 'Newsletter', 
                                          :modul_name => StrangeNewsletter::name.to_s, 
                                          :modul_version => StrangeNewsletter::VERSION.to_s,
                                          :modul_url => '',
                                          :modul_icon => 'whrite_4',
                                          :modul_kats => 'News, E-Mails',
                                          :modul_info => 'Newsletter-Verwaltungs-Modul.' %>"
  end
  
end
