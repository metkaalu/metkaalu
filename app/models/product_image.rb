class ProductImage < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image,
    :url => "images/products/:attachment/:id/:style/:basename/.:extension",
    :path => "#{Rails.root}/public/images/images/products/:attachment/:id/:style/:filename"
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes

  def url(*args)
    :image.url(*args)
  end

  def name
    image_file_name
  end

  def content_type
    image_content_type
  end

  def file_size
    image_file_size
  end
  
end
