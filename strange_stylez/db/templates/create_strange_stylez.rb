class CreateStrangeStylez < ActiveRecord::Migration
  
  def self.up
    
    create_table :fine_styles do |t|
      t.string      :name
      t.text        :despcription
      
      t.string      :autor_name
      t.string      :autor_vorname
      t.string      :autor_email
      t.string      :autor_fine_id
      t.integer     :autor_id
      
      t.boolean     :style_aktiv
      
      
      t.references  :target,                :polymorphic => true            # => System / Theme / User
      
      t.timestamps
    end
    
    create_table :style_sets do |t|
      t.string      :name
      t.text        :despcription
      
      t.string      :autor_name
      t.string      :autor_vorname
      t.string      :autor_email
      t.string      :autor_fine_id
      t.integer     :autor_id
      
      t.string      :stil
      t.integer     :position
      
      t.boolean     :style_aktiv
      
      t.references  :fine_style
      
      t.timestamps
    end
    
    create_table :style_objects do |t|
      t.string      :name
      
      t.string      :opt_states                                             # => "normal", "normal & hover", etc.
      t.string      :style_params                                           # => ID / Class 
      t.boolean     :style_aktiv
      
      t.references  :style_set
      t.references  :fine_style
      
      t.integer     :parent_object_id                                       # => Object is Child of another Object
      t.integer     :parent_state_id                                        # => Object is Child of another State
      
      t.timestamps
    end
    
    create_table :style_states do |t|
      t.string      :name                                                   # => "normal", "hover", etc. / "#main" / ".white"
      
      t.boolean     :style_aktiv
      
      t.references  :style_object
      
      t.timestamps
    end
    
    create_table :style_sheets do |t|
      t.string      :style_attribute                                        # => eg: background / font
      t.string      :style_property                                         # => eg: color / size
      
      t.text        :style_full_text                                        # => full Stylesheet
      
      t.string      :style_param1                                           # => eg: inherit / inset
      t.string      :style_param2                                           # => eg: inherit / inset
      t.string      :style_param3                                           # => eg: inherit / inset
      
      t.string      :style_value1                                           # => eg: (margin) top
      t.string      :style_value2                                           # => eg: (margin) right
      t.string      :style_value3                                           # => eg: (margin) bottom
      t.string      :style_value4                                           # => eg: (margin) left
      
      t.string      :style_unit                                             # => eg: pixel / em
      
      t.string      :style_type                                             # => . . .
      
      t.boolean     :style_aktiv
      t.boolean     :style_important
      
      t.integer     :position
      
      t.references  :style_object
      t.references  :style_state
      
      t.timestamps
    end
    
    
    
    
  end

  def self.down
    drop_table :fine_styles
    drop_table :style_sets
    drop_table :style_objects
    drop_table :style_states
    drop_table :style_sheets
  end
  
  
end