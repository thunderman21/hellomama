class AddTitleToForum < ActiveRecord::Migration
  def change
    add_column :forums, :title, :string
  end
end
