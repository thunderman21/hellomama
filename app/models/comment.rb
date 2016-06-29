class Comment < ActiveRecord::Base
	acts_as_votable
	#Associations
	belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user
end
