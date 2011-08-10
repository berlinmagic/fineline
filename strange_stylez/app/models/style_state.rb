# encoding: utf-8
class StyleState < ActiveRecord::Base
  
  
  belongs_to :style_objekt
  
  has_many :style_sheets

  attr_accessor :back_url
  

  
end
