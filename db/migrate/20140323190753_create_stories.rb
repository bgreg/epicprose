class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :picture_url
      t.string :turn

      t.timestamps
    end
  end
end
