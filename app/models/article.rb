class Article < ActiveRecord::Base
	include Bootsy::Container
	acts_as_votable

	#Associations
	belongs_to :subcategory
	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :users, through: :comments, as: :commentable

	#scopes
	scope :recent, ->{ order('created_at DESC') }
	scope :trending, ->{ order('comments_count DESC') }
end
