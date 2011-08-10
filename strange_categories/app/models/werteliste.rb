# encoding: utf-8
class Werteliste < ActiveRecord::Base
  
  has_many :werte
  
  before_validation :felder_fuellen
  
  validates :name, :presence => true, :uniqueness => true
  
  private

    def felder_fuellen
      self.name         = self.name.strip.downcase.titleize if self.name
      self.firstletter  = self.name.strip[0..0].upcase
      self.slug         = self.name.to_url
    end
  
  
end