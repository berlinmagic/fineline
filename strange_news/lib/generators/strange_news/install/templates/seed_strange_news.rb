   


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


@lorem_worte = %w[&Uuml;berall dieselbe alte Leier Das Layout ist fertig der Text l&auml;sst auf sich warten Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt springe ich ein: der Blindtext Genau zu diesem Zwecke erschaffen immer im Schatten meines gro&szlig;en Bruders &raquo;Lorem Ipsum&laquo; freue ich mich jedes Mal wenn Sie ein paar Zeilen lesen Denn esse est percipi  Sein ist wahrgenommen werden Und weil Sie nun schon die G&uuml;te haben mich ein paar weitere S&auml;tze lang zu begleiten m&ouml;chte ich diese Gelegenheit nutzen Ihnen nicht nur als L&uuml;ckenf&uuml;ller zu dienen sondern auf etwas hinzuweisen das es ebenso verdient wahrgenommen zu werden: Webstandards n&auml;mlich Sehen Sie Webstandards sind das Regelwerk auf dem Webseiten aufbauen So gibt es Regeln f&uuml;r HTML CSS JavaScript oder auch XML; Worte die Sie vielleicht schon einmal von Ihrem Entwickler geh&ouml;rt haben Diese Standards sorgen daf&uuml;r dass alle Beteiligten aus einer Webseite den gr&ouml;&szlig;ten Nutzen ziehen Im Gegensatz zu fr&uuml;heren Webseiten m&uuml;ssen wir zum Beispiel nicht mehr zwei verschiedene Webseiten f&uuml;r den Internet Explorer und einen anderen Browser programmieren Es reicht eine Seite die  richtig angelegt  sowohl auf verschiedenen Browsern im Netz funktioniert aber ebenso gut f&uuml;r den Ausdruck oder die Darstellung auf einem Handy geeignet ist Wohlgemerkt: Eine Seite f&uuml;r alle Formate Was f&uuml;r eine Erleichterung Standards sparen Zeit bei den Entwicklungskosten und sorgen daf&uuml;r dass sich Webseiten sp&auml;ter leichter pflegen lassen Nat&uuml;rlich nur dann wenn sich alle an diese Standards halten Das gilt f&uuml;r Browser wie Firefox Opera Safari und den Internet Explorer ebenso wie f&uuml;r die Darstellung in Handys Und was k&ouml;nnen Sie f&uuml;r Standards tun Fordern Sie von Ihren Designern und Programmieren einfach standardkonforme Webseiten Ihr Budget wird es Ihnen auf Dauer danken Ebenso m&ouml;chte ich Ihnen daf&uuml;r danken dass Sie mich bin zum Ende gelesen haben Meine Mission ist erf&uuml;llt Ich werde hier noch die Stellung halten bis der geplante Text eintrifft Ich w&uuml;nsche Ihnen noch einen sch&ouml;nen Tag Und arbeiten Sie nicht zuviel]

