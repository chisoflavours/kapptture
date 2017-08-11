class AddCategoryIdToKapps < ActiveRecord::Migration
  def change
    add_column :kapps, :category_id, :integer
  end
end
