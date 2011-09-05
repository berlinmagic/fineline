# encoding: utf-8
class Anhang < ActiveRecord::Base
  
  belongs_to :datei
  belongs_to :target, :polymorphic => true
  
  before_create :kill_doubles
  
  private

    def kill_doubles
      Anhang.where( :datei_id => self.datei_id, :target_id => self.target_id, :target_type => self.target_type ).each do |duble|
        duble.destroy
      end
    end
  
end