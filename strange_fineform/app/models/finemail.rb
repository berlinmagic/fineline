# encoding: utf-8
class Finemail < ActiveRecord::Base
  
  has_many :finemail_fields, :dependent => :destroy
  
  accepts_nested_attributes_for :finemail_fields, :allow_destroy => true
  
  # => validates_associated :finemail_fields, :message => 'E-Mail konnte nicht gesendet werden, da einige Felder ungültig oder garnicht ausgefüllt wurden.'
  
  attr_accessor :abs, :form_part, :this_id
  
  # => validate :this_inhalt
  
  
  # => scope :eingang, where("antwort_auf = ? AND sended != ?", nil, nil)
  
  scope :eingang, where("sended != ?", nil)
  
  scope :mail, where("sended != ?", '')
  
  #scope :eingang, :conditions => {:antwort_auf => nil}
  #scope :ausgang, :conditions => ["antwort_auf != ?", '']
  #scope :neu, :conditions => {:neu => true, :sende}
  #scope :gelesen, :conditions => {:neu => false}
  
  # => def this_inhalt
  # =>   finemail_fields_attributes.each do |mf|
  # =>     if fffield = FineformField.find(mf.fineform_field_id)
  # =>         if fffield.validat && fffield.validation_typ && fffield.validation_typ == 'email'
  # =>             errors[:base] << "<strong>#{name}</strong> ist keine E-Mail!" unless mf.inhalt.match(E_Mail_Adresse)
  # =>         elsif fffield.needed
  # =>             errors[:base] << "#{name} darf nicht leer sein." if mf.inhalt.blank?
  # =>         end
  # =>     end
  # =>   end
  # => end
  
end