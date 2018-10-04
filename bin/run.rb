require_relative '../config/environment'
require 'pry'

def clear_screen
  puts `clear`
end

def print_title
  title = <<HEREDOC
  ▄▄▄▄    ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████        ▒█████    █████▒
▓█████▄ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀       ▒██▒  ██▒▓██   ▒
▒██▒ ▄██▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███         ▒██░  ██▒▒████ ░
▒██░█▀  ░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄       ▒██   ██░░▓█▒  ░
░▓█  ▀█▓ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒      ░ ████▓▒░░▒█░
░▒▓███▀▒ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░      ░ ▒░▒░▒░  ▒ ░
▒░▒   ░   ▒   ▒▒ ░   ░        ░    ░ ░ ▒  ░ ░ ░  ░        ░ ▒ ▒░  ░
░    ░   ░   ▒    ░        ░        ░ ░      ░         ░ ░ ░ ▒   ░ ░
░            ░  ░                     ░  ░   ░  ░          ░ ░
     ░
▄▄▄█████▓ ██░ ██ ▓█████        ▄▄▄▄    ▄▄▄       ███▄    █ ▓█████▄   ██████
▓  ██▒ ▓▒▓██░ ██▒▓█   ▀       ▓█████▄ ▒████▄     ██ ▀█   █ ▒██▀ ██▌▒██    ▒
▒ ▓██░ ▒░▒██▀▀██░▒███         ▒██▒ ▄██▒██  ▀█▄  ▓██  ▀█ ██▒░██   █▌░ ▓██▄
░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄       ▒██░█▀  ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█▄   ▌  ▒   ██▒
 ▒██▒ ░ ░▓█▒░██▓░▒████▒      ░▓█  ▀█▓ ▓█   ▓██▒▒██░   ▓██░░▒████▓ ▒██████▒▒
 ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░      ░▒▓███▀▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ▒▒▓  ▒ ▒ ▒▓▒ ▒ ░
   ░     ▒ ░▒░ ░ ░ ░  ░      ▒░▒   ░   ▒   ▒▒ ░░ ░░   ░ ▒░ ░ ▒  ▒ ░ ░▒  ░ ░
 ░       ░  ░░ ░   ░          ░    ░   ░   ▒      ░   ░ ░  ░ ░  ░ ░  ░  ░
         ░  ░  ░   ░  ░       ░            ░  ░         ░    ░          ░
                                   ░                       ░
HEREDOC

puts title
end

def welcome
  clear_screen
  clear_screen
  clear_screen
  print_title
  puts "Welcome to the Battle of the Bands!"
  sleep(3)
  clear_screen
  main_menu
end

def main_menu
  @prompt = TTY::Prompt.new

  choice = @prompt.select("Would you like to create a new account or log in to an existing account?", ["Login", "Sign Up", "Exit"])
  if choice == "Login"
    log_in
  elsif choice == "Exit"
    exit_game
  else
    create_account
  end
end

def exit_game
end

def create_account
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
    create_band
  end
end

def delete_user
  User.all.find_by(name: @name).destroy
  puts "#{@name} has been deleted."
  sleep(3)
  main_menu
end

def refresh_user
  @user_1 = User.find_by(name: @name)
end

def log_in
  @name = @prompt.ask("What is the name on the existing account?")
  # binding.pry
  refresh_user
  # @user_1 = User.find_by(name: @name)
  if @user_1.nil?
    puts "There is no user by that name. Please create a new account."
    main_menu
  else
    band_menu
  end
end

def band_menu
  clear_screen
  choice = @prompt.select("Would you like to create a new band or play an existing band?", ["Create New Band", "Load Bands", "Go Back"])

  if choice == "Create New Band"
    create_band
  elsif choice == "Load Bands"
    load_bands
  elsif choice == "Go Back"
    main_menu
  end
end

