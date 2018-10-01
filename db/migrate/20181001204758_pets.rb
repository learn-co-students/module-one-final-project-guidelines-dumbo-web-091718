class Pets < ActiveRecord::Migration[5.0]
  def change
      create_table :pets do |t|
      t.string :name
      t.string :pets_food
      t.string :pet_routine
      t.string :kind
      t.string :temperament
      t.string :color
      t.string :skills
      t.integer :age
    end
  end
end
