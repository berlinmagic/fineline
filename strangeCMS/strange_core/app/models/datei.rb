# encoding: utf-8
class Datei < ActiveRecord::Base
  
  has_many :anhaenge, :dependent => :destroy
  has_many :targets, :through => :anhaenge
  
  default_scope :order => "name ASC"
  
  
  image_accessor :file
  validates_presence_of :file
  
  
  after_save :set_paramatas
  
  private
	
	  def set_paramatas
	    if self.file
  	    if xy_pic = file.bild.name.split('.')
  	      xy_pic.delete(xy_pic.last)
  	      unless self.name && self.name != ''
  	        self.name = xy_pic.last
  	      end
  	    end
  	    #self.mime_type  = self.file.mime_type
        # => self.file_type  = self.file.format
        #self.image      = self.file.image?
  	  end
  	end
  
end