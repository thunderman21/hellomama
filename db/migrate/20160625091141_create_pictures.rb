class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :group_post, index: true, foreign_key: true
      t.attachment :image

      t.timestamps null: false
    end
  end
end
