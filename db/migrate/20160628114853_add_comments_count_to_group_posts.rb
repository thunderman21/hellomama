class AddCommentsCountToGroupPosts < ActiveRecord::Migration
  def change
    add_column :group_posts, :comments_count, :integer, :default => 0
  end
end
