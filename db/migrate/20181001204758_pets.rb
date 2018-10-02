class Pets < ActiveRecord::Migration[5.0]
  def change
      create_table :pets do |t|
      t.string :name
      t.string :kind
      t.string :temperament
      t.integer :age
    end
  end
end
