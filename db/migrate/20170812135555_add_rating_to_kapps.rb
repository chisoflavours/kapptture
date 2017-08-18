class AddRatingToKapps < ActiveRecord::Migration
  def change
    add_column :kapps, :rating, :integer
  end
end
