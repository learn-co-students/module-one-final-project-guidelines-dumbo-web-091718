require_relative '../config/environment'
require 'progress_bar'
require 'pry'
require 'catpix'
require 'rmagick'


def clear_screen
  puts `clear`
end

def print_title
  title = <<HEREDOC
  ▄▄▄▄    ▄▄▄      ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████     ▒█████    █████▒
 ▓█████▄ ▒████▄    ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀    ▒██▒  ██▒▓██   ▒
 ▒██▒ ▄██▒██  ▀█▄  ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███      ▒██░  ██▒▒████ ░
 ▒██░█▀  ░██▄▄▄▄██ ░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄    ▒██   ██░░▓█▒  ░
 ░▓█  ▀█▓ ▓█   ▓██▒  ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒   ░ ████▓▒░░▒█░
 ░▒▓███▀▒ ▒▒   ▓▒█░  ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░   ░ ▒░▒░▒░  ▒ ░
 ▒░▒   ░   ▒   ▒▒ ░    ░        ░    ░ ░ ▒  ░ ░ ░  ░     ░ ▒ ▒░  ░
  ░    ░   ░   ▒     ░        ░        ░ ░      ░      ░ ░ ░ ▒   ░ ░
  ░            ░  ░                      ░  ░   ░  ░       ░ ░
       ░
 ▄▄▄█████▓ ██░ ██ ▓█████     ▄▄▄▄    ▄▄▄       ███▄    █ ▓█████▄   ██████
 ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀    ▓█████▄ ▒████▄     ██ ▀█   █ ▒██▀ ██▌▒██    ▒
 ▒ ▓██░ ▒░▒██▀▀██░▒███      ▒██▒ ▄██▒██  ▀█▄  ▓██  ▀█ ██▒░██   █▌░ ▓██▄
 ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄    ▒██░█▀  ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█▄   ▌  ▒   ██▒
   ▒██▒ ░ ░▓█▒░██▓░▒████▒   ░▓█  ▀█▓ ▓█   ▓██▒▒██░   ▓██░░▒████▓ ▒██████▒▒
   ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░   ░▒▓███▀▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ▒▒▓  ▒ ▒ ▒▓▒ ▒ ░
     ░     ▒ ░▒░ ░ ░ ░  ░   ▒░▒   ░   ▒   ▒▒ ░░ ░░   ░ ▒░ ░ ▒  ▒ ░ ░▒  ░ ░
   ░       ░  ░░ ░   ░       ░    ░   ░   ▒      ░   ░ ░  ░ ░  ░ ░  ░  ░
           ░  ░  ░   ░  ░    ░            ░  ░         ░    ░          ░
                                  ░                       ░
HEREDOC

pastel = Pastel.new
puts pastel.green(title)
end

def welcome
  @prompt = TTY::Prompt.new
  @spinner = TTY::Spinner.new("[:spinner]Loading ...", format: :flip)
  clear_screen
  clear_screen
  clear_screen
  pid = fork{exec 'afplay', '/Users/donovandwyer/Development/code/module-one-final-project-guidelines-dumbo-web-091718/lib/washedout.mp3'}
  print_title
  puts "Welcome to the Battle of the Bands!"
  @prompt.keypress("Press any key to continue")
  clear_screen

  main_menu
end

def main_menu
  print_title
  choice = @prompt.select("Would you like to create a new account or log in to an existing account?", ["Sign Up", "Login", "Exit"])
  if choice == "Login"
    log_in
  elsif choice == "Exit"
    exit_game
  else
    create_account
  end
end

def exit_game
  pid = fork{ exec 'killall afplay'}
  clear_screen
end

def create_account
  clear_screen
  print_title
  @name = @prompt.ask("What is your name?")
  if !User.all.find_by(name: @name).nil? && User.all.find_by(name: @name).name == @name
    choice = @prompt.select("Account already exists. What would you like to do?", ["Login", "Delete Account", "Try Again", "Exit"])
    case choice
    when "Login"
      band_menu
    when "Delete Account"
      delete_user
    when "Try Again"
      create_account
    when "Exit"
      exit_game
    end
  else
    @user_1 = User.create(name: @name)
    loading
    create_band
  end
