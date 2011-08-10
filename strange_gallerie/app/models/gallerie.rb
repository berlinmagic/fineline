# encoding: utf-8
class Gallerie < ActiveRecord::Base
  
  VEIW_TYPES = %w[ left center right ]
  VIEW_COUNT = %w[ 1 2 3 4 ]
  
  belongs_to :seite
  
  has_many :bild_kategorien_gallerien
  has_many :bild_kategorien, :through => :bild_kategorien_gallerien, :uniq => true
  
  has_many :bilder_gallerien
  has_many :bilder, :through => :bilder_gallerien, :uniq => true
  
  
  
  has_many :kats, :as => :target
  has_many :kategorien, :through => :kats, :as => :target, :uniq => true
  
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  before_validation :felder_fuellen
  
  private

    def felder_fuellen
      self.name = self.name.strip.downcase.titleize if self.name
      self.firstletter = self.name.strip[0..0].upcase
    end
  
  
  
end