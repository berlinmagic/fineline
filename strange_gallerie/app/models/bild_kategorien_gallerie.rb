# encoding: utf-8
class BildKategorienGallerie < ActiveRecord::Base
  
  belongs_to :bild_kategorie
  
  belongs_to :gallerie
  
  acts_as_list
  
  before_create :kill_doubles
  
  private

    def kill_doubles
      BildKategorienGallerie.where(:gallerie_id => self.gallerie_id, :bild_kategorie_id => self.bild_kategorie_id).each do |duble|
        duble.destroy
      end
    end
  
end