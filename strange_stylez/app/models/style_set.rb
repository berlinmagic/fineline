# encoding: utf-8
class StyleSet < ActiveRecord::Base
  
  belongs_to :fine_style, :class_name => "FineStyle"
  
  has_many :style_objects, :dependent => :destroy
  
  attr_accessor :user, :theme
  
end
