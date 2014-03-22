class CreateWritingPrompts < ActiveRecord::Migration
  def change
    create_table :writing_prompts do |t|
      t.string :body
      t.timestamps
    end
  end
end
