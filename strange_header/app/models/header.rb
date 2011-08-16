# encoding: utf-8
class Header < ActiveRecord::Base
  
  HEADER_STYLES = ['fader', 'slider', 's3-slider']
  
  has_many :seiten
  
  has_many :headers_hpics, :dependent => :destroy
  has_many :hpics, :through => :headers_hpics
  
end
