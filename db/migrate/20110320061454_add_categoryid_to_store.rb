class AddCategoryidToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :category_id, :int
  end

  def self.down
    remove_column :stores, :category_id
  end
end
