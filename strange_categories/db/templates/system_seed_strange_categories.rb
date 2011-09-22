   


# encoding: utf-8

werteliste_1 = Werteliste.create! :name => 'Formular - Typen', :beschreibung => 'Diese Werte k&ouml;nnen Sie, einem Formular zuweisen. Der Formulartyp wird im Posteingang angezeigt.', :system_stuff => true

wert_11 = Wert.create! :inhalt => 'Kontakt', :position => 1, :werteliste_id => werteliste_1.id

wert_12 = Wert.create! :inhalt => 'Anfrage', :position => 2, :werteliste_id => werteliste_1.id

wert_13 = Wert.create! :inhalt => 'Feedback', :position => 3, :werteliste_id => werteliste_1.id


werteliste_2 = Werteliste.create! :name => 'Anrede', :beschreibung => 'Herr / Frau - Auswahl.', :system_stuff => true

wert_21 = Wert.create! :inhalt => 'Herr', :position => 1, :werteliste_id => werteliste_2.id

wert_22 = Wert.create! :inhalt => 'Frau', :position => 2, :werteliste_id => werteliste_2.id


werteliste_3 = Werteliste.create! :name => 'Text-Schatten', :beschreibung => 'Hier finden Sie einige vordefinierte Text-Schatten, welche Sie auf Ihre Seiten-Schriften anwenden können.', :system_stuff => true

wert_3_1 = Wert.create! :name => 'schwarzer Schatten', :inhalt => '1px 1px 1px #000', :position => 1, :werteliste_id => werteliste_3.id
wert_3_2 = Wert.create! :name => 'weißer Schatten', :inhalt => '1px 1px 1px #fff', :position => 2, :werteliste_id => werteliste_3.id
wert_3_3 = Wert.create! :name => 'schwarze Outline', :inhalt => '1px 1px 1px #000, -1px -1px 1px #000', :position => 3, :werteliste_id => werteliste_3.id
wert_3_4 = Wert.create! :name => 'weiße Outline', :inhalt => '1px 1px 1px #fff, -1px -1px 1px #fff', :position => 4, :werteliste_id => werteliste_3.id

werteliste_4 = Werteliste.create! :name => 'Box-Schatten', :beschreibung => 'Hier finden Sie einige vordefinierte Box-Schatten, welche Sie auf Ihre Seiten-Boxen anwenden können.', :system_stuff => true

wert_4_1 = Wert.create! :name => 'schwarzer aussen Schatten', :inhalt => '1px 1px 1px #000', :position => 1, :werteliste_id => werteliste_4.id
wert_4_2 = Wert.create! :name => 'weißer aussen Schatten', :inhalt => '1px 1px 1px #fff', :position => 1, :werteliste_id => werteliste_4.id
wert_4_3 = Wert.create! :name => 'schwarzer innen Schatten', :inhalt => 'inset 1px 1px 1px #000', :position => 1, :werteliste_id => werteliste_4.id
wert_4_4 = Wert.create! :name => 'weißer innen Schatten', :inhalt => 'inset 1px 1px 1px #fff', :position => 1, :werteliste_id => werteliste_4.id
wert_4_5 = Wert.create! :name => 'schwarze Outline', :inhalt => '0 0 1px 2px #000', :position => 1, :werteliste_id => werteliste_4.id
wert_4_6 = Wert.create! :name => 'weiße Outline', :inhalt => '0 0 1px 2px #fff', :position => 1, :werteliste_id => werteliste_4.id
wert_4_7 = Wert.create! :name => 'schwarze Inline', :inhalt => 'inset 0 0 1px 2px #000', :position => 1, :werteliste_id => werteliste_4.id
wert_4_8 = Wert.create! :name => 'weiße Inline', :inhalt => 'inset 0 0 1px 2px #fff', :position => 1, :werteliste_id => werteliste_4.id



   