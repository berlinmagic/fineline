# encoding: utf-8
class KommentaConfiguration < Configuration
  
  FORM_STYLEZ = %w[tipped classic]
  
  preference :aktiv, :boolean, :default => true
  
  preference :form_stil, :string, :default => FORM_STYLEZ[0]
  
  preference :vorname_feld, :boolean, :default => false
  
  preference :website_feld, :boolean, :default => true
  
  preference :firma_feld, :boolean, :default => false
  
  preference :headline_feld, :boolean, :default => false
  
  
end
