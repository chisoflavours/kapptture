class Comment < ActiveRecord::Base
  validates_length_of :content, :maximum => 5
  
  belongs_to :kapp
  belongs_to :creator
end
