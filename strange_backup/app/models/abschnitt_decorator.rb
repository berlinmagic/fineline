# encoding: utf-8
Abschnitt.class_eval do
  
  has_many :backup_parts, :as => :target
  has_many :backup_fields, :through => :backup_parts, :as => :target
  
end