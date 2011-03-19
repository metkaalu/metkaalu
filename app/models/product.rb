class Product < ActiveRecord::Base
  belongs_to :store
  has_many :product_image, :dependent => :destroy
  accepts_nested_attributes_for :product_image, :reject_if => lambda { |t| t['product_image'].nil?  }
  validates :name, :uniqueness => true
  validates :description, :presence => true


  def self.search(query,idStore)
    unless query.to_s.empty?
      find(:all,:conditions=>['(name like ? or description like ?) and store_id = ?',"%#{query}%","%#{query}%",idStore],:order => 'created_at desc', :limit=>25)
    else
      find(:all)
    end
  end
end
