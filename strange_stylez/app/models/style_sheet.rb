# encoding: utf-8
class StyleSheet < ActiveRecord::Base
  
  
  belongs_to :style_state
  belongs_to :style_object

  attr_accessor :back_url
  

  
end
