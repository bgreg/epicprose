class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :body
      t.references :story
      t.timestamps
    end
  end
end
