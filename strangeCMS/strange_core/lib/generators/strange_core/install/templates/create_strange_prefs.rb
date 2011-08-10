class CreateStrangePrefs < ActiveRecord::Migration
  def self.up
    create_table "configurations", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "type",       :limit => 50
    end
    add_index "configurations", ["name", "type"], :name => "index_configurations_on_name_and_type"
    
    create_table "preferences", :force => true do |t|
      t.string   "name",       :limit => 100, :null => false
      t.integer  "owner_id",   :limit => 30,  :null => false
      t.string   "owner_type", :limit => 50,  :null => false
      t.integer  "group_id"
      t.string   "group_type", :limit => 50
      t.text     "value",      :limit => 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    add_index "preferences", ["owner_id", "owner_type", "name", "group_id", "group_type"], :name => "ix_prefs_on_owner_attr_pref", :unique => true
  end

  def self.down
    drop_table :configurations
    drop_table :preferences
  end
end