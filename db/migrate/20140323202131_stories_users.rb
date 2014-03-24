class UsersStories < ActiveRecord::Migration
  def change
    create_table :user_has_story, id: false do |t|
      t.integer :story_id
      t.integer :user_id

      t.timestamps
    end
    add_index :user_has_story, :user_id
    add_index :user_has_story, :story_id
  end
end
