class RemovePlaylistColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :playlists, :artist, :string
    remove_column :playlists, :song_name, :string
    remove_column :playlists, :release_date, :integer
    remove_column :playlists, :on_itunes, :boolean
  end
end
