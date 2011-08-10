# encoding: utf-8
class Header < ActiveRecord::Base
  
  HEADER_STYLES = ['fader', 'slider', 's3-slider']
  
  belongs_to :seite
  
  has_many :header_pics
  
end