def create_band
  band_name = @prompt.ask("What is the name of your band?")
  if band_name == " " || or band_name.is_empty?
    puts "That is not a valid band name. Please enter a new name."
    sleep(2)
    create_band
  @band_1 = @user_1.bands.create(name: band_name)
  edit_stats
end

def load_bands
  refresh_user
  if @user_1.bands.empty?
    create_band
  else
    user_bands = ["Go Back"]
    @user_1.bands.map do |band|
      user_bands.unshift(band.name)
    end
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
  choice = @prompt.select("What would you like to do with #{@band_1.name}?", ["Play Band", "Rename Band", "Edit Stats", "Delete Band", "Go back"])
  case choice
  when "Play Band"
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
  new_name = @prompt.ask("What would you like to change #{@band_1.name}'s name to?")
  @band_1.name = new_name
  @band_1.save
  band_options
end

def edit_stats
  choice = @prompt.select("Please select one of the following:", ["Genre", "Band Stats"])
  case choice
  when "Genre"
    @genre = @prompt.select("What is the genre of your band?", ["Rock", "Pop", "Rap", "Country"])
    @band_1.update(genre: @genre)
    @band_1.save
    edit_stats
  when "Band Stats"
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
    # binding.pry
  end
  play_band
end

def delete_band
  @band_1.destroy
  puts "#{@band_1.name} has been deleted."
  sleep(3)
  load_bands
end

def create_judges
  @simon = Judge.create(name: "Simon Cowell", preferred_att1: "tech_ability", preferred_att2: "presentation")
  @paula = Judge.create(name: "Paula Abdul", preferred_att1: "stage_presence", preferred_att2: ["tech_ability", "presentation", "lyrics"].sample)
  @randy = Judge.create(name: "Randy Jackson", preferred_att1: "lyrics", preferred_att2: "presentation")
end


# def create_audience(band)
  # genres = {
  #   pop: {
  #     preferred_att1: "presentation",
  #     preferred_att2: "stage_presence"
  #   },
  #   rock: {
  #     preferred_att1: "tech_ability",
  #     preferred_att2: "stage_presence"
  #   },
  #   rap: {
  #     preferred_att1: "lyrics",
  #     preferred_att2: "tech_ability"
  #   },
  #   country: {
  #     preferred_att1: "lyrics",
  #     preferred_att2: "stage_presence"
  #   }
  # }
  # case band.genre
  # when "Pop"
  #   stat_hash = genres[:pop]
  # when "Rap"
  #   stat_hash = genres[:rap]
  # when "Rock"
  #   stat_hash = genres[:rock]
  # when "Country"
  #   stat_hash = genres[:country]
  # end
  # @audience = Judge.create(name: "Audience")
  # @audience.update(stat_hash)
#   # @audience.save
# end

def create_user_2
  @user_2 = User.create(name: "User")
  @band_2 = @user_2.bands.create(name: "Metallica", genre: "Rock", tech_ability: 2, presentation: 1, stage_presence: 3, lyrics: 4)
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
  # if x > y
  #   puts "#{@band_1.name} is the winner!"
  # else
  #   puts "#{@band_2.name} is the winner!"
  # end
  # binding.pry
end

def audience_scores
  @audience_1 = @band_1.create_audience
  @audience_2 = @band_2.create_audience

  x = @audience_1.grade(@band_1)
  y = @audience_2.grade(@band_2)

  return x, y
end

def play_band
  create_judges
  # create_audience
  create_user_2
  #binding.pry
  score3, score4 = judge_scores
  score1, score2 = audience_scores

  band_1_score = (score1 + score3)/4
  band_2_score = (score2 + score4)/4
  binding.pry
  if band_1_score > band_2_score
    puts "#{@band_1.name} is the winner!"
  elsif band_2_score > band_1_score
    puts "#{@band_2.name} is the winner!"
  elsif band_1_score == band_2_score
    puts "It's a tie!"
  end
end





# binding.pry
welcome





# puts "HELLO WORLD"
