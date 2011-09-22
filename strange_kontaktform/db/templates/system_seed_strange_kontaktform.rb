   


puts 'INFO: erstelle Kontakt-Seite'
kontakt = Seite.create!       :name => 'Kontakt', 
                              :system_seite => true, 
                              :modul_seite => true, 
                              :modul_name => 'strange_kontaktform',
                              :system_name => 'kontakt',
                              :in_footer => true, 
                              :in_header => true, 
                              :in_main_nav => false, 
                              :meta_description => 'fineline CMS - Standard Kontakt-Seite', 
                              :meta_keywords => 'fineline CMS, orangenwerk'
                              

kontakt_abb1 = Abschnitt.create!    :seite_id => kontakt.id,    :stuff_typ => 'trenn_linie'
kontakt_abb2 = Abschnitt.create!    :seite_id => kontakt.id,    :stuff_typ => 'text',
                                    :inhalt => '<p>Einleitungs-Text f&uuml;r das Kontaktformular sollte dann <strong>Hier</strong> stehen.</p>'
kontakt_abb3 = Abschnitt.create!    :seite_id => kontakt.id,    :stuff_typ => 'trenn_linie'

kontakt_abb4 = Abschnitt.create!    :seite_id => kontakt.id,  
                                    :name => 'Kontakt-Formular',
                                    #:slug,
                                    :system_stuff => true, 
                                    #:protected, 
                                    #:gruppe_id,
                                    :stuff_typ => 'k_form', 
                                    #:stuff_param, 
                                    :modul => 'strange_kontaktform'
                                    #:modul_typ,
                                    #:modul_id, 
                                    #:inhalt
                                    

kontakt_abb5 = Abschnitt.create!    :seite_id => kontakt.id,    :stuff_typ => 'trenn_linie'
kontakt_abb6 = Abschnitt.create!    :seite_id => kontakt.id,    :stuff_typ => 'text',
                                    :inhalt => '<p><em>Abschluss-Text f&uuml;r das Kontaktformular k&ouml;nnte dann <strong>Hier</strong> stehen.</em></p>'


puts 'INFO: Seite erstellt: ' << kontakt.name



   