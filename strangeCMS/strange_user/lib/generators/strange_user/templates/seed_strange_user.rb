   


# encoding: utf-8

puts 'CMS_User:: ERSTELLE Gruppen und Rechte:'

owner_gruppe = Gruppe.create!   :name => 'Seiten-Inhaber',
                                :system_name => 'owner',
                                :backend => true,
                                :position => 1,
                                :show => true, :new => true,
                                :edit_own => true, :edit_crew => true, :edit_all => true,
                                :del_own => true, :del_crew => true, :del_all => true,
                                :modify => true,
                                :content_admin => true,
                                :design_admin => true,
                                :system_admin => true,
                                :system_stuff => true,
                                :rang => 0

admin_gruppe = Gruppe.create!   :name => 'Administrator',
                                :system_stuff => 'admin',
                                :backend => true,
                                :position => 2,
                                :show => true,
                                :new => true,
                                :edit_own => true, :edit_crew => true, :edit_all => true,
                                :del_own => true, :del_crew => true, :del_all => true,
                                :modify => true,
                                :content_admin => true,
                                :design_admin => true,
                                :system_admin => true,
                                :system_stuff => true,
                                :rang => 1

autor_gruppe = Gruppe.create!   :name => 'Autor',
                                :system_stuff => 'autor',
                                :backend => false,
                                :position => 3,
                                :show => true, :new => true,
                                :edit_own => true, :edit_crew => true, :edit_all => false,
                                :del_own => true, :del_crew => true, :del_all => false,
                                :modify => false,
                                :content_admin => true,
                                :design_admin => false,
                                :system_admin => false,
                                :system_stuff => true,
                                :rang => 2

user_gruppe = Gruppe.create!    :name => 'Benutzer',
                                :system_stuff => 'user',
                                :backend => false,
                                :position => 3,
                                :show => true,
                                :new => true,
                                :edit_own => true, :edit_crew => false, :edit_all => false,
                                :del_own => true, :del_crew => false, :del_all => false,
                                :modify => false,
                                :content_admin => false,
                                :design_admin => false,
                                :system_admin => false,
                                :system_stuff => true,
                                :rang => 3

gast_gruppe = Gruppe.create!    :name => 'Gast',
                                :system_stuff => 'gast',
                                :backend => false,
                                :position => 3,
                                :show => true,
                                :new => true,
                                :edit_own => true,
                                :edit_crew => false,
                                :edit_all => false,
                                :del_own => true,
                                :del_crew => false,
                                :del_all => false,
                                :modify => false,
                                :content_admin => false,
                                :design_admin => false,
                                :system_admin => false,
                                :system_stuff => true,
                                :rang => 5


user_modul_recht = RechteModul.create!    :name => 'Rechteverwaltung', 
                                          :front_url => '', 
                                          :admin_url => '', 
                                          :prefs_url => ''

user_modul_recht = RechteModul.create!    :name => 'Userverwaltung', 
                                          :front_url => '', 
                                          :admin_url => '', 
                                          :prefs_url => ''


puts 'INFO: ERSTELLE  USER :'

master = User.create!       :anrede => 'herr',
                            :vorname => 'Torsten',
                            :name => 'Wetzel',
                            :nick_name => 'austin',
                            :strange_id => 'owerk_austin',
                            :email => 'admin@orangenwerk.com',
                            :password => 'dau@mac?!',
                            :password_confirmation => 'dau@mac?!',
                            :site_admin => true,
                            :evil_master => true,
                            :confirmed_at => Time.now,
                            # => :crew => 'admin'
                            :gruppe_id => admin_gruppe.id

puts 'INFO: User erstellt: ' << master.name

s_admin = User.create!      :anrede => 'herr',
                            :vorname => 'Marco',
                            :name => 'Sebald',
                            :nick_name => 'ashone',
                            :strange_id => 'owerk_donnie',
                            :email => 'm.sebald@orangenwerk.com',
                            :password => 'blackfish1980',
                            :password_confirmation => 'blackfish1980',
                            :site_admin => true,
                            :evil_master => false,
                            :confirmed_at => Time.now,
                            # => :crew => 'admin'
                            :gruppe_id => admin_gruppe.id

puts 'INFO: User erstellt: ' << s_admin.name

admin = User.create!        :anrede => 'herr',
                            :vorname => 'Manfred',
                            :name => 'Musterman',
                            :nick_name => 'Seiten_Inhaber',
                            :email => 'test_owner@2strange.net',
                            :password => 'fineline_owner',
                            :password_confirmation => 'fineline_owner',
                            :site_admin => false,
                            :evil_master => false,
                            :confirmed_at => Time.now,
                            # => :crew => 'owner'
                            :gruppe_id => owner_gruppe.id

puts 'INFO: User erstellt: ' << admin.name

autor = User.create!        :anrede => 'frau',
                            :vorname => 'Michaela',
                            :name => 'Musterman',
                            :nick_name => 'Seiten_Autor',
                            :email => 'test_autor@2strange.net',
                            :password => 'fineline_autor',
                            :password_confirmation => 'fineline_autor',
                            :site_admin => false,
                            :evil_master => false,
                            :confirmed_at => Time.now,
                            # => :crew => 'author'
                            :gruppe_id => autor_gruppe.id

puts 'INFO: User erstellt: ' << autor.name
puts '. . .'

s_admin = User.create!      :anrede => 'herr',
                            :vorname => 'Jochen',
                            :name => 'Jedermann',
                            :nick_name => 'fineline_user',
                            :email => 'test_user@2strange.net',
                            :password => 'fineline_user',
                            :password_confirmation => 'fineline_user',
                            :site_admin => true,
                            :evil_master => false,
                            :confirmed_at => Time.now,
                            # => :crew => 'admin'
                            :gruppe_id => user_gruppe.id

puts 'INFO: User erstellt: ' << s_admin.name
puts '. . .'
puts 'INFO: Fertig!'



