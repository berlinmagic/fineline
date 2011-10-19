   


puts 'INFO: erstelle Portfolio-Seite'
gallerie_site = Seite.create!       :name => 'Portfolio',
                                    :system_seite => true, 
                                    :modul_seite => true, 
                                    :modul_name => 'strange_gallerie',
                                    :system_name => 'gallerie',
                                    :in_footer => true, 
                                    :in_header => false, 
                                    :in_main_nav => true,
                                    :meta_description => 'fineline CMS - Standard Portfolio-Seite', 
                                    :meta_keywords => 'fineline CMS, orangenwerk'
                              

gallerie_abb1 = Abschnitt.create!    :seite_id => gallerie_site.id,    :stuff_typ => 'trenn_linie'
gallerie_abb2 = Abschnitt.create!    :seite_id => gallerie_site.id,    :stuff_typ => 'text',
                                    :inhalt => '<p>Einleitungs-Text f&uuml;r das Portfolio-Modul.</p>'
gallerie_abb3 = Abschnitt.create!    :seite_id => gallerie_site.id,    :stuff_typ => 'trenn_linie'

gallerie_abb4 = Abschnitt.create!    :seite_id => gallerie_site.id,  
                                    :name => 'Kontakt-Formular',
                                    #:slug,
                                    :system_stuff => true, 
                                    #:protected, 
                                    #:gruppe_id,
                                    :stuff_typ => 'main_gallerie', 
                                    #:stuff_param, 
                                    :modul => 'strange_gallerie'
                                    #:modul_typ,
                                    #:modul_id, 
                                    #:inhalt
                                    

gallerie_abb5 = Abschnitt.create!    :seite_id => gallerie_site.id,    :stuff_typ => 'trenn_linie'
gallerie_abb6 = Abschnitt.create!    :seite_id => gallerie_site.id,    :stuff_typ => 'text',
                                    :inhalt => '<p><em>Abschluss-Text f&uuml;r das Portfolio-Modul.</em></p>'


puts 'INFO: Seite erstellt: ' << gallerie_site.name


   