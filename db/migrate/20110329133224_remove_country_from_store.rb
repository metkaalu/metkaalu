class RemoveCountryFromStore < ActiveRecord::Migration
  def self.up
    remove_column :stores, :country
  end

  def self.down
    add_column :stores, :country, :string
  end
end
