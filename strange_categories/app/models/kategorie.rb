# encoding: utf-8
class Kategorie < ActiveRecord::Base
  
  has_many :kats, :dependent => :destroy
  has_many :targets, :through => :kats
  
  default_scope :order => "name ASC"
  
  before_validation :felder_fuellen
  
  validates :name, :presence => true, :uniqueness => true
  validates :slug, :uniqueness => true
  
  private

    def felder_fuellen
      self.name         = self.name.strip.downcase.titleize if self.name
      self.firstletter  = self.name.strip[0..0].upcase
      self.slug         = self.name.to_url
    end
  
end
