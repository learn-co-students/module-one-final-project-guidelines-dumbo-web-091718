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
  # print_title
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
  find_user = User.all.find_by(name: @name)
  if !find_user.nil? && find_user.name == @name
  # if !User.all.find_by(name: @name).nil? && User.all.find_by(name: @name).name == @name
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
  # @name.titleize
  @user_1 = User.find_by(name: @name.titleize)
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
  clear_screen
  band_name = @prompt.ask("What is the name of your band?")
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
    clear_screen
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
  choice = @prompt.select("What would you like to do with #{@band_1.name}?", ["Play Band", "Rename Band", "Stats", "Delete Band", "Go back"])
  case choice
  when "Play Band"
    play_band
  when "Rename Band"
    rename_band
  when "Stats"
    view_stats
  when "Delete Band"
    delete_band
  when "Go back"
    load_bands
  end
end

def rename_band
  clear_screen
  new_name = @prompt.ask("What would you like to change #{@band_1.name}'s name to?")
  @band_1.name = new_name
  @band_1.save
  band_options
end

def view_stats
  clear_screen
  stats = {
    "Presentation" => @band_1.presentation,
    "Stage Presence" => @band_1.stage_presence,
    "Lyrics" => @band_1.lyrics,
    "Technical Ability" => @band_1.tech_ability
  }

  stats.sort_by{|key, value| value}

  new_stats = stats.keys

  puts "These are the stats for your band #{@band_1.name}:"
  puts ""
  puts "Genre: #{@band_1.genre}"
  puts ""
  puts "First priority: #{new_stats[0]}"
  puts "Second priority: #{new_stats[1]}"
  puts "Third priority: #{new_stats[2]}"
  puts "Last priority: #{new_stats[3]}"
  puts " "

  choice = @prompt.select("Would you like to edit the above or go back?", ["Edit", "Go Back"])

  puts " "

  case choice
  when "Edit"
    edit_stats
  when "Go Back"
    band_options
  end
end

def stats_menu
end


def edit_stats
  clear_screen
  choice = @prompt.select("Please select one of the following:", ["Genre", "Band Stats", "Go Back"])
  case choice
  when "Go Back"
    view_stats
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
  clear_screen
  @band_1.destroy
  puts "#{@band_1.name} has been deleted."
  sleep(3)
  load_bands
end

def create_user_2
  # creates of band instances - make it equal to a variable and randomly Select
  # create table of previously entered bands and randomly select user_id
  @user_2 = User.create(name: "User")
  @band_2 = @user_2.bands.create(name: "Metallica", genre: "Rock", tech_ability: 2, presentation: 1, stage_presence: 3, lyrics: 4)
end


def judge_scores(band)

  # binding.pry
  judge_scores = {}

  Judge.all.each do |judge|
    judge_scores[judge.name] = judge.grade(band)
  end


  return judge_scores
end


def audience_scores(band)
  @audience = band.create_audience
  return @audience.grade(band)
end
#
#

def return_responses(band)
  clear_screen
  puts "And now, let's hear from the judges!"
  sleep(3)
  Judge.all.each do |judge|
    puts ""
    puts "#{judge.name}'s Response"
    puts ""
    judge.evaluate_scores(band)
    sleep(5)
  end
end


def play_band
#
# `afplay my_song.mp3`

    create_user_2
    return_responses(@band_1)
    # binding.pry
    return_responses(@band_2)


#   #binding.pry
    band_1_score = judge_scores(@band_1).values.sum + audience_scores(@band_1) / 4
    band_2_score = judge_scores(@band_2).values.sum + audience_scores(@band_2) / 4
#   band_1_score = (score4)/4
#   band_2_score = (score3)/4
#
# # judge_results
#
clear_screen

  if band_1_score > band_2_score
    puts "#{@band_1.name} is the winner!"
  elsif band_2_score > band_1_score
    puts "#{@band_2.name} is the winner!"
  elsif band_1_score == band_2_score
    puts "It's a tie!"
  end

end
#




# binding.pry
welcome





# puts "HELLO WORLD"
