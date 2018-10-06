class CreateResponsesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :judge_id
      t.string :content
      t.integer :score
    end
  end
end
