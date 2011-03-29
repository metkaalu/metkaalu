class CreateStoreCategories < ActiveRecord::Migration
  def self.up
    create_table :store_categories do |t|
      t.integer :store_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :store_categories
  end
end
