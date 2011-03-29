class RemoveLogoFromStore < ActiveRecord::Migration
  def self.up
    remove_column :stores, :logo
  end

  def self.down
    add_column :stores, :logo, :string
  end
end
