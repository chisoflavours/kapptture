class AddCreatorToRatees < ActiveRecord::Migration
  def change
    add_reference :ratees, :creator, index: true, foreign_key: true
  end
end
