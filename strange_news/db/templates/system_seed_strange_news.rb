   


# encoding: utf-8

puts 'INFO: erstelle News-Seite'
news_site = Seite.create!           :name => 'Aktuelles', 
                                    :system_seite => true, 
                                    :modul_seite => true, 
                                    :modul_name => 'strange_news',
                                    :system_name => 'news_site',
                                    :in_footer => true, 
                                    :in_header => false, 
                                    :in_main_nav => true, 
                                    :meta_description => 'fineline CMS - Standard News-Seite', 
                                    :meta_keywords => 'fineline CMS, orangenwerk'
                              

news_abb1 = Abschnitt.create!       :seite_id => news_site.id,    :stuff_typ => 'trenn_linie'
news_abb2 = Abschnitt.create!       :seite_id => news_site.id,    :stuff_typ => 'text',
                                    :inhalt => '<p>Einleitungs-Text f&uuml;r das News-Modul.</p>'
news_abb3 = Abschnitt.create!       :seite_id => news_site.id,    :stuff_typ => 'trenn_linie'

news_abb4 = Abschnitt.create!       :seite_id => news_site.id,  
                                    :name => 'Kontakt-Formular',
                                    #:slug,
                                    :system_stuff => true, 
                                    #:protected, 
                                    #:gruppe_id,
                                    :stuff_typ => 'news_modul', 
                                    #:stuff_param, 
                                    :modul => 'strange_news'
                                    #:modul_typ,
                                    #:modul_id, 
                                    #:inhalt
                                    

news_abb5 = Abschnitt.create!       :seite_id => news_site.id,    :stuff_typ => 'trenn_linie'
news_abb6 = Abschnitt.create!       :seite_id => news_site.id,    :stuff_typ => 'text',
                                    :inhalt => '<p><em>Abschluss-Text f&uuml;r das News-Modul.</em></p>'


puts 'INFO: Seite erstellt: ' << news_site.name


   