end

def loading_bar
  bar = ProgressBar.new(50, :bar, :percentage)

  50.times do
    sleep 0.1
    bar.increment!
  end
end

def delete_user
  User.all.find_by(name: @name).destroy
  puts "#{@name} has been deleted."
  sleep(3)
  main_menu
end

def refresh_user
  @user_1 = User.find_by(name: @name.titleize) unless @name == nil
end

def log_in
  clear_screen
  print_title
  @name = @prompt.ask("What is the name on the existing account?")
  refresh_user
  if @user_1.nil?
    clear_screen
    print_title
    puts "There is no user by that name. Please create a new account."
    sleep(3)
    clear_screen
    main_menu
  else
    band_menu
  end
end

def loading
  clear_screen
  print_title
  @spinner.auto_spin
  sleep(2)
  @spinner.stop
end

def band_menu
  clear_screen
  print_title
  choice = @prompt.select("Would you like to create a new band or play an existing band?", ["Create New Band", "Load Bands", "Go Back"])

  if choice == "Create New Band"
    create_band
  elsif choice == "Load Bands"
    loading
    load_bands
  elsif choice == "Go Back"
    main_menu
  end
end

def create_band
  clear_screen
  print_title
  band_name = @prompt.ask("What is the name of your band?")
  @band_1 = @user_1.bands.create(name: band_name)
  edit_stats
end

def load_bands
  refresh_user
  clear_screen
  print_title
  if @user_1.bands.empty?
    clear_screen
    print_title
    puts "There are no bands associated with this account. Let's create a new band for you to get you started."
    sleep(3)
    create_band
  else
    user_bands = ["Go Back"]
    @user_1.bands.map do |band|
      user_bands.unshift(band.name)
    end
    clear_screen
    print_title
    choice = @prompt.select("Select a band to load:", user_bands)
    if choice == "Go Back"
      band_menu
    else
      @band_1 = @user_1.bands.find_by(name: choice)
      band_options
    end
  end
end

def band_options
  clear_screen
  print_title
  choice = @prompt.select("What would you like to do with #{@band_1.name}?", ["Play Band", "Rename Band", "Edit Stats", "Delete Band", "Go back"])
  case choice
  when "Play Band"
    loading
    play_band
  when "Rename Band"
    rename_band
  when "Edit Stats"
    edit_stats
  when "Delete Band"
    delete_band
  when "Go back"
    load_bands
  end
end

def rename_band
  clear_screen
  print_title
  new_name = @prompt.ask("What would you like to change #{@band_1.name}'s name to?")
  @band_1.name = new_name
  @band_1.save
  band_options
end

def select_genre
  clear_screen
  print_title
  @genre = @prompt.select("What is the genre of your band?", ["Rock", "Pop", "Rap", "Country"])
  @band_1.update(genre: @genre)
  @band_1.save
  clear_screen
  print_title
  puts "#{@band_1.name} is now officially a #{@genre} group."
  if @band_1.tech_ability.nil?
    select_stats
  else
    choice = @prompt.select("Would you like to edit your band's stats or go straight to playing the game?", ["Edit Stats", "Reselect Genre", "Play"])
  end
  if choice == "Edit Stats"
    select_stats
  elsif choice == "Reselect Genre"
    select_genre
  else
    loading
    play_band
  end
end

