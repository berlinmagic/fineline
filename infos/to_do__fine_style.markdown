# fineline Style-Modul

	bla bla ..
	
# Sortierung


	Schrift:
		font               Schrift	font-family, font-weight, font-size, font-style, font-variant, line-height
		caption            icon, menu, message-box, small-caption, status-bar, icon, menu, message-box, small-caption, caption, Inherit
		font-family        Schriftfamilie	Schriftart, Inherit
		font-size          Schriftgröße	Längenangabe, Prozentangabe, xx-small, x-small, small, smaller, medium, large, x-large, xx-large, larger, Inherit
		font-style         Schriftstil	italic, oblique, normal, Inherit
		font-variant       Kapitälchen	small-caps, normal, Inherit
		font-weight        Schriftgewicht	normal, bold, bolder, lighter, 100 - 900, Inherit
		
	
	Text:
		direction	       Schreibrichtung	ltr, rtl, Inherit
		letter-spacing	   Zeichenabstand	normal, Längenangabe, Inherit
		line-height	       Zeilenhöhe	normal, Zahl, Längenangabe oder Prozentangabe, Inherit
		text-align	       Horizontale Ausrichtung	left,right,center,justify, Inherit
		text-decoration	   Textdekoration	none, underline, overline, line-through, blink, Inherit
		text-indent	       Texteinrückung	Längen- oder Prozentangabe, Inherit
		text-transform	   Großschreibung	lowercase, uppercase, capitalize, none, Inherit
		unicode-bidi	   Vertikale Ausrichtung	normal, embed, bidi-override, Inherit
		vertical-align     Längen- oder Prozentangabe, sub,super, baseline, top, bottom, middle, text-top, text-bottom, Inherit
		white-space	       Textumbruch	normal, pre, nowrap, pre-line, pre-wrap, Inherit
		word-spacing	   Wortabstand	Längenangabe, normal, Inherit
		text-shadow	       Textschatten	Farbangabe, Längenangabe
		color					Vordergrundfarbe	Farbangabe, Inherit
		
	
	Rahmen:
		border				border-color, border-style, border-width, Inherit
		border-color		Rahmenfarbe	transparent, Eine der Farbangabe, Inherit
		border-style		Rahmenart	none, dotted, dashed, solid, double, groove, ridge, inset, outset, Inherit
		border-width		Rahmenbreite	thin, medium, thick, Längenangabe, Inherit
		
		outline				Kontur	Die Werte für outline-color, outline-style, outline-width, Inherit
		outline-color		Konturfarbe	invert, Eine der Farbangabe, Inherit
		outline-style		Konturstil	none, dotted, dashed, solid, double, groove, ridge, inset, outset, Inherit
		outline-width		Konturbreite	thin, medium, thick, Längenangabe, Inherit
		
	
	Außenabstände:
		margin				Außenabstand	Längenangabe, Prozentangabe, auto, Inherit
		margin-bottom		Außenabstand unten	Längenangabe, Prozentangabe, auto, Inherit
		margin-left			Außenabstand links	Längenangabe, Prozentangabe, auto, Inherit
		margin-right		Außenabstand rechts	Längenangabe, Prozentangabe, auto, Inherit
		margin-top			Außenabstand oben	Längenangabe, Prozentangabe, auto, Inherit
		
	
	
	Innenabstände:
		padding				Innenabstand	Längenangabe, Prozentangabe, Inherit
		padding-bottom		Innenabstand unten	Längenangabe, Prozentangabe, Inherit
		padding-left		Innenabstand links	Längenangabe, Prozentangabe, Inherit
		padding-right		Innenabstand rechts	Längenangabe, Prozentangabe, Inherit
		padding-top			Innenabstand oben	Längenangabe, Prozentangabe, Inherit
		
	
	
	Position:
		bottom				Position unten	Längenangabe, Prozentangabe, auto, Inherit
		clear				Text umfließen beenden	left, right, both, none, Inherit
		clip				Ausschnitt	rect(), auto, Inherit
		display				Anzeigeart	none, block, inline, inline-block, list-item, compact, run-in, table-..., Inherit
		float				Text umfließen	left, right, none, Inherit
		height				Höhe	Längenangabe, Prozentangabe, auto, Inherit
		left				Position links	Längenangabe, Prozentangabe, auto, Inherit
		max-height			Maximale Höhe	Längenangabe, Prozentangabe, none, Inherit
		max-width			Maximale Breite	Längenangabe, Prozentangabe, none, Inherit
		min-height			Minimale Höhe	Längenangabe, Prozentangabe, Inherit
		min-width			Minimale Breite	Längenangabe, Prozentangabe, Inherit
		overflow			Überlauf	visible, hidden, scroll, auto, Inherit
		position			Positionsart	absolute, relative, static, fixed, Inherit
		right				Position rechts	Längenangabe, Prozentangabe, auto, Inherit
		top					Position oben	Längenangabe, Prozentangabe, auto, Inherit
		visibility			Unsichtbar	visible,hidden, collapse, Inherit
		width				Breite	Längenangabe, Prozentangabe, auto, Inherit
		z-index				Überlappung	Zahl, auto, Inherit
	
	
	Listen & Tabellen:
		listen:
		list-style				list-style-image, list-style-position, list-style-type
		list-style-image		Aufzählungsgrafik	none, url(), Inherit
		list-style-position		Listenzeichen einrücken	inside, outside, Inherit
		list-style-type			Aufzählungszeichen	none,circle,square,disc, decimal, lower-alpha, upper-alpha, lower-roman, upper-roman, lower-greek, decimal-leading-zero, hebrew, armenian, georgian, cjk-ideographic, hiragana, katakana, hiragana-iroha, katakana-iroha
		tabellen:
		border-collapse		Tabellenrahmen	collapse, separate, Inherit
		border-spacing		Tabellenrahmenabstände	Längenangabe, Inherit
		caption-side		Tabellenüberschrift	top, bottom, Inherit
		empty-cells			Leere Zellen	show, hide, Inherit
		table-layout		Tabellenlayout	auto, fixed, Inherit
		
	
	
	Hintergrund:
		background				background-color, background-image, background-attachment, background-repeat, background-position, Inherit
		background-attachment	Hintergrund fixieren	fixed, scroll, Inherit
		background-image		Hintergrundbild	url(), none, Inherit
		background-position		Hintergrundbild positionieren	left, right, center, top, bottom, center, Kombinationen:
								Längenangabe Längenangabe
								Prozentangabe Längenangabe
								Längenangabe Prozentangabe
								Schlüsselwort Schlüsselwort, Inherit
		background-repeat		Hintergrund wiederholen	no-repeat, repeat, repeat-x, repeat-y, Inherit
		background-color		Hintergrundfarbe	transparent, Farbangabe, Inherit
		color					Vordergrundfarbe	Farbangabe, Inherit
		


