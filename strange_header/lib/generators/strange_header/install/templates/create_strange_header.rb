# encoding: utf-8
class CreateStrangeHeader < ActiveRecord::Migration
  
  def self.up
    create_table :headers do |t|
      t.string        :name                   # => evtl. Überflüssig
      
      t.string        :typ,             :default => 'fader'           # => fader  /  slider  /  etc.
      t.string        :stil                                           # => Stil / Style evtl. nützlich ???
      
      t.integer       :width,           :default => 960               # => breite des Headers   ... eh. header_height
      t.integer       :height,          :default => 960               # => höhe des Headers   ... eh. header_height
      
      t.integer       :staytime,        :default => 5                 # => Fader / Slider
      t.integer       :changetime,      :default => 2                 # => Fader
            
      t.boolean       :sort,            :default => false             # => Sortiert / Zufällig
      
      t.boolean       :autoplay,        :default => true              # => Autoplay:  Ja / Nein
      t.boolean       :shownav,         :default => true              # => Navi:  Ja / Nein
      t.string        :navstil,         :default => 'fineline'        # => Auswahl
      
      t.string        :button_set,      :default => 'fineline'        # => Auswahl
      
      t.string        :hintergrund,     :default => 'verlauf'         # => Auswahl Hingrund => Farbe / Verlauf / Bild / alles
      
      t.string        :farbe1,          :default => '#003366'         # => Standardfarbe für Hintergrund
      t.string        :farbe2,          :default => '#00213f'         # => Farbe2 falls Verlauf 
      
      t.string        :bg_pic_uid                                     # => Hintergrund -Bild/ -Grafik
      t.string        :bg_pic_cropping                                # => möglichst freier Zuschnitt  (zwecks Kacheln)
                                                                      
      t.string        :bg_pos_h                                       # => Bild Position horizontal   =>  left / center / right
      t.string        :bg_pos_v                                       # => Bild Position vertical   =>   top / center / bottom
      t.string        :bg_repeat                                      # => Bild-Wiederholung   =>   keine / horizontal / vertikal / beide
      
      t.timestamps
    end
    
    create_table :hpics do |t|
      t.string        :name                   # => Bild / Datei - Name
      t.string        :titel                  # => Titel für S3 Slider
      t.text          :inhalt                 # => Inhalt .. text für S3-Slider
      t.integer       :position               # => Sortierung
      t.string        :bild_uid               # => Dragonfly
      t.string        :bild_cropping          # => Std-Cropping

      t.timestamps
    end
    
    create_table :header_hpics do |t|
      t.references    :hpic                   # => HeaderBild
      t.references    :header                 # => Header
      
      t.string        :titel                  # => Titel für S3 Slider
      t.text          :inhalt                 # => Inhalt .. text für S3-Slider
      t.integer       :position               # => Sortierung
      t.string        :cropping               # => this-Cropping
      
      t.timestamps
    end
    
    create_table :header_seiten do |t|
      t.references    :seite
      t.references    :header
      
      t.timestamps
    end
    
    
    # => add_column :seiten, :header_id, :integer
    
  end

  def self.down
    drop_table :headers
    drop_table :hpics
    drop_table :header_hpics
    drop_table :header_seiten
  end
  
  
end