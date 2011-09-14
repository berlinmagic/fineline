# encoding: utf-8
# 
#  Update  > Version 0.0.17
# 
class UpdateStrangeHeader1 < ActiveRecord::Migration
  
  def self.up
    add_column :hpics, :extendit, :boolean, :default => false
    add_column :hpics, :fadeit, :boolean, :default => false
    add_column :hpics, :fade_factor, :integer, :default => 13
    add_column :header_hpics, :extendit, :boolean, :default => false
    add_column :header_hpics, :fadeit, :boolean, :default => false
    add_column :header_hpics, :fade_factor, :integer, :default => 13
  end

  def self.down
    remove_column :hpics, :extendit
    remove_column :hpics, :fadeit
    remove_column :hpics, :fade_factor
    remove_column :header_hpics, :extendit
    remove_column :header_hpics, :fadeit
    remove_column :header_hpics, :fade_factor
  end
  
end