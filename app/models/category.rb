class Category < ActiveRecord::Base
  has_many :store_categories
  has_many :stores, :through => :store_categories
  has_many :product_categories
  has_many :products, :through => :product_categories
end
