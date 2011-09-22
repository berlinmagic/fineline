   


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

puts 'INFO: Master-User erstellt: ' << master.name

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

puts 'INFO: Admin-User erstellt: ' << s_admin.name


   
