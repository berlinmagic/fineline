class UpdateStrangeCategories < ActiveRecord::Migration
  
  def self.up
    
    add_column :werte, :name, :string
    
  end

  def self.down
    remove_column :werte, :name
  end
  
  
end