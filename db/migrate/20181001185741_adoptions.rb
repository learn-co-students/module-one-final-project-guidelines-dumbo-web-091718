class Adoptions < ActiveRecord::Migration[5.0]
  def change
    create_table :adoptions do |t|
      t.integer :pet_id
      t.integer :user_id
    end
  end
end
