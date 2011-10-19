class CreateStrangeUser < ActiveRecord::Migration
  
  def self.up
    create_table "users", :force => true do |t|
      t.string   :email,                               :default => "",    :null => false
      
      # => Devise <= #
      t.string   :encrypted_password,   :limit => 128, :default => ""
      t.string   :password_salt,                       :default => ""
      t.string   :reset_password_token
      t.string   :remember_token
      t.datetime :remember_created_at
      t.integer  :sign_in_count,                       :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.integer  :failed_attempts,                     :default => 0
      t.string   :unlock_token
      t.datetime :locked_at
      t.string   :authentication_token
      # => Devise invitation <= #
      t.string   :invitation_token,     :limit => 20
      t.datetime :invitation_sent_at
      
      t.string   :anrede
      t.string   :vorname,                             :default => ""
      t.string   :name,                                :default => ""
      
      t.string   :strange_id,                          :default => ""
      t.string   :nick_name,                           :default => ""
      
      t.string   :bild_uid
      t.integer  :bild_width
      t.integer  :bild_height
      t.string   :bild_cropping
      
      t.boolean  :evil_master,                         :default => false
      t.boolean  :site_admin,                          :default => false
      
      # => t.string   :crew,                                :default => ""
      t.references  :gruppe
      
      t.timestamps
    end
    add_index :users, :confirmation_token,        :unique => true
    add_index :users, :email,                     :unique => true
    add_index :users, :invitation_token
    add_index :users, :strange_id,                :unique => true
    add_index :users, :nick_name,                 :unique => true
    add_index :users, :reset_password_token,      :unique => true
    add_index :users, :unlock_token,              :unique => true
    
    create_table "gruppen", :force => true do |t|
      t.string      :name,          :null => false
      t.boolean     :system_stuff,  :default => false
      t.string      :system_name
      t.boolean     :content_admin, :default => false
      t.boolean     :design_admin,  :default => false
      t.boolean     :system_admin,  :default => false
      t.boolean     :backend,       :default => false
      
      t.integer     :position
      t.integer     :rang,          :default => 3
      t.boolean     :show,          :default => true
      t.boolean     :new,           :default => false
      t.boolean     :edit_own,      :default => false
      t.boolean     :edit_crew,     :default => false
      t.boolean     :edit_all,      :default => false
      t.boolean     :del_own,       :default => false
      t.boolean     :del_crew,      :default => false
      t.boolean     :del_all,       :default => false
      t.boolean     :modify,        :default => false
      t.timestamps
    end
    
    create_table "rechte", :force => true do |t|
      t.boolean     :show,           :default => true
      t.boolean     :new,            :default => false
      t.boolean     :edit_own,       :default => false
      t.boolean     :edit_crew,      :default => false
      t.boolean     :edit_all,       :default => false
      t.boolean     :del_own,        :default => false
      t.boolean     :del_crew,       :default => false
      t.boolean     :del_all,        :default => false
      t.boolean     :modify,         :default => false
      t.references  :gruppe
      t.references  :rechte_modul
      t.references  :user
      t.timestamps
    end
    
    
    create_table "rechte_module", :force => true do |t|
      t.string      :name
      t.string      :front_url
      t.string      :admin_url
      t.string      :prefs_url
      
      t.timestamps
    end
    
      
  end

  def self.down
    drop_table :users
    drop_table :gruppen
    drop_table :rechte
    drop_table :rechte_module
  end
  
  
end