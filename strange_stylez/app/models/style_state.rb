# encoding: utf-8
class StyleState < ActiveRecord::Base
  
  
  belongs_to :style_object
  
  
  has_many :style_sheets, :dependent => :destroy
  
  has_many :style_objects, :class_name => "style_object", :foreign_key => "parent_state_id"
  
  attr_accessor :user, :theme
  
end
