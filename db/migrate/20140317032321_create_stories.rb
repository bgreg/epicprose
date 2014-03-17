class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :picture_url
      t.integer :genre_id
      t.integer :user_id

      t.timestamps
    end
  end
end
