class AddStoreIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :store_id, :string
  end

  def self.down
    remove_column :products, :store_id
  end
end
