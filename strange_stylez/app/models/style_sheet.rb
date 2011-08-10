# encoding: utf-8
class StyleSheet < ActiveRecord::Base
  
  
  belongs_to :style_state

  attr_accessor :back_url
  

  
end
