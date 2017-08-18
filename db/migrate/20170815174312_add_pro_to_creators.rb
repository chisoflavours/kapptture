class AddProToCreators < ActiveRecord::Migration
  def change
    add_column :creators, :pro, :boolean
  end
end
