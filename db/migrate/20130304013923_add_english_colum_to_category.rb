class AddEnglishColumToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :name_e, :string
  end
end
