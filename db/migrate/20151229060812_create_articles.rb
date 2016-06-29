class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :post

      t.timestamps null: false
    end
  end
end
