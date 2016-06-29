class GroupPost < ActiveRecord::Base
	#associations
	belongs_to :user
  belongs_to :group
  has_many :picture
  
end
