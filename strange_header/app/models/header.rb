# encoding: utf-8
class Header < ActiveRecord::Base
  
  HEADER_STYLES = ['fader', 'slider', 's3-slider']
  
  BG_STYLES = ['farbe', 'verlauf', 'bild', 'bild_farbe', 'bild_verlauf']
  
  HWERTE = %W(left center top)
  VWERTE = %W(top center bottom)
  RWERTE = %w(xrepeat yrepeat repeat norepeat)
  
  # => has_many :seiten
  
  has_many :header_seiten, :dependent => :destroy
  has_many :seiten, :through => :header_seiten
  
  has_many :header_hpics, :dependent => :destroy
  has_many :hpics, :through => :header_hpics
  
  
end
