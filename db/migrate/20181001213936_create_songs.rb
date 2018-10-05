class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
     t.string :song_name
     t.string :album_name
     t.integer :release_date
     t.string :artist
     t.boolean :on_itunes
     t.string :mood
   end
  end
end
