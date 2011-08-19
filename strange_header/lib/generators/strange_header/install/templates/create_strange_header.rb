# encoding: utf-8
class CreateStrangeHeader < ActiveRecord::Migration
  
  def self.up
    create_table :headers do |t|
      t.string        :name                   # => evtl. Überflüssig
      
      t.string        :typ                    # => fader  /  slider  /  etc.
      t.string        :stil                   # => fader  /  slider  /  etc.
      
      t.integer       :width
      t.integer       :height                  # => höhe des Headers   ... eh. header_height
      
      t.integer       :staytime               # => Fader / Slider
      t.integer       :changetime             # => Fader
            
      t.boolean       :sort                   # => Sortiert / Zufällig
      
      t.boolean       :autoplay               # => Autoplay:  Ja / Nein
      t.boolean       :shownav                # => Navi:  Ja / Nein
      t.string        :navstil                # => Auswahl
      
      t.string        :button_set             # => Auswahl
      
      t.string        :hintergrund            # => Auswahl Hingrund => Farbe / Verlauf / Bild / alles
      
      t.string        :farbe1                 # => Standardfarbe für Hintergrund
      t.string        :farbe2                 # => Farbe2 falls Verlauf 
      
      t.string        :bg_pic_uid             # => Hintergrund -Bild/ -Grafik
      t.string        :bg_pic_cropping        # => möglichst freier Zuschnitt  (zwecks Kacheln)
      
      t.string        :bg_pos_h               # => Bild Position horizontal   =>  left / center / right
      t.string        :bg_pos_v               # => Bild Position vertical   =>   top / center / bottom
      t.string        :bg_repeat              # => Bild-Wiederholung   =>   keine / horizontal / vertikal / alle Richtung
      
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