def select_stats
  clear_screen
  print_title
  attributes = []
  array = ['Presentation', 'Stage Presence', 'Lyrics', 'Tech Ability']

  first_att = @prompt.select("What feature would you like to emphasize the most for your band?", array)
  attributes << first_att
  arr_1 = array - [first_att]

  second_att = @prompt.select("What feature would you like to emphasize second for your band?", arr_1)
  attributes << second_att
  arr_2 = arr_1 - [second_att]

  third_att = @prompt.select("What feature would you like to emphasize third for your band?", arr_2)
  attributes << third_att
  arr_3 = arr_2 - [third_att]
  attributes << arr_3[0]

  count = 4
  att_hash = {}
  attributes.map do |att|
    att = att.gsub(" ", "_").downcase
    att_hash[att.to_sym] = count
    count -= 1
  end
  @band_1.update(att_hash)
  @band_1.save
  clear_screen
  print_title
  puts "#{@band_1.name}'s stats have been set."
  choice = @prompt.select("Would you like to edit the genre for the band or go straight to playing the game?", ["Edit Genre", "Reselect Stats", "Play"])
  if choice == "Edit Genre"
    select_genre
  elsif choice == "Reselect Stats"
    select_stats
  else
    loading
    play_band
  end
end

def edit_stats
  clear_screen
  print_title
  choice = @prompt.select("Please select one of the following:", ["Genre", "Band Stats"])
  case choice
  when "Genre"
    select_genre
  when "Band Stats"
    select_stats
  end
end

def delete_band
  @band_1.destroy
  puts "#{@band_1.name} has been deleted."
  sleep(3)
  load_bands
end

def assign_judges
  # @paula = Judge.find_by(name: "Paula Abdul")
  # @paula.update(preferred_att2: ["Presentation", "Lyrics", "tech_ability"].sample)
  # @simon = Judge.find_by(name: "Simon Cowell")
  # @randy = Judge.find_by(name: "Randy Jackson")
  @simon = Judge.create(name: "Simon Cowell", preferred_att1: "tech_ability", preferred_att2: "presentation")
  @paula = Judge.create(name: "Paula Abdul", preferred_att1: "stage_presence", preferred_att2: "lyrics")
  @randy = Judge.create(name: "Randy Jackson", preferred_att1: "lyrics", preferred_att2: "presentation")
end


def create_user_2
  @user_2 = User.find_by(name: "CPU")
  @band_2 = @user_2.bands.sample
end

def judge_scores
  x = 0
  y = 0
  x += @simon.grade(@band_1)
  x += @paula.grade(@band_1)
  x += @randy.grade(@band_1)
  y += @simon.grade(@band_2)
  y += @paula.grade(@band_2)
  y += @randy.grade(@band_2)
  return x, y
end

def audience_scores
  @audience_1 = @band_1.create_audience
  @audience_2 = @band_2.create_audience

  x = @audience_1.grade(@band_1)
  y = @audience_2.grade(@band_2)

  return x, y
end

def battle_sequence
  clear_screen
  sleep(2)
  puts "#{@user_1.name}'s band #{@band_1.name}"
  sleep(2)
  puts "\r...VERSUS..."
  sleep(2)
  puts "\r#{@user_2.name}'s band #{@band_2.name}"
  sleep(3)
  puts "The battle begins..."
  sleep(3)
  puts "NOW!"
  sleep(2)
  clear_screen
  # puts "#{@band_1.name.}"
  loading_bar
end

def play_band
  pid = fork{ exec 'killall afplay'}
  assign_judges
  create_user_2

  battle_sequence

  score3, score4 = judge_scores
  score1, score2 = audience_scores

  band_1_score = (score1 + score3)/4
  band_2_score = (score2 + score4)/4

  if band_1_score > band_2_score
    clear_screen
    puts "#{@band_1.name} is the winner!"
  elsif band_2_score > band_1_score
    clear_screen
    puts "#{@band_2.name} is the winner!"
  elsif band_1_score == band_2_score
    clear_screen
    puts "It's a tie!"
  end
  continue?
end

def continue?
  choice = @prompt.select("Would you like to play again?", ["Play Again", "Quit Game"])
  if choice == "Play Again"
    welcome
  elsif choice == "Quit Game"
    exit_game
  end
end
