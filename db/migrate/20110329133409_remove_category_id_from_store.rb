class RemoveCategoryIdFromStore < ActiveRecord::Migration
  def self.up
    remove_column :stores, :category_id
  end

  def self.down
    add_column :stores, :category_id, :int
  end
end
