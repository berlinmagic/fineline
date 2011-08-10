# encoding: utf-8
class Wert < ActiveRecord::Base
  
  belongs_to :werteliste
  
  acts_as_list
  
  default_scope :order => "position ASC"
  
  before_save :make_position
  
  before_validation :felder_fuellen
  
  validates :inhalt, :presence => true
  
  private

    def make_position
      unless new_record?
        return unless prev_position = Wert.find(self.id).position
        unless self.position.nil?
          if prev_position > self.position
            Wert.update_all("position = position + 1", ["? <= position AND position < ?", self.position, prev_position])
          elsif prev_position < self.position
            Wert.update_all("position = position - 1", ["? < position AND position <= ?", prev_position,  self.position])
          end
        end
      end
    end
    
    def felder_fuellen
      self.firstletter  = self.inhalt.strip[0..0].upcase
      self.slug         = self.inhalt.to_url
    end
  
  
end