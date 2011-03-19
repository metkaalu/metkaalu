class Store < ActiveRecord::Base
  has_many :products
  validates :name, :uniqueness => true
  validates :description, :presence => true
  def self.search(query)
    unless query.to_s.empty?
      find(:all,:conditions=>['name like ? or description like ?',"%#{query}%","%#{query}%"],:order => 'created_at desc', :limit=>25)
    else
      find(:all)
    end
  end
end
