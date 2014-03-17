class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :body
      t.integer :story_id
      t.integer :user_id

      t.timestamps
    end
  end
end
