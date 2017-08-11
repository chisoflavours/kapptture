class AddSlugToKapps < ActiveRecord::Migration
  def change
    add_column :kapps, :slug, :string
    add_index :kapps, :slug, unique: true
  end
end
