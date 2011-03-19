class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string "full_name", :limit => 100
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
