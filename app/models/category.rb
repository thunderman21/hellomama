class Category < ActiveRecord::Base
	has_many :subcategory
	has_many :articles, through: :article
end
