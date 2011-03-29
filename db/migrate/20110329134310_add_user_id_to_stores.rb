class AddUserIdToStores < ActiveRecord::Migration
  def self.up
    add_column :stores, :user_id, :string
  end

  def self.down
    remove_column :stores, :user_id
  end
end
