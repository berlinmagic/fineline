class CreateStrangeStylez < ActiveRecord::Migration
  
  def self.up
    
    create_table :style_sets do |t|
      t.string      :name
      t.text        :beschreibung
      
      t.string      :autor_name
      t.string      :autor_vorname
      t.string      :autor_email
      t.string      :autor_id
      
      t.string      :stil
      t.integer     :position
      t.timestamps
    end
    
    create_table :style_objekte do |t|
      t.string      :name
      t.references  :style_set
      t.timestamps
    end
    
    create_table :style_sheets do |t|
      t.references  :style_objekt
      t.string      :name
      t.text        :wert
      t.string      :typ
      t.string      :stil
      t.integer     :position
      t.timestamps
    end
    
    
    
    
  end

  def self.down
    drop_table :style_sets
    drop_table :style_objekte
    drop_table :style_sheets
  end
  
  
end