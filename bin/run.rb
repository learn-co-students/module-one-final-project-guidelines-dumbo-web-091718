require_relative '../config/environment'

<<<<<<< HEAD
#
# # _________________________________________________
# # def welcome_and_get_name
# #   puts "Welcome to the Fuzzy Friends Pet Adoption Center! We just have a few questions for you to match you with your perfect fuzzy friend. What is your name?"
# #   name = gets.chomp
# # end
# #
# # def get_wanted_pet(name)
# #   puts "Hey, #{name}! What kind of pet do you want to adopt?"
# # end
# #
# # def run
# #   name = welcome_and_get_name
# #   get_wanted_pet(name)
# # end
# #
# # run
# # __________________________________________________
#
# # def application
#     def create_user
#     puts "Welcome to the Fuzzy Friends Pet Adoption Center! We just have a few questions for you to match you with your perfect fuzzy friend. What is your full name?"
#       name = gets.chomp
#       User.create(name: name)
#     end
#
#     def choose_pet
#     puts "What kind of pet are you applying for?"
#       pet_type = gets.chomp
#
#     puts "What age?"
#       age = gets.chomp
#
#     puts "What kind of pet are you looking for? (calm, excitable, shy, cute)"
#       temperament = gets.chomp
#     end
#     # puts "Based on your application we think #{pet_name} would be perfect for you! Here's a little more information about them!"
#     #list of pet info
#     # puts "Do you want to give #{pet_name} a forever home?"
#     #   adopt = gets.chomp
#
#   #   adopted = Pet.create({ name:name,
#   #   #pet_routine: pet_routine,
#   #   temperament: temperament,
#   # #  color: color,
#   #   skills: skills, age: age})
#   puts "Congratulations! Based on your application we think bob would be perfect for you. Bob is a #{pet_type} and has a #{temperament} temperament. Bob is #{age} years old."
#
# # end
#
# # adopted = application
#
#  # puts "Congratulations! Based on your application we think bob would be perfect for you, they are a #{pet_type} have a #{temperament} temperament and is #{age} years old."
#
# def run_app
#   user = create_user
#   choose_pet
# end
#
# run_app

#create the user from the form
=======
      ##### WELCOME SCREEN #####

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


>>>>>>> b2f40a6b7604a74d1f6603b93d648bf7ccd1655f
def create_user
  puts "Great! Before we find you the perfect pet. We need you to fill out a quick application."
  puts "====================="
  puts "What's your name?"
  name = gets.chomp
  puts "Whats your city?"
   city = gets.chomp
  puts "Monthly income?"
  income = gets.chomp
  new_user = User.create({name: name, city: city, income: income})
end

  # b) puts "What city do you live in?"

  # c) puts "What is your Social Secruity number?"
      #randomize income range "based on SS"
  # d) if income > 200 checks to see if they're nice or not
      #if income matches and they are nice go to Pet Application

      #elsif income matches but they are mean puts "Your income is fine but you've got a bit of an attitude! Come back when you're a little nicer."

      #else income < 200 return "Unfortunately your monthly income is #{random_number}, which is much too low to adopt a pet. Please come back again!"

     ##### PET APPLICATION! #####

  # get the pet based on user preference

def get_users_pet
  puts "What kind of pet would you want"
  user_pet_kind = gets.chomp
  puts "What kind of temper would you want your pet to have?( Calm | Shy | Friendly )"
  pet_temperament = gets.chomp

# pet =  Pet.all.find do |pet|
#     pet.kind == user_pet_kind && pet.temperament == pet_temperament
#   end

<<<<<<< HEAD
pet_kind = Pet.all.select do |pet|
  pet.kind == user_pet_kind
end

choice = pet_kind.find do |choice|
  choice.temperament == pet_temperament
end
=======
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
>>>>>>> b2f40a6b7604a74d1f6603b93d648bf7ccd1655f

  # binding.pry
  puts "Here is your pet, it's name is #{choice.name}"
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
  elsif second_chance == "2"
  "Good Bye"
end
  # get_users_pet
end

run_app
<<<<<<< HEAD



#  puts "Congratulations!!!! Here's is your #{adopted.name}, his has a #{adopted.temperament} and is #{adopted.age} days old"
=======
>>>>>>> b2f40a6b7604a74d1f6603b93d648bf7ccd1655f
