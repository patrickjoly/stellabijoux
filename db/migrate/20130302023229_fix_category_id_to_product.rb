class FixCategoryIdToProduct < ActiveRecord::Migration
  def change
     remove_column :products, :categoryId, :integer
    add_column :products, :category_id, :integer
  end


end
