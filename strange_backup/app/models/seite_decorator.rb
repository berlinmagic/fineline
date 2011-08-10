# encoding: utf-8
Seite.class_eval do
  
  # => serialize :abschnitte, Hash
  
  has_many :backups, :as => :target

  has_many :backup_parts, :through => :backups, :as => :target
  
  has_many :backup_fields, :through => :backups, :as => :target
  
  
  before_save :make_backup_if_changed
  
  
  private
    
    def make_backup_if_changed
      unless new_record?
        back_this_up  =   false
        Backup::SEITE_BACKUP_FIELDS << 'headline' if self.use_headline || self.use_headline_changed? && !self.no_headline
        Backup::SEITE_BACKUP_FIELDS << 'titel' if self.use_titel || self.use_titel_changed?
        @this_user = User.find(this_autor) if this_autor
        if self.changed?
            self.changes.each do |key, value|
                back_this_up  =   true if Backup::SEITE_BACKUP_FIELDS.include?(key)
            end
        end
        self.abschnitte.each_with_index do |abs,index|
          back_this_up  =   true if abs.changed?
          back_this_up  =   true if abs.new_record?
          back_this_up  =   true if abs._destroy
        end
        # => back_this_up  =   true  if changed_for_autosave?
        back_this_up  =   true  if nested_records_changed_for_autosave?
        
        if back_this_up
              @backUp = Backup.create!( :target_type => self.class.to_s,  :target_id => self.id,        :user_id => @this_user, 
                                        :aktion => 'update',        :yml_objekt => self.to_yaml.to_s,   :yml_change => self.changes.to_yaml.to_s,
                                        :yml_attribute => self.attributes.to_yaml.to_s, :yml_nested_1 => self.abschnitte.to_yaml.to_s  )
              self.changes.each do |key, value|
                  if Backup::SEITE_BACKUP_FIELDS.include?(key)
                    bfield = BackupField.create!( :backup_id => @backUp.id, :target_feld => key, :vorher => value[0], :nachher => value[1] )
                  end
              end
              self.abschnitte.each_with_index do |abs, index|
                  if abs.changed?
                      if abs.new_record?
                          bpart = BackupPart.create!(:backup_id => @backUp.id, :target_type => abs.class.to_s,    :target_id => abs.id, 
                                :user_id => @this_user, :aktion => 'new',         :yml_objekt => abs.to_yaml.to_s, 
                                :yml_attribute => abs.attributes.to_yaml.to_s)
                      else
                          @bpart = BackupPart.create!(   :backup_id => @backUp.id, :target_type => abs.class.to_s,    :target_id => abs.id, 
                                :user_id => @this_user, :aktion => 'update',      :yml_objekt => abs.to_yaml.to_s, 
                                :yml_attribute => abs.attributes.to_yaml.to_s,    :yml_change => abs.changes.to_yaml.to_s)
                          abs.changes.each do |abs_key, abs_value|
                              if Backup::ABSCHNITT_BACKUP_FIELDS.include?(abs_key)
                                  unless abs_value[0].blank? && abs_value[1].blank?
                                      bfield = BackupField.create!(   :backup_part_id => @bpart.id,    :target_feld => abs_key, 
                                                                      :vorher => abs_value[0],          :nachher => abs_value[1])
                                  end
                              end
                          end
                      end
                  elsif abs._destroy
                      bpart = BackupPart.create!   :backup_id => @backUp.id, :target_type => abs.class.to_s,    :target_id => abs.id, 
                            :user_id => @this_user, :aktion => 'delete',  :yml_attribute => abs.attributes.to_yaml.to_s, 
                            :yml_objekt => abs.to_yaml.to_s
                  end
              end
        end
      end
    end
  
  
  
end