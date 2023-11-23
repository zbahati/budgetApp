class ChangeColumnNameAndTypeInCategories < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories, :icon, :image_data
    change_column :categories, :image_data, :text
  end
end
