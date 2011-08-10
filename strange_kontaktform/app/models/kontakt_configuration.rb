# encoding: utf-8
class KontaktConfiguration < Configuration
  
  preference :use_std_mails_from, :boolean, :default => true
  
  preference :mail_von, :string, :default => 'cms@orangenwerk.com'
  preference :mail_an, :string, :default => 'cms@orangenwerk.com'
  preference :mail_bcc, :string, :default => 'admin@orangenwerk.com'
  
  preference :anrede, :boolean, :default => true
  preference :validate_anrede, :boolean, :default => true
  preference :titel, :boolean, :default => false
  preference :validate_titel, :boolean, :default => false
  preference :name, :boolean, :default => true
  preference :validate_name, :boolean, :default => true
  preference :vorname, :boolean, :default => false
  preference :validate_vorname, :boolean, :default => false
  preference :firma, :boolean, :default => false
  preference :validate_firma, :boolean, :default => false
  preference :abteiung_oder_position, :boolean, :default => false
  preference :validate_abteiung_oder_position, :boolean, :default => false
  preference :webseite, :boolean, :default => false
  preference :validate_webseite, :boolean, :default => false
  preference :strasse, :boolean, :default => false
  preference :validate_strasse, :boolean, :default => false
  preference :plz, :boolean, :default => false
  preference :validate_plz, :boolean, :default => false
  preference :ort, :boolean, :default => false
  preference :validate_ort, :boolean, :default => false
  preference :bundesland, :boolean, :default => false
  preference :validate_bundesland, :boolean, :default => false
  preference :land, :boolean, :default => false
  preference :validate_land, :boolean, :default => false
  preference :geburtstag, :boolean, :default => false
  preference :validate_geburtstag, :boolean, :default => false
  preference :telefon, :boolean, :default => false
  preference :validate_telefon, :boolean, :default => false
  preference :telefax, :boolean, :default => false
  preference :validate_telefax, :boolean, :default => false
  preference :mobil, :boolean, :default => false
  preference :validate_mobil, :boolean, :default => false
  preference :betreff, :boolean, :default => true
  preference :validate_betreff, :boolean, :default => false

  validates :name, :presence => true, :uniqueness => true

end
