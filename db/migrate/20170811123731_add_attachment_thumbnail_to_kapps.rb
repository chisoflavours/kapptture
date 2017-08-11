class AddAttachmentThumbnailToKapps < ActiveRecord::Migration
  def self.up
    change_table :kapps do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :kapps, :thumbnail
  end
end
