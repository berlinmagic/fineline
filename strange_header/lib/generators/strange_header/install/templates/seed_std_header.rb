   


# encoding: utf-8

std_header = Header.create! :name => 'Standard_Header', :typ => 'fader', :height => 210, :width => 950, :staytime => 5, :changetime => 5, :hintergrund => 'verlauf', :farbe1 => '#001f46', :farbe2 => '#003366'

std_header_pic = Hpic.create! :name => 'fineline-Logo', :inhalt => 'simples und dennoch m&auml;chtiges Content-Management-System', :position => '1', :bild_uid => '2011/07/15/12_04_22_291_finelineBanner.png', :bild_cropping => '2000x424+0+51'

std_header.hpics << std_header_pic

puts 'Header:: DB-Seed erstellt: ' << std_header.name

 