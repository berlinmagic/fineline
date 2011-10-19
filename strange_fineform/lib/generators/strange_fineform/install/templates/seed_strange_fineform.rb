   


# encoding: utf-8

werteliste_1 = Werteliste.create! :name => 'Formular - Typen', :beschreibung => 'Diese Werte k&ouml;nnen Sie, einem Formular zuweisen. Der Formulartyp wird im Posteingang angezeigt.', :system_stuff => true

wert_11 = Wert.create! :inhalt => 'Kontakt', :position => 1, :werteliste_id => werteliste_1.id

wert_12 = Wert.create! :inhalt => 'Anfrage', :position => 2, :werteliste_id => werteliste_1.id

wert_13 = Wert.create! :inhalt => 'Feedback', :position => 3, :werteliste_id => werteliste_1.id


werteliste_2 = Werteliste.create! :name => 'Anrede', :beschreibung => 'Herr / Frau - Auswahl.', :system_stuff => true

wert_21 = Wert.create! :inhalt => 'Herr', :position => 1, :werteliste_id => werteliste_2.id

wert_22 = Wert.create! :inhalt => 'Frau', :position => 2, :werteliste_id => werteliste_2.id



