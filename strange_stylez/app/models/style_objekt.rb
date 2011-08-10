# encoding: utf-8
class StyleObjekt < ActiveRecord::Base
  
  belongs_to :style_set
  
  has_many :style_states, :dependent => :destroy
  
  has_many :style_sheets, :through => :style_states
  
  attr_accessor :back_url
  

  
end
