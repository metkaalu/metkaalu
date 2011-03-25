class AddCountryIdToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :country_id, :integer
  end

  def self.down
    remove_column :stores, :country_id
  end
end
