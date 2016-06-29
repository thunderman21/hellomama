class Diary < ActiveRecord::Base
	acts_as_votable
	#associations for the diary
	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy

	scope :of_followed_users, -> (following_users) { where user_id: following_users }  
end
