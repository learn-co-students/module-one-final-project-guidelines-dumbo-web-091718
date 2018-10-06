class CreateJudgeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :judges do |t|
      t.string :name 
    end
  end
end
