# encoding: utf-8
class Header < ActiveRecord::Base
  
  HEADER_STYLES = ['fader', 'slider', 's3-slider']
  
  BG_STYLES = ['farbe', 'verlauf', 'bild']
  
  HWERTE = %W(left center top)
  VWERTE = %W(top center bottom)
  RWERTE = %w(xrepeat yrepeat repeat norepeat)
  
  has_many :seiten
  
  has_many :headers_hpics, :dependent => :destroy
  has_many :hpics, :through => :headers_hpics
  
end
