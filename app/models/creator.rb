class Creator < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :kapps
  has_many :comments
  has_many :ratees
  has_attached_file :profile, styles: { large: "150x150#", medium: "100x100#", small: "50x50#"}
  validates_attachment_content_type :profile, content_type: /\Aimage\/.*\z/
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end
