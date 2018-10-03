class CreateBandTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bands do |t|
      t.string :name
    end
  end
end
