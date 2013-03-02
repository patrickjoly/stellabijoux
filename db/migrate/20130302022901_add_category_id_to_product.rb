class AddCategoryIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :categoryId, :integer
  end
end