@lorem_texte = [ '&Uuml;berall dieselbe alte Leier. Das Layout ist fertig, der Text l&auml;sst auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines gro&szlig;en Bruders &raquo;Lorem Ipsum&laquo;, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden. Und weil Sie nun schon die G&uuml;te haben, mich ein paar weitere S&auml;tze lang zu begleiten, m&ouml;chte ich diese Gelegenheit nutzen, Ihnen nicht nur als L&uuml;ckenf&uuml;ller zu dienen, sondern auf etwas hinzuweisen, das es ebenso verdient wahrgenommen zu werden: Webstandards n&auml;mlich. Sehen Sie, Webstandards sind das Regelwerk, auf dem Webseiten aufbauen. So gibt es Regeln f&uuml;r HTML, CSS, JavaScript oder auch XML; Worte, die Sie vielleicht schon einmal von Ihrem Entwickler geh&ouml;rt haben. Diese Standards sorgen daf&uuml;r, dass alle Beteiligten aus einer Webseite den gr&ouml;&szlig;ten Nutzen ziehen. Im Gegensatz zu fr&uuml;heren Webseiten m&uuml;ssen wir zum Beispiel nicht mehr zwei verschiedene Webseiten f&uuml;r den Internet Explorer und einen anderen Browser programmieren.', 
  
'Es reicht eine Seite, die - richtig angelegt - sowohl auf verschiedenen Browsern im Netz funktioniert, aber ebenso gut f&uuml;r den Ausdruck oder die Darstellung auf einem Handy geeignet ist. Wohlgemerkt: Eine Seite f&uuml;r alle Formate. Was f&uuml;r eine Erleichterung. Standards sparen Zeit bei den Entwicklungskosten und sorgen daf&uuml;r, dass sich Webseiten sp&auml;ter leichter pflegen lassen. Nat&uuml;rlich nur dann, wenn sich alle an diese Standards halten. Das gilt f&uuml;r Browser wie Firefox, Opera, Safari und den Internet Explorer ebenso wie f&uuml;r die Darstellung in Handys. Und was k&ouml;nnen Sie f&uuml;r Standards tun? Fordern Sie von Ihren Designern und Programmieren einfach standardkonforme Webseiten. Ihr Budget wird es Ihnen auf Dauer danken. Ebenso m&ouml;chte ich Ihnen daf&uuml;r danken, dass Sie mich bin zum Ende gelesen haben. Meine Mission ist erf&uuml;llt. Ich werde hier noch die Stellung halten, bis der geplante Text eintrifft. Ich w&uuml;nsche Ihnen noch einen sch&ouml;nen Tag. Und arbeiten Sie nicht zuviel!', 

'Dies ist ein Typoblindtext. An ihm kann man sehen, ob alle Buchstaben da sind und wie sie aussehen. Manchmal benutzt man Worte wie Hamburgefonts, Rafgenduks oder Handgloves, um Schriften zu testen. Manchmal S&auml;tze, die alle Buchstaben des Alphabets enthalten - man nennt diese S&auml;tze &raquo;Pangrams&laquo;. Sehr bekannt ist dieser: The quick brown fox jumps over the lazy old dog. Oft werden in Typoblindtexte auch fremdsprachige Satzteile eingebaut (AVAIL&reg; and Wefox&trade; are testing aussi la Kerning), um die Wirkung in anderen Sprachen zu testen. In Lateinisch sieht zum Beispiel fast jede Schrift gut aus. Quod erat demonstrandum. Seit 1975 fehlen in den meisten Testtexten die Zahlen, weswegen nach TypoGb. 204 &sect; ab dem Jahr 2034 Zahlen in 86 der Texte zur Pflicht werden. Nichteinhaltung wird mit bis zu 245 &euro; oder 368 $ bestraft. Genauso wichtig in sind mittlerweile auch Akzente, die in neueren Schriften aber fast immer enthalten sind. Ein wichtiges aber schwierig zu integrierendes Feld sind OpenType-Funktionalit&auml;ten. Je nach Software und Voreinstellungen k&ouml;nnen eingebaute Kapit&auml;lchen, Kerning oder Ligaturen (sehr pfiffig) nicht richtig dargestellt werden.', 

'Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zw&ouml;lf Boxk&auml;mpfer jagen Viktor quer &uuml;ber den gro&szlig;en Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd a&szlig;en M&auml;xchens V&ouml;gel R&uuml;ben, Joghurt und Quark. &quot;Fix, Schwyz! &quot; qu&auml;kt J&uuml;rgen bl&ouml;d vom Pa&szlig;. Victor jagt zw&ouml;lf Boxk&auml;mpfer quer &uuml;ber den gro&szlig;en Sylter Deich. Falsches &Uuml;ben von Xylophonmusik qu&auml;lt jeden gr&ouml;&szlig;eren Zwerg. Heiz&ouml;lr&uuml;cksto&szlig;abd&auml;mpfung', 

'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental. A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es.', 

'Auch gibt es niemanden, der den Schmerz an sich liebt, sucht oder w&uuml;nscht, nur, weil er Schmerz ist, es sei denn, es kommt zu zuf&auml;lligen Umst&auml;nden, in denen M&uuml;hen und Schmerz ihm gro&szlig;e Freude bereiten k&ouml;nnen. Um ein triviales Beispiel zu nehmen, wer von uns unterzieht sich je anstrengender k&ouml;rperlicher Bet&auml;tigung, au&szlig;er um Vorteile daraus zu ziehen? Aber wer hat irgend ein Recht, einen Menschen zu tadeln, der die Entscheidung trifft, eine Freude zu genie&szlig;en, die keine unangenehmen Folgen hat, oder einen, der Schmerz vermeidet, welcher keine daraus resultierende Freude nach sich zieht?', 

'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero.',

'Was machte ich eigentlich hier drau&szlig;en? Was war der Grund f&uuml;r diese Reise? Streifte ich blo&szlig; umher in irgendeiner Art von Drogenrausch oder war ich wirklich nach Las Vegas gekommen, um an einen Artikel zu arbeiten&hellip; Wer sind diese Leute? Die Gesichter? Wo kommen sie her? Sie sehen aus, wie Karikaturen von Gebrauchtwagenh&auml;ndlern aus Dallas, du gro&szlig;er Gott. Am Sonntagmorgen um halb f&uuml;nf liegen h&ouml;llisch viele von denen hier rum, klammern sich immer noch an den amerikanischen Traum. Die Vision vom gro&szlig;en Gewinner, der pl&ouml;tzlich aus dem fr&uuml;hmorgendlichen Chaos eines runtergekommen Las Vegas Casino&rsquo; s auftaucht [&hellip;] Nein, nein beruhige dich, lerne das Verlieren zu genie&szlig;en.',

'Wir hatten zwei Beutel Gras, f&uuml;nfundsiebzig K&uuml;gelchen Meskalin, f&uuml;nf L&ouml;schblattb&ouml;gen extrastarkes Acid, einen Salzstreuer halbvoll mit Kokain und ein ganzes Spektrum vielfarbiger Upper, Downer, Heuler, Lacher &hellip; sowie eine Flasche Tequila, eine Flasche Rum, eine Kiste Bier, einen halben Liter unverd&uuml;nnten &Auml;ther und zwei Dutzend Poppers. Den ganzen Kram hatten wir in der Nacht zuvor zusammengerafft, auf einer wilden H&ouml;llenfahrt durch den gesamten Los-Angeles-Bezirk; von Topanga bis Watts griffen wir uns alles, dessen wir habhaft werden konnten. Nicht, da&szlig; wir das ganze Zeug f&uuml;r den Trip wirklich brauchten, aber wenn man sich einmal darauf einl&auml;&szlig;t, eine ernsthafte Drogen-Sammlung anzulegen, neigt man eben dazu, extrem zu werden.',

'Mach das Radio an, mach den Kassettenrecorder an. Mach das verdammte Fenster runter. Lass uns den k&uuml;hlen W&uuml;stenwind schmecken. Oh ja, genau darum geht es. Totale Kontrolle! An einem Samstagabend in Vegas die Hauptstra&szlig;e runter gondeln. Zwei Freunde in einem paradiesapfelroten Cabrio, stoned, besoffen, abgedreht, gute Menschen.',

'Da geht er hin, einer von Gottes eigenen Prototypen, ein aufgemotzter Mutant von der Sorte, die nie zur Massenproduktion in Betracht gezogen wurde. Zu spleenig zum leben und zu selten zum sterben.',

'.. ach, dieser verteufelte Ether. Durch ihn benimmt man sich wie ein Dorfs&auml;ufer in einem fr&uuml;hen Irischen Roman. Mann verliert alle grundlegenden motorischen F&auml;higkeiten, verschwommene Sicht, fehlender Gleichgewichtssinn, taube Zunge. Dein Verstand wendet sich mit Grausen ab, unf&auml;hig mit der Wirbels&auml;ule zu kommunizieren. Interessant ist, da&szlig; mann sich selber dabei beobachten kann, wie mann sich auf diese schreckliche Weise benimmt. Aber mann kann es nicht kontrollieren...',

'Wir sind jetzt alle auf einem &Uuml;berlebenstrip. Vom Tempo der 60er ist nichts mehr &uuml;brig.
Das war das Manko an Timothy Learys Trip. Er zog durch Amerika und verkaufte Bewusstseinserweiterungen ohne auch nur einen Gedanken an die grimmigen Fleischerhaken der Realit&auml;t zu verschwenden, die auf all die Menschen lauerten, die ihn erst nahmen. All jene bemitleidenswerten Acidfreaks, die dachten sie k&ouml;nnten f&uuml;r 3$ den Kick &bdquo;Frieden &amp; Verst&auml;ndnis&ldquo; kaufen. Aber ihre Niederlage und ihr Schaden sind auch die unseren.
Was mit Leary zusammen den Bach runterging war die zentrale Illusion eines Lebensstils, den er mitkreierte. Eine Generation von unheilbaren Kr&uuml;ppeln, gescheiterten Suchern, die niemals den essentiellen mystischen Trugschluss der &bdquo;Acidkultur&ldquo; verstanden hatten. Die verzweifelte annahme, das jemand oder zumindest irgendeine Kraft sich um das Licht am ende des Tunnels k&uuml;mmert.' ]

# => {}&quot;#{@lorem_worte[rand(325)] }&quot;&quot;#{@lorem_texte[rand(6)] }&quot;

%w[blindtext muster beispiel ballspiel layout-hilfe platzhalter vorschau example mockup].each do |tag|
  puts('erstelle Tag '+ tag)
  Tag.create! :name => tag
end

23.times do 
  @headline = []
  tima = rand(5) + 2
  a_tima = rand(2) + 1
  t_tima = rand(3) + 1
  tima.to_i.times do
    @headline << @lorem_worte[rand(325)] if @lorem_worte[rand(325)]
  end
  @user = rand(4) + 1
  @date = Time.mktime(2011 - rand(4),rand(10)+1,rand(25)+1)
  
  
  puts('erstelle News:: '+ @headline.join(' ').to_s)
  
  @newz = News.create!   :headline => @headline.join(' ').to_s, :user_id => @user, :beschreibung => @lorem_texte[rand(6)].to_s, :datum => @date
  
  a_tima.to_i.times do
    NewsAbschnitt.create! :news_id => @newz.id, :stuff_typ => 'trenn_linie'
    NewsAbschnitt.create! :news_id => @newz.id, :inhalt => @lorem_texte[rand(12)].to_s, :stuff_typ => 'text'
  end
  t_tima.to_i.times do
    if tag = Tag.find( rand(8) + 1  )
      @newz.tags << tag
    end
  end
end


