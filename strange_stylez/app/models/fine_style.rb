# encoding: utf-8
class FineStyle < ActiveRecord::Base
  
  has_many :style_sets, :dependent => :destroy
  
  has_many :set_objects, :through => :style_sets, :class_name => "StyleObject"
  
  has_many :style_objects, :dependent => :destroy
  
  attr_accessor :user, :theme
  
  
end
