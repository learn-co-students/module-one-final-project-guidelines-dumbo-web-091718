require_relative '../config/environment'

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
def create_user
  puts "Whats your name?"
  name = gets.chomp
  puts "Whats your city?"
   city = gets.chomp

  # puts "Monthly income?"
  # income = gets.chomp
  new_user = User.create({name: name, city: city, income: income})
end

# get the pet based on user preference
def get_users_pet
  puts "What kind of pet would you want"
  user_pet_kind = gets.chomp
  puts "What kind of temper would you want your pet to have?( Calm | Shy | Friendly )"
  pet_temperament = gets.chomp

# pet =  Pet.all.find do |pet|
#     pet.kind == user_pet_kind && pet.temperament == pet_temperament
#   end

pet_kind = Pet.all.select do |pet|
  pet.kind == user_pet_kind
end

choice = pet_kind.find do |choice|
  choice.temperament == pet_temperament
end

  # binding.pry
  puts "Here is your pet, it's name is #{choice.name}"
end


def run_app
  create_user
  get_users_pet
end

run_app



#  puts "Congratulations!!!! Here's is your #{adopted.name}, his has a #{adopted.temperament} and is #{adopted.age} days old"
