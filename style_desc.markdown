#fineline Style-Helper
The fineline Style Helpers produces Cross-Browser CSS3-Code! ... Better to read, better to maintain, better flexibility!

##	Gradien :: Verlauf 	
horizontal / vertikal / radial / diagonal1 / diagonal2 ..+.. up to 9 colors:  % => 'color'
	
	fine_Gradient( 'vertikal', 0 => 'ccc', 40 => 'a00', 60 => '0a0', 100 => 'fff' )


##	BorderRadius :: Runde Ecken
4 Values::Werte => left-top::links-oben, right-top::rechts-oben, right-bottom::rechts-unten, left-bottom::links-unten .. wenn nicht vergeben = 0
	
	fineBorderRadius( '1px', '5px', '5px', '5px' )


##	BorderRadius :: Runde Ecken
1 Value::Wert => all-border::alle-ecken
	
	fine_borderRadius( '1px' )


##	BoxShadow :: Objekt Schatten
todo: description .. 
	
	fine_boxShadow( 'inset 1px 1px 3px 1px #888' )


##	TextShadow :: Text Schatten
todo: description .. 
	
	fine_textShadow( '0 0 3px #082f55, 0 0 3px #082f55' )


##	simple Gradient :: einfacher Verlauf
only vertical :: nur vertikal ! .. 2 colors :: 2 farben
	
	fine_backgroundGradient( '#f5f2f2', '#999999' )


##	CSS - Minify :: CSS minimierung
compress css if Strangecms::Config::compress_stylez is activ :: komprimiert CSS-Code wenn Strangecms::Config::compress_stylez aktiv ist
	
	fine_css_minify( css_code )


##	JS - Minify :: Javascript minimierung
compress js if Strangecms::Config::compress_scriptz is activ :: komprimiert Javascript-Code wenn Strangecms::Config::compress_scriptz aktiv ist
	
	fine_js_minify( js_code )


##	
... by Austin Strange!