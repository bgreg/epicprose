class StoryRoles < ActiveRecord::Migration
  def change
    create_table :story_roles do |t|
      t.integer :story_id
      t.integer :user_id
      t.string  :role

      t.timestamps
    end
    add_index :story_roles, :user_id
    add_index :story_roles, :story_id
    add_index :story_roles, :role
  end
end
