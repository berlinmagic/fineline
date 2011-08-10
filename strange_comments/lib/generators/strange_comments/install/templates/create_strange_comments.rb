class CreateStrangeComments < ActiveRecord::Migration
  
  def self.up
    
    create_table :kommentare do |t|
      t.string      :headline
      t.text        :inhalt
      t.string      :user_ip
      t.references  :user
      t.references  :target, :polymorphic => true
      t.string      :user_name
      t.string      :user_vorname
      t.string      :user_email
      t.string      :user_website
      t.string      :user_firma
      t.timestamps
    end
    add_index :kommentare, [:target_type, :target_id]
    
  end

  def self.down
    remove_index :kommentare, [:target_type, :target_id]
    drop_table :kommentare
  end
  
  
end