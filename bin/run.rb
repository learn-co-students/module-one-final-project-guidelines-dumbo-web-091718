require_relative '../config/environment'

@pastel = Pastel.new
@prompt = TTY::Prompt.new(active_color: :cyan)


def greeting
puts "Please enter your name to create your playlist:"
user_name = gets.chomp
@user = User.create(name: user_name)
pid = fork{ exec 'afplay', "OneDance.mp3" }
puts ""
puts ""
puts ""
puts ""
puts "WELCOME #{user_name.upcase} TO THE 6 GOD PLAYLIST GENERATOR"
puts ""
puts ""
puts ""
puts ""

$stdout.flush
sleep(2)
puts "

:‘#######::::::‘######::::‘#######::‘########::
‘##.... ##::::‘##... ##::‘##.... ##: ##.... ##:
##::::..::::: ##:::..::: ##:::: ##: ##:::: ##:
########::::: ##::’####: ##:::: ##: ##:::: ##:
##.... ##:::: ##::: ##:: ##:::: ##: ##:::: ##:
##:::: ##:::: ##::: ##:: ##:::: ##: ##:::: ##:
. #######:::::. ######:::. #######:: ########::
:.......:::::::......:::::.......:::........:::"

$stdout.flush
sleep(2)
puts ""
puts ""
puts ""
puts ""
puts "
_¶¶¶_¶¶_¶¶¶¶
¶__¶¶_¶¶___¶¶
¶___¶¶__¶¶___¶¶
¶_¶___¶¶___¶____¶_¶¶
¶_¶¶¶__¶¶___¶¶___¶¶_¶
¶_¶__¶___¶___¶¶___¶__¶
¶¶¶¶_¶¶___¶¶__¶¶__¶__¶
¶__¶__¶¶___¶___¶___¶_¶¶
¶__¶___¶____¶___¶___¶_¶¶
¶___¶___¶___¶¶__¶¶___¶__¶
¶¶___¶¶__¶¶___¶____¶_____¶
¶___¶_¶___¶¶______________¶
¶¶__¶¶_¶___¶______________¶¶
_¶___¶_¶___________________¶
__¶___¶_¶__________________¶
___¶___¶¶¶_________________¶
____¶_¶__¶_________________¶¶
____¶____¶¶_________________¶
____¶_____¶_________________¶
____¶¶____¶__________________¶
_____¶_____¶_________________¶
_____¶¶____¶¶________________¶_
______¶_____¶¶________________¶¶¶¶¶¶
_______¶_____¶¶_______________¶¶¶¶¶¶¶
______¶¶¶_____¶¶_____________¶¶¶¶¶¶¶¶
_____¶¶¶¶¶______¶¶__________¶¶¶¶¶¶¶¶
_____¶¶¶¶¶_______¶¶¶_______¶¶¶¶¶¶¶¶
____¶¶¶¶¶¶_________¶¶¶____¶¶¶¶¶¶¶¶¶
____¶¶¶¶¶__________¶¶¶¶__¶¶¶¶¶¶¶¶¶¶
____¶¶¶¶¶_________¶¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶
____¶¶¶¶¶¶______¶¶¶¶¶___¶¶¶¶¶¶¶¶¶¶¶
____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶___¶¶¶¶¶¶¶¶¶¶
_____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶____¶¶¶¶¶¶¶¶¶¶
______¶¶¶¶¶¶¶¶¶¶¶¶¶____¶¶¶¶¶¶¶¶¶¶
_______¶¶¶¶¶¶¶¶¶¶¶______¶¶¶¶¶¶¶¶
"
end

def menu
  puts ""
  puts ""
  puts ""
  puts ""
  # puts "Pick an option:"
   # " - Song   : Pick a song based on your mood"
   # " - Views  : View playlist of songs you're Draking to"
   # " - Delete : Clears out your playist"
   # " - Exit   : Exits 6 God Generator"

choice = @prompt.select("Pick an option:", [ " - Song   : Pick a song based on your mood",
  # " - Save   : Saves to you playlist",
 " - Views  : View playlist of songs you're Draking to",
 " - Delete : Clears out your playist",
 " - Exit   : Exits 6 God Generator"])
case choice
when " - Song   : Pick a song based on your mood"
  mood
  save_song
  menu
when " - Save   : Saves to your playlist"
  save_song
  menu
when " - Views  : View playlist of songs you're Draking to"
  your_playlist
  menu
when " - Delete : Clears out your playist"
  delete_playlist
  menu
when " - Exit   : Exits 6 God Generator"
  exit_drake
end
end

def mood
  puts ""
  puts ""
  puts ""
  puts ""
moods = ["Don't Drake and Drive", "Money Monday", "Hype Mode", "Feel Good", "Dance Party"]
current_mood = @prompt.select("Please pick a following mood : ", ["Don't Drake and Drive", "Money Monday", "Hype Mode", "Feel Good", "Dance Party"])

