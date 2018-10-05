class Playlist < ActiveRecord::Base
 belongs_to :user
 belongs_to :song

 # def show_playlist
 #   user.all.select do |user|
 #     user.playlist == self
 #   end
 # end
#
def self.save_song_to_playlist(user_id)
  self.create(user_id, artist, song_name, release_date, on_itunes)
end



end
