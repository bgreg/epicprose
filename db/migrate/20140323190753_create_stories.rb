class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :picture_url
      t.integer :turn
      t.boolean :completed

      t.timestamps
    end
  end
end
