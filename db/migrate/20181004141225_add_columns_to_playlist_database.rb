class AddColumnsToPlaylistDatabase < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :artist, :string
    add_column :playlists, :song_name, :string
    add_column :playlists, :release_date, :integer
    add_column :playlists, :on_itunes, :boolean
  end
end
