class AddCreatorIdToKapp < ActiveRecord::Migration
  def change
    add_column :kapps, :creator_id, :integer
  end
end
