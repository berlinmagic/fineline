# encoding: utf-8
class Bild < ActiveRecord::Base
  
  BILD_STILE = %w(standard_format hochformat querformat panorama spezial)
  
  has_many :bilder_bild_kategorien
  has_many :bild_kategorien, :through => :bilder_bild_kategorien, :uniq => true
  
  
  has_many :kats, :as => :target
  has_many :kategorien, :through => :kats, :as => :target, :uniq => true
  
  
  has_many :bilder_gallerien
  has_many :gallerien, :through => :bilder_gallerien, :uniq => true
  
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :as => :target, :uniq => true
  
  before_save :set_paramatas
  
  image_accessor :file
  validates_presence_of :file
  # => validates_property    :mime_type, :of => :file, :in => %w(image/jpeg image/png image/gif)
  
  def crop_hash
    # 0:78:90x68
    self.avatar_cropping
    md = self.avatar_cropping.match('(\d+):(\d+):(\d+)x(\d+)')
    { :x => md[1], :y => md[2],  :width  => md[3], :height => md[4] }
  end
  
  private
	
	  def set_paramatas
  	  if self.file
  	    if xy_pic = self.file.name.split('.')
  	      xy_pic.delete(xy_pic.last)
  	      unless self.name && self.name != ''
  	        self.name = xy_pic.last
  	      end
  	    end
  	  end
  	  self.jahr = self.datum.year
      self.monat = self.datum.month
      self.tag = self.datum.day
      self.firstletter = self.name.strip[0..0].upcase
  	end

  
end
