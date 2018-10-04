class CreateUserwalls < ActiveRecord::Migration[5.0]
  def change
    create_table :userwalls do |t|
      t.integer :user_id
      t.integer :wall_id
      t.timestamps
    end
  end
end
