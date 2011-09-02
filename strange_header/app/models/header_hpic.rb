# encoding: utf-8
class HeaderHpic < ActiveRecord::Base
  THUMB_W = 990
  THUMB_H = 210
  CROP_W = 990
  
  belongs_to :header
  belongs_to :hpic
  
  acts_as_list
  
  default_scope   :order => "position ASC"

  
  def crop_hash
    # 0:78:90x68
    self.avatar_cropping
    md = self.avatar_cropping.match('(\d+):(\d+):(\d+)x(\d+)')
    { :x => md[1], :y => md[2],  :width  => md[3], :height => md[4] }
  end
  
  before_validation :make_position
  
  def make_position
    unless new_record?
      return unless prev_position = HeaderHpic.find(self.id).position
      unless self.position.nil?
        if prev_position > self.position
          HeaderHpic.update_all("position = position + 1", ["? <= position AND position < ?", self.position, prev_position])
        elsif prev_position < self.position
          HeaderHpic.update_all("position = position - 1", ["? < position AND position <= ?", prev_position,  self.position])
        end
      end
    end
  end

end
