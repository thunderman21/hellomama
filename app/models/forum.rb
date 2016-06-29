class Forum < ActiveRecord::Base
	include Bootsy::Container
	acts_as_votable
	
	belongs_to :user
	#associations
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :users, through: :comments, as: :commentable

	#scopes
	scope :recent, ->{ order('created_at DESC')}
	scope :trending, ->{ order('comments_count DESC')}  
	scope :unanswered, ->{ where(comments_count:0)}
end
