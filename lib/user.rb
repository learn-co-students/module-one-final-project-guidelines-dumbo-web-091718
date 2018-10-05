class User < ActiveRecord::Base
has_many :playlists
has_many :songs, :through => :playlists

  # def self.song_by_mood(mood)
  #   Song.all.select do |songs|
  #     songs.mood == mood
  #   end
  # end
  def songs
    our_songs = Playlist.all.select do |playlist|
      playlist.user == self
    end
    our_songs.map do |playlist|
      playlist.song
    end
  end





  # def song_by_name
  #   self.map do |songs|
  #     songs.name
  #   end
  # end

# mood = gets.chomp
# puts "heres song for your mood"
# User.find_by_moods(mood).find do |song|
#   song
# end
# song.song_name




end
