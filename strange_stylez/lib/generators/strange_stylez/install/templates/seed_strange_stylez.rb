   


# encoding: utf-8

default_style = FineStyle.create! :name => 'default', :despcription => "fineline Standard-Style", 
  :autor_name => 'Strange', :autor_vorname => 'Austin', :autor_email => "austin@orangenwerk.com", :autor_fine_id => 'owerk_austin'


button_set = StyleSet.create! :name => 'Buttons', :beschreibung => 'fineline ButtonSet', 
  :autor_name => 'Strange', :autor_vorname => 'Austin', :autor_email => "austin@orangenwerk.com", :autor_fine_id => 'owerk_austin'

finelineButton = StyleObject.create! :name => '.finelineButton'


fineline_button = StyleObjekt.create! :name => 'fineline_button', :style_set_id => style_set1.id

fineline_button_css1 = StyleSheet.create! :style_objekt_id => fineline_button.id, :name => 



   
   