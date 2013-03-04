class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :image , :name_e, :description_e;
  belongs_to :category
  mount_uploader :image, ImageUploader


  def category_name
    category.name if category
  end
end
