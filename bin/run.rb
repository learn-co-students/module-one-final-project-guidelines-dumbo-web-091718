require_relative '../config/environment'

   def welcome_screen
  puts "Hey, welcome to Fuzzy Friends. Just looking or wanting to adopt?"
  puts "1. Just looking!"
      # => shows list of pets or pictures maybe??
      # number_1 = gets.chomp
  puts "2. I wanna pet!"
      user_choice = gets.chomp
      # if user_choice == "1"
      #   print_pets
      # else user_choice == "2"
      #   return
      #   # => goes to user APPLICATION
      # end
  end
  def second_chance
    puts "====================="
    puts "Pretty good selection, huh? Now do you want a pet?!"
    puts "1. Yes!"
    puts "2. No."
    user_second_chance = gets.chomp
  end

  def print_pets
    all_the_pets = Pet.all.each do | pet |
      puts "#{pet.name}: #{pet.kind}, #{pet.temperament}, #{pet.age}"
    end
  end

       ##### USER APPLICATION #####
def create_user
  puts "Great! Before we find you the perfect pet. We need you to fill out a quick application."
  puts "====================="
  puts "What's your name?"  #1
  name = gets.chomp
  puts "What city do you live in?" #2
  city = gets.chomp
  puts "Last 4 digits of your Social Security?"
  ssn = gets.chomp.to_i
  income  = rand(ssn)
  #randomize income range "based on SS"

  new_user = User.create({name: name, city: city, income:income })#Create User

end

def approve_user  # Approve User
  min = 100 
  User.all.select do |user|
    if user.income >= min
      puts "Approved #{user.name}"
    else
      puts "DENIED! #{user.name}"
    end
  end
end
  # d) if income > 200 checks to see if they're nice or not
      #if income matches and they are nice go to Pet Application
      #elsif income matches but they are mean puts "Your income is fine but you've got a bit of an attitude! Come back when you're a little nicer."
      #else income < 200 return "Unfortunately your monthly income is #{random_number}, which is much too low to adopt a pet. Please come back again!"
     ##### PET APPLICATION! #####
  # get the pet based on user preference
def get_users_pet
  puts "What kind of pet would you want"
  user_pet_kind = gets.chomp
  puts "What kind of temperament would you want your pet to have?"
  user_pet_temper = gets.chomp
    the_pet = Pet.all.find do |pet|
          pet.kind == user_pet_kind && pet.temperament == user_pet_temper
          end
  # puts "Here is your pet, it's name is #{the_pet.name}"
  puts "What's the ideal age of your pet?"
  # enter number (ex. 4)
  #if/else statement number > 5 return that pet that matches
  #elsif return pet that is > 10 return that pet that matches
  #etc.
  puts "Based on your preferences we think #{pet.name} would be perfect for you! Would you like to meet you pet?"
  #puts "1. 'Gosh, so excited. Yes!'"
  #puts "2. 'Meh, I guess."
  #puts "3. 'No, pets are gross.'"
  # if 1 || 2 => shows picture of pet
  # if 3 => puts "Uh. ok. See ya later!""
  puts "#{pet.name} really seems to like you! Do you want to adopt them?"
  #puts "1. 'YES!'"
  #puts "2. 'They're kind of ugly. No.'"
  #if 1 puts "Yay!"
  #puts something exciting like a congrats thing
  #if 2 puts "Sad... ok. well bye."
  #exits program
end
def run_app
  welcome_response = welcome_screen
  if welcome_response != "1"
    create_user
  else
    print_pets
    # second_chance calling it here causes it to show up twice
  end

  if second_chance == "1"
    create_user
    approve_user
  else
    puts "Ok... cool. Have a nice day!"
  end

end

run_app
