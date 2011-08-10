# encoding: utf-8
class Abschnitt < ActiveRecord::Base
  
  def initialize(*args)
    super(*args)
    last_thing = Abschnitt.last
    self.position = last_thing ? last_thing.position + 1 : 0
  end
  
  belongs_to :seite
  
  # => has_one :text, :dependent => :destroy
  # => accepts_nested_attributes_for :text, :allow_destroy => true
  
  acts_as_list
  
  default_scope   :order => "position ASC"
  
  before_save     :make_position
  
  after_save      :update_slug_fields
  
  private

    def make_position
      unless new_record?
        return unless prev_position = Abschnitt.find(self.id).position
        unless self.position.nil?
          if prev_position > self.position
            Abschnitt.update_all("position = position + 1", ["? <= position AND position < ?", self.position, prev_position])
          elsif prev_position < self.position
            Abschnitt.update_all("position = position - 1", ["? < position AND position <= ?", prev_position,  self.position])
          end
        end
      end
    end
    
    def update_slug_fields
        self.slug = self.name.to_anker if !self.name.blank?
    end
  
end
