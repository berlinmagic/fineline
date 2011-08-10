class CreateStrangeSidebars < ActiveRecord::Migration
  
  def self.up
    
    create_table :sidebars do |t|
      t.string      :name
      t.text        :beschreibung
      t.string      :stil
      t.integer     :position
      t.date        :datum
      t.string      :file_uid
      t.integer     :file_width
      t.integer     :file_height
      t.string      :file_cropping
      t.timestamps
    end
   
   create_table :seiten_sidebars do |t|
      t.references  :seite
      t.references  :sidebar
      t.integer     :position
      t.timestamps
    end
    
  end

  def self.down
    drop_table :sidebars
    drop_table :seiten_sidebars
  end
  
  
end