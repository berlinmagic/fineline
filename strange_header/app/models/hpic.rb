# encoding: utf-8
class Hpic < ActiveRecord::Base
  THUMB_W = 990
  THUMB_H = 210
  CROP_W = 990
  
  has_many :headers_hpics, :dependent => :destroy
  has_many :headers, :through => :headers_hpics
  
  #has_attached_file :bild,
  #  # => :default_url => "/images/emergency_:style.png",
  #  :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
  #  :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
  #  :styles => {
  #    :thumb => "165x35#",
  #    :medium => "330x70#",
  #    :header => "990x210#",
  #    :original => "1400x650>"
  #  }
  
  image_accessor :bild
  validates_presence_of :bild
  # => validates_property    :mime_type, :of => :bild, :in => %w(image/jpeg image/png image/gif)
  
  def crop_hash
    # 0:78:90x68
    self.avatar_cropping
    md = self.avatar_cropping.match('(\d+):(\d+):(\d+)x(\d+)')
    { :x => md[1], :y => md[2],  :width  => md[3], :height => md[4] }
  end
  
  before_save :set_paramatas
  
  
  private
	
	  def set_paramatas
  	  if self.bild
  	    if xy_pic = self.bild.name.split('.')
  	      xy_pic.delete(xy_pic.last)
  	      unless self.name && self.name != ''
  	        self.name = xy_pic.last
  	      end
  	    end
  	  end
  	end
  

end
