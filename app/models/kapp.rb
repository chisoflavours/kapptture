class Kapp < ActiveRecord::Base
  
  acts_as_votable
  belongs_to :creator
  belongs_to :category
  has_many :comments
  has_many :ratees
  has_attached_file :thumbnail, styles: { medium: "250x170#" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  def self.search(search)
    where("title LIKE ? ", "%#{search}%") 
  end
end
