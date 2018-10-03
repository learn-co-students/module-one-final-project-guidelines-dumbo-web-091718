class AddColumnsToJudgeTable < ActiveRecord::Migration[5.0]
  def change
    add_column :judges, :preferred_att1, :string
    add_column :judges, :preferred_att2, :string
  end
end
