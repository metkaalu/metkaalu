class Store < ActiveRecord::Base
  has_many :products
  has_many :store_categories
  has_many :categories, :through => :store_categories
  belongs_to :country
  belongs_to :user
  has_attached_file :logo ,
    :url => "/attachments/store/:id/logo/:style/:basename.:extension",
    :path => "#{Rails.root}/public/attachments/store/:id/logo/:style/:basename.:extension"
  validates :name, :uniqueness => true
  validates :description, :presence => true
  
  def self.search(query,country_id)
    print(query," - ",country_id)

    if( !query.to_s.empty? and !country_id.to_s.empty? )
        return find(:all,:conditions=>['(name like ? or description like ?) and country_id = ?',"%#{query}%","%#{query}%",country_id.to_i(10)],:order => 'created_at desc', :limit=>25)
    else
      unless query.to_s.empty?
        return find(:all,:conditions=>['name like ? or description like ?',"%#{query}%","%#{query}%"],:order => 'created_at desc', :limit=>25)
      end
      unless country_id.to_s.empty?
        return find(:all,:conditions=>['country_id = ?',country_id.to_i(10)],:order => 'created_at desc', :limit=>25)
      end
    end    
    
    if (query.to_s.empty? or query.nil?) and (country_id.to_s.empty? or country_id.nil?)
      find(:all)
    end
  end

  def country_name
    country.name if country
  end
end
