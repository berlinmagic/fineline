# encoding: utf-8


if FineStyle.where( 'name = ? AND theme_name = ? AND autor_fine_id = ?', 'Standard Stylez', "default", 'owerk_austin' ).count > 0
  
  default_style =  FineStyle.where( 'name = ? AND theme_name = ? AND autor_fine_id = ?', 'Standard Stylez', "default", 'owerk_austin' ).first
  
else
  
  default_style = FineStyle.create(         :name => 'Standard Stylez', 
                                            :despcription => "fineline Standard-Style", 
                                            :style_aktiv => true, 
                                            
                                            :theme_name => 'default',
                                            :fine_type => 'system',

                                            :autor_name => 'Strange', 
                                            :autor_vorname => 'Austin', 
                                            :autor_email => "austin@orangenwerk.com", 
                                            :autor_fine_id => 'owerk_austin' )
end

if StyleSet.where( 'name = ? AND fine_style_id = ? AND autor_fine_id = ?', 'Buttons', default_style.id, 'owerk_austin' ).count > 0

    button_set = StyleSet.where( 'name = ? AND fine_style_id = ? AND autor_fine_id = ?', 'Buttons', default_style.id, 'owerk_austin' ).first
    
else
    
    button_set = StyleSet.create(           :name => 'Buttons', 
                                            :despcription => 'fineline ButtonSet', 
                                            :fine_style_id => default_style.id, 
                                            :style_aktiv => true,

                                            :autor_name => 'Strange', 
                                            :autor_vorname => 'Austin', 
                                            :autor_email => "austin@orangenwerk.com", 
                                            :autor_fine_id => 'owerk_austin' )

end


    finelineButton = StyleObject.create(      :name => '.finelineButton', 
                                              :style_set_id => button_set.id, 
                                              :style_aktiv => true )



    finelineButton_css1 = StyleSheet.create(  :style_object_id => finelineButton.id, 
                                              :style_attribute => 'background', 
                                              :style_property => 'color', 
                                              :style_value1 => '336699', 
                                              :style_aktiv => true )


if Werteliste.where('name = ? AND system_stuff = ?', 'Schattentypen', true).count > 0
  
  swertliste = Werteliste.where('name = ? AND system_stuff = ?', 'Schattentypen', true).first
  
else
  
  swertliste = Werteliste.create(           :name => 'Schrift-Schatten', 
                                            :system_stuff => true,
                                            :beschreibung => 'Verschiedene Schrift-Schatten zum einbinden in die Schriftstile.' )
                                            
end

  schatten1 = Wert.create( :inhalt => 'Schrift-Schatten', :werteliste_id => swertliste.id )
   
