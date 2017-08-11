class AddAttachmentProfileToCreators < ActiveRecord::Migration
  def self.up
    change_table :creators do |t|
      t.attachment :profile
    end
  end

  def self.down
    remove_attachment :creators, :profile
  end
end
