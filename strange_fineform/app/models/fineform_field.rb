# encoding: utf-8
class FineformField < ActiveRecord::Base
  
  belongs_to :fineform
  
  acts_as_list
  
  default_scope :order => "position ASC"
  
  validates :name, :presence => true
  
  before_save :make_position
  
  private

    def make_position
      unless new_record?
        return unless prev_position = FineformField.find(self.id).position
        unless self.position.nil?
          if prev_position > self.position
            FineformField.update_all("position = position + 1", ["? <= position AND position < ?", self.position, prev_position])
          elsif prev_position < self.position
            FineformField.update_all("position = position - 1", ["? < position AND position <= ?", prev_position,  self.position])
          end
        end
      end
    end
  
  
end