# moods.each do |mood|
#   mood
# end


puts " "
puts " "



# current_mood = gets.chomp
if moods.include?(current_mood)
puts "You've chosen #{current_mood}, here's a Drake song we recommend!"
puts ""
puts ""
puts ""
puts ""
@recommended_song = Song.find_by_moods(current_mood).sample
@user.update({:mood=> current_mood})
@song_info = { artist: "#{@recommended_song.artist}", song_name: "#{@recommended_song.song_name}", release_date: "#{@recommended_song.release_date}", on_itunes: "#{@recommended_song.on_itunes}"}
puts ""
puts ""
puts ""
puts ""
@song_info.each do |info, value|
  puts "#{info.upcase} : #{value}"
end
else
  puts ""
  puts ""
  puts ""
  puts ""
  puts "That is not a valid mood"
end
end


def save_song
  puts ""
  puts ""
  puts ""
  playlist_save = @prompt.select("Would you like to save this song to your playlist?", %w(Yes No))
   # playlist_save = gets.chomp
     if playlist_save == 'Yes'
       # @saved = []
       @playlist = Playlist.new(@song_info)
       @playlist.update({:user_id => @user.id})
       @playlist.update({:song_id => @recommended_song.id})
       # @user.update({:playlist_id => @playlist.id})
       # @playlist.update({:song_name => @recommended_song.song_name})
       # @saved<<
       @playlist.save
       puts ""
       puts ""
       puts ""
       puts ""
     puts "Saved to Playlist!"
   else
     puts ""
     puts ""
     puts ""
     puts ""
     puts "Let's try another song!"
     menu
  end
end





  def your_playlist
    puts ""
    puts ""
    puts ""
    puts ""
    show_playlist = @prompt.select("Would you like to see the songs in your playlist?", %w(Yes No))
    puts ""
  puts ""
  puts ""
  puts ""

    if show_playlist == 'Yes'

      puts "Here is your current song playlist:"
      puts ""
      puts ""
      puts ""
      puts ""

      # binding.pry
      @user = User.find_by(id: @user.id)
       our_playlist = @user.playlists.map do |playlist|
         # binding.pry
         playlist.song_name
       end
     end
     puts ""
     puts ""
     puts ""
     puts ""
       puts our_playlist
   end

       def delete_playlist
         @user.playlists.clear
         puts ""
         puts ""
         puts ""
         puts ""
         puts "You have no songs in your playlist"
       end



  def exit_drake
    puts  "
      #### ########    ##    ##  #######  ##     ## ########  ########
       ##  ##           ##  ##  ##     ## ##     ## ##     ## ##
       ##  ##            ####   ##     ## ##     ## ##     ## ##
       ##  ######         ##    ##     ## ##     ## ########  ######
       ##  ##             ##    ##     ## ##     ## ##   ##   ##
       ##  ##             ##    ##     ## ##     ## ##    ##  ##
      #### ##             ##     #######   #######  ##     ## ########
       ########  ########    ###    ########  #### ##    ##  ######
       ##     ## ##         ## ##   ##     ##  ##  ###   ## ##    ##
       ##     ## ##        ##   ##  ##     ##  ##  ####  ## ##
       ########  ######   ##     ## ##     ##  ##  ## ## ## ##   ####
       ##   ##   ##       ######### ##     ##  ##  ##  #### ##    ##
       ##    ##  ##       ##     ## ##     ##  ##  ##   ### ##    ##
       ##     ## ######## ##     ## ########  #### ##    ##  ######
         ######## ##     ## ####  ######     #### ########  ######
            ##    ##     ##  ##  ##    ##     ##     ##    ##    ##
            ##    ##     ##  ##  ##           ##     ##    ##
            ##    #########  ##   ######      ##     ##     ######
            ##    ##     ##  ##        ##     ##     ##          ##
            ##    ##     ##  ##  ##    ##     ##     ##    ##    ##
            ##    ##     ## ####  ######     ####    ##     ######
    ########  #######   #######     ##          ###    ######## ########
       ##    ##     ## ##     ##    ##         ## ##      ##    ##
       ##    ##     ## ##     ##    ##        ##   ##     ##    ##
       ##    ##     ## ##     ##    ##       ##     ##    ##    ######
       ##    ##     ## ##     ##    ##       #########    ##    ##
       ##    ##     ## ##     ##    ##       ##     ##    ##    ##
       ##     #######   #######     ######## ##     ##    ##    ########"

  end



def run
   greeting
   menu
   input = gets.chomp
   while input != "Exit"
if input == "Song"
   mood
   save_song
   your_playlist
   menu
   input = gets.chomp
 elsif input == "Views"
     your_playlist


     menu

   elsif input == "Exit"
       exit_drake
     end
end
end
run
