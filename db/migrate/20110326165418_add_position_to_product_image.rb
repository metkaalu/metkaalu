class AddPositionToProductImage < ActiveRecord::Migration
  def self.up
    add_column :product_images, :position, :integer
  end

  def self.down
    remove_column :product_images, :position
  end
end
