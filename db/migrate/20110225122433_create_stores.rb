class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :country
      t.string :state
      t.string :city
      t.string :zip
      t.string :phone
      t.string :logo
      t.string :currency
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
