# encoding: utf-8
# ========================================================================================================================
# =>      Update1  > Version 0.1.22
# ========================================================================================================================
class UpdateStrangeCore < ActiveRecord::Migration
  def self.up
    create_table :dateien do |t|
      t.string        :name                                       # => Bild / Datei - Name
      t.text          :beschreibung                               # => beschreibung
      t.string        :file_uid                                   # => Dragonfly
      
      t.boolean       :image,             :default => false       # => bild ?
      t.string        :mime_type                                  # => datei - mime_type ?    bsp: image/jpg
      t.string        :file_type                                  # => datei - file_type ? .. bsp: jpg
      
      t.string        :typ                                        # => ..
      t.string        :modul                                      # => ..
      
      t.integer       :autor                                      # => datei-autor
      
      t.boolean       :protected_stuff,   :default => false       # => datei protected only visible for ?
      t.references    :gruppe                                     # => this group can see protected dateien
      
      t.datetime      :deleted_at                                 # => datei deleted at (in trash)
      
      t.boolean       :system_stuff,      :default => false       # => system-datei? ... user can´t delete
      
      t.timestamps
    end
    
    create_table :anhaenge do |t|
      t.references  :target, :polymorphic => true
      t.references  :datei
      
      t.integer     :position
      
      t.timestamps
    end
    
    
  end

  def self.down
    drop_table :dateien
    drop_table :anhaenge
  end
end