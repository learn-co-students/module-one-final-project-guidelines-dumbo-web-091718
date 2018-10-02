class AdoptionCenter < ActiveRecord::Migration[5.0]
  def change
    create_table :adoption do |t|
      t.integer :pet_id
      t.integer :user_id
    end 
  end
end
