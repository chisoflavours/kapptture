class Comment < ActiveRecord::Base
  belongs_to :kapp
  belongs_to :creator
end
