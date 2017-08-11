class AddSlugToCreators < ActiveRecord::Migration
  def change
    add_column :creators, :slug, :string
    add_index :creators, :slug, unique: true
  end
end
