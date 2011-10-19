class CreateStrangeGallerie < ActiveRecord::Migration
  
  def self.up
    
    create_table :bilder do |t|
      t.string      :name
      t.string      :slug
      t.text        :beschreibung
      t.string      :stil
      t.integer     :position
      t.date        :datum
      
      t.integer     :jahr
      t.integer     :monat
      t.integer     :tag
      t.string      :firstletter
      
      t.boolean     :anzeigen,  :default => true
      
      t.string      :file_uid
      t.integer     :file_width
      t.integer     :file_height
      t.string      :file_cropping
      t.timestamps
    end
    
    create_table :bilder_gallerien do |t|
      t.references  :bild
      t.references  :gallerie
      t.integer     :position
      t.timestamps
    end
    
    create_table :bild_kategorien do |t|
      t.string      :name
      t.text        :beschreibung
      t.string      :firstletter
      t.timestamps
    end
    
    create_table :bild_kategorien_gallerien do |t|
      t.integer     :position
      t.integer     :bild_kategorie_id
      t.integer     :gallerie_id
      t.timestamps
    end
    
    create_table :bilder_bild_kategorien do |t|
      t.integer     :position
      t.boolean     :titelbild
      t.integer     :bild_id
      t.integer     :bild_kategorie_id
      t.timestamps
    end
    
    
    create_table :gallerien do |t|
      t.string      :name
      t.string      :slug
      t.text        :beschreibung
      t.string      :stil
      t.string      :typ
      t.integer     :position
      t.references  :seite
      t.string      :firstletter
      t.timestamps
    end
    
  end

  def self.down
    drop_table :bilder
    drop_table :bild_kategorien
    drop_table :bilder_bild_kategorien
    drop_table :bilder_tags
    drop_table :gallerien
  end
  
  
end