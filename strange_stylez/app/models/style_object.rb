# encoding: utf-8
class StyleObject < ActiveRecord::Base
  
  
  belongs_to :style_set
  
  belongs_to :parent_state, :class_name => "StyleState", :foreign_key => "parent_state_id"
  belongs_to :parent_object, :class_name => "StyleObject", :foreign_key => "parent_object_id"
  
  
  has_many :style_states, :dependent => :destroy
  has_many :style_objects, :through => :style_states
  
  has_many :style_sheets, :dependent => :destroy
  
  has_many :child_objects, :class_name => "StyleObject", :foreign_key => "parent_object_id"
  
  
  attr_accessor :user, :theme
  
end
