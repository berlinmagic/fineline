class CreateStrangeCategories < ActiveRecord::Migration
  
  def self.up
    
    create_table :tags do |t|
      t.string      :name
      t.string      :slug
      t.string      :firstletter
      t.timestamps
    end
    add_index :tags, :name,     :unique => true
    add_index :tags, :slug,     :unique => true
    
    create_table :taggings do |t|
      t.references  :target, :polymorphic => true
      t.references  :tag
      t.timestamps
    end
    add_index :taggings, [:target_type, :target_id]
    
    
    create_table :kategorien do |t|
      t.string      :name
      t.string      :slug
      t.text        :beschreibung
      t.string      :stil
      t.string      :typ
      t.string      :firstletter
      t.timestamps
    end
    add_index :kategorien, :name,     :unique => true
    add_index :kategorien, :slug,     :unique => true
    
    create_table :kats do |t|
      t.references  :target, :polymorphic => true
      t.references  :kategorie
      t.integer     :kategorie_position
      t.integer     :target_position
      t.timestamps
    end
    add_index :kats, [:target_type, :target_id]
    
    
    create_table :werte do |t|
      t.text        :inhalt
      t.string      :slug
      t.string      :stil
      t.integer     :position
      t.string      :firstletter
      t.references  :werteliste
      t.timestamps
    end
    
    create_table :wertelisten do |t|
      t.string      :name
      t.string      :slug
      t.text        :beschreibung
      t.string      :stil
      t.string      :typ
      t.boolean     :system_stuff,          :default => false
      t.string      :firstletter
      t.timestamps
    end
    add_index :wertelisten, :name,     :unique => true
    add_index :wertelisten, :slug,     :unique => true
    
    
    
  end

  def self.down
    remove_index  :tags,      :name
    remove_index  :tags,      :slug
    remove_index  :kategorien,      :name
    remove_index  :kategorien,      :slug
    remove_index  :wertelisten,      :name
    remove_index  :wertelisten,      :slug
    drop_table    :tags
    remove_index  :taggings,      [:target_type, :target_id]
    drop_table    :taggings
    drop_table    :kategorien
    remove_index  :kats,          [:target_type, :target_id]
    drop_table    :kats
    drop_table    :wertelisten
    drop_table    :werte
  end
  
  
end