class Product < ActiveRecord::Base
  belongs_to :store
  has_many :product_categories
  has_many :categories, :through => :product_categories
  validates :name, :presence => true
  has_many :product_images, :dependent => :destroy
  accepts_nested_attributes_for :product_images, :reject_if => lambda { |t| t['product_image'].nil?  }
  validates :description, :presence => true


  def self.search(query,idStore)
    unless query.to_s.empty?
      find(:all,:conditions=>['(name like ? or description like ?) and store_id = ?',"%#{query}%","%#{query}%",idStore],:order => 'created_at asc', :limit=>25)
    else
      find(:all, :conditions=>['store_id = ?',idStore],:order => 'created_at asc')
    end
  end
end
