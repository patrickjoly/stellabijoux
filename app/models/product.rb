class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :image, :category_id
  belongs_to :category
  mount_uploader :image, ImageUploader


  def category_name
    category.name if category
  end
end
