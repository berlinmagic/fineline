# encoding: utf-8
class Fineform < ActiveRecord::Base
  
  # => FELD_TYPEN = %w[ string text integer select multi_select radio email passwort date datetime time file ]
  FELD_TYPEN = %w[ string text select multi_select email date file radio ]
  INHALT_TYP = %w[ email zahlen text auswahl ]
  VALI_TYPEN = %w[ werteliste email zeichen3 zahlen5 ]
  FELD_STYLE = %w[ table list ]
  FORM_TYPEN = %w[ std_form fieldset ]
  FORM_STYLE = %w[ table list ]
  
  belongs_to :seite
  
  has_many :fineform_fieldsets
  # => has_many :fineform_fields, :through => :fineform_fieldsets, :uniq => true
  has_many :fineform_fields
  
  after_create :build_needed_finefields
  
  def build_needed_finefields
    if self.form_typ == 'fieldset'
      fieldset = FineformFieldset.create!(:name => 'Start-Feld', :system_stuff => true, :position => 1, :fineform_id => self.id)
      field = FineformField.create!(:system_stuff => true, :name => 'Ihre E-Mailadresse', :inhalt => 'email', :validat => true, :validation_typ => 'email', 
                                    :needed => true, :position => 1, :fineform_fieldset_id => fieldset.id, :feld_typ => 'email')
    else
      FineformField.create!(:system_stuff => true, :name => 'Ihre E-Mailadresse', :inhalt => 'email', :validat => true, :validation_typ => 'email', 
                            :needed => true, :position => 1, :fineform_id => self.id, :feld_typ => 'email')
    end
      
  end

  
end
