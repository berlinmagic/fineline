# encoding: utf-8
class BilderGallerie < ActiveRecord::Base
  
  belongs_to :bild
  
  belongs_to :gallerie
  
  acts_as_list
  
  before_create :kill_doubles
  
  private

    def kill_doubles
      BilderGallerie.where(:bild_id => self.bild_id, :gallerie_id => self.gallerie_id).each do |duble|
        duble.destroy
      end
    end
  
end