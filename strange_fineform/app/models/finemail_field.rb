# encoding: utf-8
class FinemailField < ActiveRecord::Base
  include RFC822
  
  belongs_to :finemail
  
  image_accessor :datei
  
  validates :name, :presence => true
  
  validate :this_inhalt
  
  validates_presence_of :datei, :message => "Datei-Feld darf nicht leer sein", :if => :this_file?
  
  validates_size_of :datei, :maximum => 500.kilobytes
  
  # => validates_property :format, :of => :datei, :in => [:jpeg, :png, :gif]
  
  #validates :inhalt,    :presence => true, 
  #                      :length => {:minimum => 7, :maximum => 254},
  #                      :email => true,
  #                      :message => 'huhu .. E-Mail !!!',
  #                      :if => :this_email?
                        
                        
  
  # => validates :inhalt, :email => true :message => 'huhu .. E-Mail !!!', :if => :this_email?
  
  # => validates_format_of :inhalt, :with => E_Mail_Adresse, :message => self.name+' huhu .. E-Mail !!!', :if => :this_email?
  
  
  # => validates_with EmailValidator, :inhalt, :message => 'hallo E-Mail!', :if => :this_email?
  
  default_scope :order => "position ASC"
  
  attr_accessor     :validator, :um
  
  # => validates :inhalt, :presence => true
  
  
  # => has_attached_file :datei
  
  
  def this_inhalt
      if fffield = FineformField.find(fineform_field_id)
          if fffield.validat && fffield.validation_typ && fffield.validation_typ == 'email'
              errors.add(:inhalt, "<strong>#{name}</strong> ist keine E-Mail!") unless inhalt.match(E_Mail_Adresse)
          elsif fffield.needed
              errors.add(:inhalt, "#{name} darf nicht leer sein.") if inhalt.blank?
              # => errors[:base] << "Object state is invalid"
          end
      end
  end
  
  def this_email?
    if fffield = FineformField.find(fineform_field_id)
      true if fffield.validat && fffield.validation_typ && fffield.validation_typ == 'email'
    else
      false
    end
  end
  
  def this_file?
    true if (FineformField.find(fineform_field_id) && FineformField.find(fineform_field_id).feld_typ == 'file') || typ == 'file'
  end
  
end