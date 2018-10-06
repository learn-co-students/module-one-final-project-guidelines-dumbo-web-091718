class AddDefaultGenreToBandTable < ActiveRecord::Migration[5.0]
  def change
    change_column_default :bands, :genre, "Rock"
  end
end
