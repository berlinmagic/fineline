# encoding: utf-8
class CreateStrangeHeader < ActiveRecord::Migration
  
  def self.up
    create_table :headers do |t|
      t.string        :name                   # => evtl. Überflüssig
      t.string        :typ                    # => fader  /  slider  /  etc.
      t.string        :stil                   # => fader  /  slider  /  etc.
      t.integer       :breite
      t.integer       :hoehe                  # => höhe des Headers   ... eh. header_height
      t.references    :seite                  # => evtl. Überflüssig
      # 
      t.string        :standzeit
      t.string        :wechelzeit
      t.string        :sortierung
      t.text          :hintergrund
      t.string        :button_set
      
      t.timestamps
    end
    
    create_table :hpics do |t|
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
    
    create_table :headers_hpics do |t|
      t.references :hpic
      t.string :name
      t.text :inhalt
      t.integer :position
      t.references :header
      t.timestamps
    end
    
  end

  def self.down
    drop_table :headers
    drop_table :header_pics
  end
  
  
end