# Pseudo

	:active	Hyperlink 
	:first-child 
	:last-child 
	:focus 
	:hover 
	:lang 
	:link 
	:visited





# elemente
	background:
		color:
		verlauf:
		image:
		position:
		
	
	font:
		family:
		size:
		color:
		style:
		weight:
		
	
	text:
		shadow:
		line-height:
		align
		..
		direction	       Schreibrichtung	ltr, rtl, Inherit
		letter-spacing	   Zeichenabstand	normal, Längenangabe, Inherit
		line-height	       Zeilenhöhe	normal, Zahl, Längenangabe oder Prozentangabe, Inherit
		text-align	       Horizontale Ausrichtung	left,right,center,justify, Inherit
		text-decoration	   Textdekoration	none, underline, overline, line-through, blink, Inherit
		text-indent	       Texteinrückung	Längen- oder Prozentangabe, Inherit
		text-transform	   Großschreibung	lowercase, uppercase, capitalize, none, Inherit
		unicode-bidi	   Vertikale Ausrichtung	normal, embed, bidi-override, Inherit
		vertical-align     Längen- oder Prozentangabe, sub,super, baseline, top, bottom, middle, text-top, text-bottom, Inherit
		white-space	       Textumbruch	normal, pre, nowrap, pre-line, pre-wrap, Inherit
		word-spacing	   Wortabstand	Längenangabe, normal, Inherit
		text-shadow	       Textschatten	Farbangabe, Längenangabe
		
	
	margin / padding:
		4
		3
		2
		1
		
	
	display: block, inline, inline-block, none
	
	visibility: ..
	
	size:
		height:
		width:
		min- / max- ..
	
	
	box:
		shadow:
		
	position: relative, absolute
	left:
	top:
	bottom:
	right:
	
	z-index:
	
	overflow:
	
	border:
		style:
		type:
		width:
		round:
		
	
	outline:
		style:
		type:
		width:
		round?
	
	
	float: left, right, none
	
	vertical-align: top, center / middle, bottom
	
	list-style:
		..
		..
		
	
