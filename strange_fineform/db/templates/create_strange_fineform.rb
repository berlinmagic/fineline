class CreateStrangeFineform < ActiveRecord::Migration
  
  def self.up
    
    create_table :fineforms do |t|
      t.string      :name
      t.text        :beschreibung
      t.string      :stil
      t.string      :typ
      t.string      :form_typ
      t.references  :seite
      t.boolean     :system_stuff,        :default => false
      t.timestamps
    end
    
    create_table :fineform_fieldsets do |t|
      t.string      :name
      t.text        :beschreibung
      t.string      :stil
      t.string      :typ
      t.boolean     :system_stuff,        :default => false
      t.integer     :position
      t.references  :fineform
      t.timestamps
    end
    
    create_table :finemails do |t|
      t.string      :absender
      t.string      :stil
      t.string      :typ
      t.string      :user_ip
      t.datetime    :sended
      t.datetime    :deleted
      t.boolean     :neu
      t.boolean     :beantwortet
      t.integer     :antwort_auf
      t.text        :betreff
      t.references  :fineform
      t.timestamps
    end
    
    create_table :fineform_fields do |t|
      t.string      :name
      t.string      :inhalt
      t.string      :feld_typ
      t.string      :typ
      t.string      :stil
      t.string      :mail_view
      t.integer     :position
      
      t.boolean     :needed,              :default => false
      t.boolean     :validat,             :default => false
      t.string      :validation_typ
      t.boolean     :start_blank,         :default => true
      t.boolean     :multi,               :default => false
      t.boolean     :system_stuff,        :default => false
      
      t.references  :fineform
      t.references  :fineform_fieldset
      t.references  :werteliste
      
      t.timestamps
    end
    
    create_table :finemail_fields do |t|
      t.string      :name
      t.text        :inhalt
      t.integer     :position
      t.string      :typ
      t.string      :mail_view
      t.references  :finemail
      t.references  :fineform_field
      t.string      :datei_uid
      t.string      :datei_file_name
      t.string      :datei_content_type
      t.integer     :datei_file_size
      t.datetime    :datei_updated_at
      t.timestamps
    end
    

    
  end

  def self.down
    drop_table :fineforms
    drop_table :finemails
    drop_table :fineform_fields
    drop_table :finemail_fields
    drop_table :fineform_fieldsets
  end
  
  
end