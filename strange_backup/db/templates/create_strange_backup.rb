class CreateStrangeBackup < ActiveRecord::Migration
  
  def self.up
    
    create_table :backups do |t|
      t.references    :target,              :polymorphic => true              # => Ziel-Objekt
      t.references    :user                                                   # => Autor
      t.string        :aktion                                                 # => update / create / delete
      t.text          :yml_objekt                                             # => YAML-Objekt
      t.text          :yml_attribute                                          # => YAML-Objekt 
      t.text          :yml_nested_1                                           # => YAML-Objekt 
      t.text          :yml_nested_2                                           # => YAML-Objekt 
      t.text          :yml_nested_3                                           # => YAML-Objekt 
      t.text          :yml_change                                             # => Änderung
      t.timestamps
    end
    add_index :backups, [:target_type, :target_id]
    
    create_table :backup_parts do |t|
      t.references    :target,              :polymorphic => true              # => Ziel-Objekt
      t.references    :backup                                                 # => BackUp
      t.references    :user                                                   # => Autor
      t.string        :aktion                                                 # => update / create / delete
      t.text          :yml_objekt                                             # => YAML-Objekt (Falls Objekt gelöscht wurde)
      t.text          :yml_attribute                                          # => YAML-Objekt 
      t.text          :yml_change                                             # => Änderung
      
      t.timestamps
    end
    add_index :backup_parts, [:target_type, :target_id]
    
    
    create_table :backup_fields do |t|
      t.references    :backup                                                 # => BackUp
      t.references    :backup_part                                            # => BackUp Part
      t.string        :target_feld                                            # => Ziel-Feld
      t.text          :vorher                                                 # => Vor Änderung
      t.text          :nachher                                                # => Vor Änderung
      t.timestamps
    end
    
    
  end

  def self.down
    remove_index    :backups, [:target_type, :target_id]
    drop_table      :backups
    remove_index    :backup_parts, [:target_type, :target_id]
    drop_table      :backup_parts
    drop_table      :backup_fields
  end
  
  
end