# encoding: utf-8
class AppConfiguration < Configuration
  
  MAIL_AUTH = ['none', 'plain', 'login', 'cram_md5']
  SECURE_CONNECTION_TYPES = ['None','SSL','TLS']
  BREADCRUMPS = %w(verlauf position)

  preference :site_name, :string, :default => 'fineline-CMS'
  preference :site_url, :string, :default => '2strange.net'
  
  preference :always_put_site_name_in_title, :boolean, :default => false
  preference :put_site_name_bevore_title, :boolean, :default => false
  preference :title_seperator, :string, :default => ' | '
  
  preference :show_help, :boolean, :default => true
  
  preference :compress_stylez, :boolean,  :default => false
  preference :compress_scriptz, :boolean, :default => false
  
  preference :logo_datei,       :integer
  preference :use_logo_datei,   :boolean, :default => false
  
  
  
  preference :show_sitemap,     :boolean, :default => true
  preference :show_dashboard,   :boolean, :default => true
  preference :make_backups,     :boolean, :default => true
  preference :show_backups,     :boolean, :default => false
  
  preference :show_breadcrumps, :boolean, :default => true
  preference :breadcrump_style, :string,  :default => BREADCRUMPS[1]
  preference :breadcrump_size,  :string,  :default => 10
  
  
  preference :show_flash_for,   :integer,  :default => 3
  
  
  preference :show_site_name, :boolean, :default => true
  preference :stange_owner_name, :string, :default => 'Name'
  preference :stange_owner_vorname, :string, :default => 'Vorname'
  preference :stange_owner_street, :string, :default => 'Strasse'
  preference :stange_owner_city, :string, :default => 'Stadt'
  preference :stange_owner_zip, :string, :default => 'Plz'
  preference :stange_owner_country, :string, :default => 'Land'
  preference :stange_owner_fon, :string, :default => 'Telefon'
  preference :stange_owner_fax, :string, :default => 'Fax'
  preference :stange_owner_mobile, :string, :default => 'Mobil-Nummer'
  preference :stange_owner_firma, :string, :default => 'Firma'
  preference :allow_locale_switching, :boolean, :default => false
  preference :default_locale, :string, :default => 'de'
  preference :time_zone, :string, :default => 'Berlin'
  preference :strange_logo, :string, :default => '/images/strangeCMS.png'
  preference :stylesheets, :string, :default => 'screen' # Comma separate multiple stylesheets, e.g. 'screen,mystyle'
  preference :strange_admin_logo, :string, :default => "/images/strangeCMS.png"
  
  preference :per_page, :integer, :default => 9
  
  preference :site_width, :integer, :default => 990
  
  preference :theme, :string, :default => 'default'
  
  preference :invite_only_site, :boolean, :default => 'false'
  
  preference :m_keywords, :string, :default => "CMS, easy using, everybody, orangenwerk"
  preference :m_description, :string, :default => "easy to use CMS for everybody ... Das einfache CMS für Jedermann"
  preference :m_author, :string, :default => "Austin Strange"
  
  
  preference :analytics_key, :string, :default => "UA-XXXXX-X"
  preference :g_maps_key, :string, :default => "UA-XXXXX-X"
  
  preference :facebook_app_id, :string, :default => "UA-XXXXX-X"
  
  
  
  preference :enable_mail_delivery, :boolean, :default => true
  preference :mail_host, :string, :default => 'mail.kundenportal.railshoster.de'
  preference :mail_domain, :string, :default => 'orangenwerk.com'
  preference :mail_port, :integer, :default => 25
  preference :mail_auth_type, :string, :default => MAIL_AUTH[1]
  preference :smtp_username, :string, :default => 'seite@orangenwerk.com'
  preference :smtp_password, :string, :default => 'mHN$yrYLNnNPB'
  preference :secure_connection_type, :string, :default => SECURE_CONNECTION_TYPES[0]
  preference :mails_from, :string, :default => 'cms@orangenwerk.com'
  preference :mail_bcc, :string
  
  preference :kontakt_mail_von, :string, :default => 'cms@orangenwerk.com'
  preference :kontakt_mail_an, :string, :default => 'cms@orangenwerk.com'
  preference :kontakt_mail_bcc, :string, :default => 'admin@orangenwerk.com'
  

  validates :name, :presence => true, :uniqueness => true

end
