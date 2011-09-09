# encoding: utf-8
# ========================================================================================================================
# =>      Update1  > Version 0.0.3
# ========================================================================================================================
class UpdateStrangeStylez < ActiveRecord::Migration
  def self.up
    
    add_column :fine_styles, :theme_name, :string       # => Theme-Name .. eg: 'default'
    add_column :fine_styles, :fine_type,  :string       # => Typ ... eg: User-Style / Theme-Style
    
  end

  def self.down
    remove_column :fine_styles, :theme_name
    remove_column :fine_styles, :fine_type
  end
end