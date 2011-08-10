# encoding: utf-8
class Kat < ActiveRecord::Base
  
  belongs_to :kategorie
  belongs_to :target, :polymorphic => true
  
  before_create :kill_doubles
  
  private

    def kill_doubles
      Kat.where( :kategorie_id => self.kategorie_id, :target_id => self.target_id, :target_type => self.target_type ).each do |duble|
        duble.destroy
      end
    end
  
end
