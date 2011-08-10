   


# encoding: utf-8

std_header = Header.create! :name => 'Standard_Header', :stil => 'fader', :header_height => '210'

std_header_pic = HeaderPic.create! :name => 'fineline-Logo', :inhalt => 'simples und dennoch m&auml;chtiges Content-Management-System', :position => '1', :header_id => std_header.id, :bild_uid => '2011/07/15/12_04_22_291_finelineBanner.png', :bild_width => 2000, :bild_height => 500, :bild_cropping => '2000x424+0+51'

puts 'Header:: DB-Seed erstellt: ' << std_header.name

 