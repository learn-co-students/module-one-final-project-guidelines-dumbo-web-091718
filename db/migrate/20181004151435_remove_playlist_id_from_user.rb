class RemovePlaylistIdFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :playlist_id, :integer
  end
end
