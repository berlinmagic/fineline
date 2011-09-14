   


# encoding: utf-8

default_style = FineStyle.create!   :name => 'default', 
                                    :despcription => "fineline Standard-Style", 
                                    :style_aktiv => true, 
                                    
                                    :autor_name => 'Strange', 
                                    :autor_vorname => 'Austin', 
                                    :autor_email => "austin@orangenwerk.com", 
                                    :autor_fine_id => 'owerk_austin'


button_set = StyleSet.create!       :name => 'Buttons', 
                                    :despcription => 'fineline ButtonSet', 
                                    :fine_style_id => default_style.id, 
                                    :style_aktiv => true,
  
                                    :autor_name => 'Strange', 
                                    :autor_vorname => 'Austin', 
                                    :autor_email => "austin@orangenwerk.com", 
                                    :autor_fine_id => 'owerk_austin'



finelineButton = StyleObject.create!  :name => '.finelineButton', 
                                      :style_set_id => button_set.id, 
                                      :style_aktiv => true



finelineButton_css1 = StyleSheet.create!  :style_object_id => finelineButton.id, 
                                          :style_attribute => 'background', 
                                          :style_property => 'color', 
                                          :style_value1 => '336699', 
                                          :style_aktiv => true



   
   