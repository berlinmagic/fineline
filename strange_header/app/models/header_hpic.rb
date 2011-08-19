# encoding: utf-8
class HeaderHpic < ActiveRecord::Base
  THUMB_W = 990
  THUMB_H = 210
  CROP_W = 990
  
  belongs_to :header
  belongs_to :hpic

  default_scope   :order => "position ASC"

  
  def crop_hash
    # 0:78:90x68
    self.avatar_cropping
    md = self.avatar_cropping.match('(\d+):(\d+):(\d+)x(\d+)')
    { :x => md[1], :y => md[2],  :width  => md[3], :height => md[4] }
  end

end
