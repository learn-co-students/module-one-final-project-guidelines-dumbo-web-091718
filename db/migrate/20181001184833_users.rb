
class Users < ActiveRecord::Migration[5.0]
    def change
      create_table :users do |t|
      t.string :name
      t.string :city
      t.integer :income
      t.boolean :is_nice

   end

  end
end
