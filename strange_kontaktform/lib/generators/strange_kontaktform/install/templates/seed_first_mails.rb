   


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
:inhalt => 'Wir frühen uns Ihnen mitteilen zu können, dass unser eigens für Sie entwickelstes CMS online ist.

fineline-cms.com

probieren Sie es aus!', :user_ip => '00.00.00.00', :neu => true, :firma => 'orangenwerk', :webseite => 'http://orangenwerk.com', :created_at => (Time.now - 14.days)

email_2 = KontaktFormular.create! :anrede => 'Herr', :name => 'fineline-Team', :email => 'cms@orangenwerk.com', :betreff => 'Herrzlich Willkommen', 
:strasse => 'Stralsunder Str. 20', :plz => '16515', :ort => 'Oranienburg', :inhalt => 'Wir begrüssen Sie auf Ihrer neuen Seite und wünschen viel spass und erfolg damit.
Sollten Sie fragen oder anregungen zu unserem CMS haben, kontaktieren Sie uns.

orangenwerk
Stralsunder Str. 20
16515 Oranienburg

03301 / 57 69 00
info@orangenwerk.com', :user_ip => '00.00.00.00', :neu => true, :firma => 'orangenwerk.com', :webseite => 'http://orangenwerk.com', :created_at => (Time.now - 27.hours)

email_3 = KontaktFormular.create! :anrede => 'Herr', :name => 'fineline-Admin', :email => 'admin@orangenwerk.com', :betreff => 'Aller Anfang ist schwer!', 
:inhalt => 'Ich begrüsse Sie auf Ihrer neuen Seite und wünschen viel spass und erfolg damit.

Haben Sie bitte keine Berührungsängste, Ihre neue Seite wird Sie nicht beissen und wir haben sie so konzipiert das Sie ohne Vorwarnung nichts unwiederruflich zerstören können.
Ein mächtiges BackUp-System ist in Arbeit, bis dies jedoch fertig ist sollten Sie folgendes beachten:
 - Sie können keine System-Seiten löschen (Kontakt, Impressum, Start, ..), dies ist erforderlich um die Seitenfunktion zu gewährleisten
 - Seiten welche Sie gelöscht haben, landen zunächst im Papierkorb und können Wiederhergestellt werden

 - Achtung: Text-Abschnitte sind momentan nicht gesichert, ändern Sie diese sorgfältig! (Sie können im Text-Editor je nach Betriebssystem mit [STRG]+[Z] oder mit [cmd]+[Z] Rückgängig machen.)
 
Ansonsten haben wir versucht alles selbsterklärend zu gestallten, drum schauen Sie sich erstmal um und lernen Sie Ihre neue Seite kennen.


Sollten Sie Fehler oder störungen entdecken, wenden Sie sich bitte an mich.

.. Ihr Administrator: austin [ admin@orangenwerk.com ]', :user_ip => '00.00.00.00', :neu => true, :firma => 'orangenwerk.com', :webseite => 'http://orangenwerk.com', :created_at => (Time.now - 307.minutes)

email_4 = KontaktFormular.create! :anrede => 'Herr', :name => 'fineline Support-Team', :email => 'support@orangenwerk.com', :betreff => 'Sind Sie zufrieden?', 
:inhalt => 'Wir hoffen Sie sind mit Ihrer neuen Seite zufrieden, sollte mal etwas nicht Ihrer Zufriedenheit entsprechen, geben Sie bescheid, wir sehen was sich tun lässt.

Ihr support-Team.
support@orangenwerk.com', :user_ip => '00.00.00.00', :neu => true, :firma => 'orangenwerk.com', :webseite => 'http://orangenwerk.com', :created_at => (Time.now - 134.minutes)

email_5 = KontaktFormular.create! :anrede => 'Herr', :name => 'Max Mustermann', :email => 'test_mail@2strange.net', :betreff => 'Test kontaktmail', 
:inhalt => 'Mustertext:
Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. 
Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, 
springe ich ein: der Blindtext. 
Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, 
freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - 
Sein ist wahrgenommen werden. Und weil Sie nun schon die Güte haben, 
mich ein paar weitere Sätze lang zu begleiten, möchte ich diese Gelegenheit nutzen, 
Ihnen nicht nur als Lückenfüller zu dienen, sondern auf etwas hinzuweisen, 
das es ebenso verdient wahrgenommen zu werden: Webstandards nämlich. Sehen Sie, 
Webstandards sind das Regelwerk, auf dem Webseiten aufbauen.', :user_ip => '00.00.00.00', :neu => true, :created_at => (Time.now - 13.minutes)

puts 'INFO: erste Mails erstellt.'

