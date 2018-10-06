class AddColumnToBandTable < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :user_id, :integer
  end
end
