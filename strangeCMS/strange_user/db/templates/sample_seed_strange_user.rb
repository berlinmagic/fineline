   


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


   