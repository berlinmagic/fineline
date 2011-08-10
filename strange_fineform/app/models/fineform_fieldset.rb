# encoding: utf-8
class FineformFieldset < ActiveRecord::Base
  
  belongs_to :fineform
  
  has_many :fineform_fields
  
  acts_as_list
  
  default_scope :order => "position ASC"
  
  
end