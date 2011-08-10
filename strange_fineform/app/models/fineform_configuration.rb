# encoding: utf-8
class FineformConfiguration < Configuration
  
  preference :use_std_mails_from, :boolean, :default => true
  
  preference :mail_von, :string, :default => 'cms@orangenwerk.com'
  preference :mail_an, :string, :default => 'cms@orangenwerk.com'
  preference :mail_bcc, :string, :default => 'admin@orangenwerk.com'
  
  preference :std_antwort, :text, :default => '<br/><br/><br/><h1> .. Ihre Anfrage wurde gesendet .. </h1><br/><p>Wir werden uns schnellstmöglich mit Ihnen in verbindung setzen.</p><br/><br/><br/>'
  
  preference :mail_antwort, :text, :default => '<br/><h1>Wir haben Ihre Anfrage erhalten</h1><br/><p>und werden uns schnellstmöglich mit Ihnen in verbindung setzen.</p><br/><br/><br/>'
  
  
end
