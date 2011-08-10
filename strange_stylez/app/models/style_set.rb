# encoding: utf-8
class StyleSet < ActiveRecord::Base
  
  has_many :style_objekte, :dependent => :destroy
  
  # => has_many :style_sheets, :dependent => :destroy
  
  attr_accessor :back_url
  

  
end
