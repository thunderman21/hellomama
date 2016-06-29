class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :post
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
