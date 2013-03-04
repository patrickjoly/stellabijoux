class AddEnglishColumToProduct < ActiveRecord::Migration
  def change
    add_column :products, :name_e, :string
    add_column :products, :description_e, :string
  end
end
