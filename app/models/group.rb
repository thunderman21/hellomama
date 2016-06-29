class Group < ActiveRecord::Base
	has_many :membership
	belongs_to :user
	has_many :users, through: :membership
	has_many :group_post
end
