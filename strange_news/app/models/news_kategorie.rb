# encoding: utf-8
class NewsKategorie < ActiveRecord::Base
  
  has_and_belongs_to_many :news
  
  before_validation :felder_fuellen
  
  validates :name, :presence => true, :uniqueness => true
  
  private

    def felder_fuellen
      self.name = self.name.strip.downcase.titleize if self.name
      self.firstletter = self.name.strip[0..0].upcase
    end
  
end
