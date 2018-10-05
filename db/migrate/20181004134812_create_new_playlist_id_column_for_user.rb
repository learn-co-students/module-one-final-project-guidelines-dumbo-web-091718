class CreateNewPlaylistIdColumnForUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :playlist_id, :integer
  end
end
