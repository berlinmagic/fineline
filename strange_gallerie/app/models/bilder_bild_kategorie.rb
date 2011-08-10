# encoding: utf-8
class BilderBildKategorie < ActiveRecord::Base
  
  belongs_to :bild
  
  belongs_to :bild_kategorie
  
  acts_as_list
  
  before_create :kill_doubles
  
  private

    def kill_doubles
      BilderBildKategorie.where(:bild_id => self.bild_id, :bild_kategorie_id => self.bild_kategorie_id).each do |duble|
        duble.destroy
      end
    end
  
end