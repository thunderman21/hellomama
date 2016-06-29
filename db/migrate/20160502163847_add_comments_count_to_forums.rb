class AddCommentsCountToForums < ActiveRecord::Migration
  def change
    add_column :forums, :comments_count, :integer, :default => 0
  end
end
