class CreateStrangeHeader < ActiveRecord::Migration
  
  def self.up
    create_table :headers do |t|
      t.string :name
      t.string :stil
      t.integer :header_height
      t.references :seite
      t.timestamps
    end
    
    create_table :header_pics do |t|
      t.string :name
      t.text :inhalt
      t.integer :position
      t.references :header
      t.string :bild_uid
      t.integer :bild_width
      t.integer :bild_height
      t.string  :bild_cropping
      #t.string :bild_file_name
      #t.string :bild_content_type
      #t.integer :bild_file_size
      #t.datetime :bild_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :headers
    drop_table :header_pics
  end
  
  
end