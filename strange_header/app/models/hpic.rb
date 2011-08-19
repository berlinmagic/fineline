# encoding: utf-8
class Hpic < ActiveRecord::Base
  THUMB_W = 990
  THUMB_H = 210
  CROP_W = 990
  
  has_many :header_hpics, :dependent => :destroy
  has_many :headers, :through => :header_hpics
  
  image_accessor        :bild
  validates_presence_of :bild
  validates_property    :mime_type, :of => :bild, :in => %w(image/jpeg image/png image/gif)
  
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
