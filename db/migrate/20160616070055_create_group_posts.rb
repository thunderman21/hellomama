class CreateGroupPosts < ActiveRecord::Migration
  def change
    create_table :group_posts do |t|
      t.text :post
      t.references :group, index: true, foreign_key: true
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
