   


# encoding: utf-8

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

 

email_1 = KontaktFormular.create! :anrede => 'Herr', :name => 'fineline-Team', :email => 'cms@orangenwerk.com', :betreff => 'fineline geht online', 
:inhalt => 'Wir fr&uuml;hen uns Ihnen mitteilen zu k&ouml;nnen, dass unser eigens f&uuml;r Sie entwickelstes CMS online ist.

fineline-cms.com

probieren Sie es aus!', :user_ip => '00.00.00.00', :neu => true, :firma => 'orangenwerk', :webseite => 'http://orangenwerk.com', :created_at => (Time.now - 14.days)

email_2 = KontaktFormular.create! :anrede => 'Herr', :name => 'fineline-Team', :email => 'cms@orangenwerk.com', :betreff => 'Herrzlich Willkommen', 
:strasse => 'Stralsunder Str. 20', :plz => '16515', :ort => 'Oranienburg', :land => 'Deutschland', :inhalt => 'Wir begr&uuml;ssen Sie auf Ihrer neuen Seite und w&uuml;nschen viel spass und erfolg damit.
Sollten Sie fragen oder anregungen zu unserem CMS haben, kontaktieren Sie uns.

orangenwerk
Stralsunder Str. 20
16515 Oranienburg

03301 / 57 69 00
info@orangenwerk.com', :user_ip => '00.00.00.00', :neu => true, :firma => 'orangenwerk.com', :webseite => 'http://orangenwerk.com', :created_at => (Time.now - 27.hours)

email_3 = KontaktFormular.create! :anrede => 'Herr', :name => 'fineline-Admin', :email => 'admin@orangenwerk.com', :betreff => 'Aller Anfang ist schwer!', 
:inhalt => 'Ich begr&uuml;sse Sie auf Ihrer neuen Seite und w&uuml;nschen viel spass und erfolg damit.

Haben Sie bitte keine Ber&uuml;hrungs&auml;ngste, Ihre neue Seite wird Sie nicht beissen und wir haben sie so konzipiert das Sie ohne Vorwarnung nichts unwiederruflich zerst&ouml;ren k&ouml;nnen.
Ein m&auml;chtiges BackUp-System ist in Arbeit, bis dies jedoch fertig ist sollten Sie folgendes beachten:
 - Sie k&ouml;nnen keine System-Seiten l&ouml;schen (Kontakt, Impressum, Start, ..), dies ist erforderlich um die Seitenfunktion zu gew&auml;hrleisten
 - Seiten welche Sie gel&ouml;scht haben, landen zun&auml;chst im Papierkorb und k&ouml;nnen Wiederhergestellt werden

 - Achtung: Text-Abschnitte sind momentan nicht gesichert, &auml;ndern Sie diese sorgf&auml;ltig! (Sie k&ouml;nnen im Text-Editor je nach Betriebssystem mit [STRG]+[Z] oder mit [cmd]+[Z] R&uuml;ckg&auml;ngig machen.)
 
Ansonsten haben wir versucht alles selbsterkl&auml;rend zu gestallten, drum schauen Sie sich erstmal um und lernen Sie Ihre neue Seite kennen.


Sollten Sie Fehler oder st&ouml;rungen entdecken, wenden Sie sich bitte an mich.

.. Ihr Administrator: austin [ admin@orangenwerk.com ]', :user_ip => '00.00.00.00', :neu => true, :firma => 'orangenwerk.com', :webseite => 'http://orangenwerk.com', :created_at => (Time.now - 307.minutes)

email_4 = KontaktFormular.create! :anrede => 'Herr', :name => 'fineline Support-Team', :email => 'support@orangenwerk.com', :betreff => 'Sind Sie zufrieden?', 
:inhalt => 'Wir hoffen Sie sind mit Ihrer neuen Seite zufrieden, sollte mal etwas nicht Ihrer Zufriedenheit entsprechen, geben Sie bescheid, wir sehen was sich tun l&auml;sst.

Ihr support-Team.
support@orangenwerk.com', :user_ip => '00.00.00.00', :neu => true, :firma => 'orangenwerk.com', :webseite => 'http://orangenwerk.com', :created_at => (Time.now - 134.minutes)

email_5 = KontaktFormular.create! :anrede => 'Herr', :name => 'Max Mustermann', :email => 'test_mail@2strange.net', :betreff => 'Test kontaktmail', 
:inhalt => 'Mustertext:
&Uuml;berall dieselbe alte Leier. Das Layout ist fertig, der Text l&auml;sst auf sich warten. 
Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, 
springe ich ein: der Blindtext. 
Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, 
freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - 
Sein ist wahrgenommen werden. Und weil Sie nun schon die G&uuml;te haben, 
mich ein paar weitere S&auml;tze lang zu begleiten, m&ouml;chte ich diese Gelegenheit nutzen, 
Ihnen nicht nur als L&uuml;ckenf&uuml;ller zu dienen, sondern auf etwas hinzuweisen, 
das es ebenso verdient wahrgenommen zu werden: Webstandards n&auml;mlich. Sehen Sie, 
Webstandards sind das Regelwerk, auf dem Webseiten aufbauen.', :user_ip => '00.00.00.00', :neu => true, :created_at => (Time.now - 13.minutes)

puts 'INFO: erste Mails erstellt.'

