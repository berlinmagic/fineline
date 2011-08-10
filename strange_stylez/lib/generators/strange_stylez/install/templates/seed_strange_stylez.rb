   


# encoding: utf-8

style_set1 = StyleSet.create! :name => 'Buttons', :beschreibung => 'fineline ButtonSet', :autor_name => 'Strange', :autor_vorname => 'Austin', :autor_email => 'austin@orangenwerk.com', :autor_id => 1, :position => 1


fineline_button = StyleObjekt.create! :name => 'fineline_button', :style_set_id => style_set1.id

fineline_button_css1 = StyleSheet.create! :style_objekt_id => fineline_button.id, :name => 



   
   