class AddColumnsToBandTable < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :genre, :string
    add_column :bands, :tech_ability, :integer
    add_column :bands, :presentation, :integer
    add_column :bands, :stage_presence, :integer
    add_column :bands, :lyrics, :integer
  end
end
