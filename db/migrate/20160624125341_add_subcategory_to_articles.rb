class AddSubcategoryToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :subcategory, index: true, foreign_key: true
  end
end
