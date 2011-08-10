# encoding: utf-8
class BildKategorie < ActiveRecord::Base
  
  has_many :bilder_bild_kategorien
  has_many :bilder, :through => :bilder_bild_kategorien, :uniq => true
  
  has_many :bild_kategorien_gallerien
  has_many :gallerien, :through => :bild_kategorien_gallerien, :uniq => true
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  before_validation :felder_fuellen
  
  private

    def felder_fuellen
      self.firstletter = self.name.strip[0..0].upcase
    end
  
end