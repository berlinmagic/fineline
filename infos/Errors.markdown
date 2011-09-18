# Fehlerprotokoll 18.09.2011


# BACKEND
	ecke subnavi wird doppelt gezeigt


# Allerts
	grafik falsch und zu groß, bleibt auch zu lange sichtbar
	GRAFIK: anpassbar?
   

# seitenverwaltung
	select sollte raus oder?
	click auf "view" meldet fehler 
	Sidebar
		- papierkorb und entwürfe anzeigen oder das lieber über einen icon machen
		- seiten sortierung
			- grafik noch fehlerfhaft (lightbox)
		- neue seite
			- darstellung fehlerhaft (titel: name doppelt)
			- darstellung fehlerhaft (neuer abschnitt)
			- darstellung fehlerhaft (seiteneinstellungen)

# sidebar
	?
	Hilfe
		- Hilfetext fehlt

# header
	headerbild bearbeiten/hochladen
       - darstellung fehlerhaft (lightbox: rahmen doppelt, icon, trennlinie, box allgemein)
       - vorhandenes bild aktualisieren (nach upload erscheint fehlerseite/ bild ist danach aber trotzdem vorhanden,
           ohne buttonclick "upload" zeigt allert falsche nachricht bzw. übersetzung, button: Hpic falsche                bezeichnung)
	vor. headerbild auswählen 
       - lightbox rahmen, icon fehlerhaft
       - inhalt wirkt so zu groß und zu klobig
       - hover über bildfelder zeigt einen blauen rahmen, dunkelgraues feld (besser so wie sonst)
       - sollte später in jedem fall über einen "Dateimanager" passieren (ähnlich "Bilder" nur mit 
           verschiedenen "Klassen" wie "Header/Portfolio/Content" etc)

# Bilder
	Bilderübersicht
       - am besten auch die pagination + icons einbauen
       - Bilderclick
           - optik anordnung anpassen 
           - optik taggs anpassen
           - trennlinie ist noch die alte
       - Taggclick
           - click auf "Tagg" meldet fehler 
	Bild hochladen
       - warum nicht auch über lightbox wie beim header (zusätzlich: Stil/Datum)
	Hilfe
       - Hilfetext fehlt

# News
	Neue News erstellen
		- hat auch ohne "Abschnitt" und "erweiterte einstellungen" geklappt
		- wird im frontend aber nicht gezeigt pbwohl ja eigentlich die neuste news
	News ansehen (im bearbeitenmodus??)
		- viel unnützer kram drin (action = show, id = 24, controller = admin/news, weitere Sein Zwecke der sorgen            weitere Sein Zwecke der sorgen news_id, 
		- trennlinien doppelt und alt
		- taggs 
			- optisch fehlerhaft aber funktioniert
		- kommentar
			- einfügen klappt 
			- darstellung fehlerhaft (icons)
			- kommentar editieren (eingabefenster zu lang)
			- kommentar löschen (lightbox "wirklich löschen" optisch anpassen)
				- löschen klappt
					- wenn ein vorhandener kommentar gelöscht, danach aber ein neuer erstellt wird                        erscheint der alte wieder!
	News bearbeiten
		- abschnitte
			- es werden aktuell 2 abschnitte (editor) angezeigt / jeweils mit "x gelöscht"
		- Kommentare
			- Darstellung Frontend "Kommentare" fehlerhaft (zu groß/icons) 
			- löschen funktioniert gar nicht
			- editieren darstellung fehlerhaft
		- taggs
			- fehler wie oben beschrieben
		- kategorien
			- ist mir nicht ganz klar was damit gemacht werden soll