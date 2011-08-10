class CreateStrangeNews < ActiveRecord::Migration
  
  def self.up
    
    create_table :news do |t|
      t.string      :headline
      t.string      :slug
      t.text        :beschreibung
      t.string      :stil
      # => t.integer     :position
      t.datetime    :datum
      
      t.integer     :jahr
      t.integer     :monat
      t.integer     :tag
      t.string      :firstletter
      
      t.string      :file_uid
      t.integer     :file_width
      t.integer     :file_height
      t.string      :file_cropping
      
      t.references  :user
      t.integer     :autor
      
      t.boolean     :entwurf,       :default => false
      t.boolean     :kommentierbar, :default => true
      t.boolean     :ilike,         :default => false
      t.boolean     :o_user,         :default => false
      t.boolean     :o_date,         :default => false
      
      t.timestamps
    end
    add_index :news, :headline,     :unique => true
    add_index :news, :slug,         :unique => true
    
    
    create_table :news_abschnitte do |t|
      t.string      :name
      t.integer     :position
      t.references  :news
      t.string      :stuff_typ
      t.string      :stuff_param
      t.text        :inhalt
      t.timestamps
    end
    add_index :news_abschnitte, :news_id
    
    
    create_table :news_kategorien do |t|
      t.string      :name
      t.text        :beschreibung
      t.timestamps
    end
    
    
    create_table :news_news_kategorien, :id => false do |t|
      t.integer     :news_id
      t.integer     :news_kategorie_id
      t.timestamps
    end
    
    
  end

  def self.down
    drop_table :news
    drop_table :news_kategorien
    drop_table :news_news_kategorien
  end
  
  
end