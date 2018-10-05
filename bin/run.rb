require_relative '../config/environment'
require 'colorize'

pid = fork{ exec 'afplay',"Nyanyanyanyanyanyanya.mp3"}
   def welcome_screen
    puts "Hey, welcome to Fuzzy Friends. Just looking or wanting to adopt?"
    puts "1. Just looking!"

    puts "2. I wanna pet!"


        user_choice = gets.chomp
  end


  def second_chance
    puts "Are you SURE you don't want a pet?"
    puts "1. Okkkkk, I'll get one."
    puts "2. No. I hate cute things."
    user_second_chance = gets.chomp
  end


  def print_pets
    # all_the_pets = Pet.all.each do | pet |
    #   puts "#{pet.name}: #{pet.kind}, #{pet.temperament}, #{pet.age}"
    puts <<-'EOF'
                 ________________
                |                |_____    __
                |  I Love You!   |     |__|  |_________
                |________________|     |::|  |        /
   /\**/\       |                \.____|::|__|      <
  ( o_o  )_     |                      \::/  \._______\
   (u--u   \_)  |
    (||___   )==\
  ,dP"/b/=( /P"/b\
  |8 || 8\=== || 8
  `b,  ,P  `b,  ,P
    """`     """
    EOF

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
  puts "We did a Background-Check and your income is $#{income}/month."
    new_user = User.create({name: name, city: city, income:income }) #Create User
    approve_user(new_user)
end

def approve_user(new_user)
    if new_user.income >= 100
      puts "Congrats! Your application is APPROVED! Yay! Let's find you a pet. ✔ ".colorize(:green)
      new_user
    else
      puts "Yikes... your application has been denied.".colorize(:red)
      false
    end

end

def get_users_pet(user)
  puts "❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤"
  puts "    ❤      ❤     ❤     ❤      ❤      ❤      ❤       "
  puts "What kind of pet would you want? (Cat, Dog, or Bird)"
  puts "    ❤      ❤     ❤     ❤      ❤      ❤      ❤       "
  puts "❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤"

    user_pet_kind = gets.chomp.downcase
  puts "❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤"
  puts "    ❤      ❤     ❤     ❤      ❤      ❤      ❤       "
  puts "What kind of temperament would you want your pet to have? (Calm, Shy, or Friendly)"
  puts "    ❤      ❤     ❤     ❤      ❤      ❤      ❤       "
  puts "❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤"
    user_pet_temper = gets.chomp.downcase
  puts "❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤"
  puts "    ❤      ❤     ❤     ❤      ❤      ❤      ❤       "
  puts "what is the preferred age of your pet?"
  puts "    ❤      ❤     ❤     ❤      ❤      ❤      ❤       "
  puts "❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤"

    user_pet_age = gets.chomp.to_i


  the_pet = Pet.all.find do |pet|
    pet.kind == user_pet_kind && pet.temperament == user_pet_temper && pet.age == user_pet_age
  end


  if the_pet
    puts "Based on your preferences we think #{the_pet.name} would be perfect you! Enjoy your life together you two!"
    Adoption.create(user_id: user.id, pet_id: the_pet.id)
  else
    the_pets = Pet.all.select do |pet|
      pet.kind == user_pet_kind && pet.temperament == user_pet_temper
    end

    puts "We couldn't find any pets that are #{user_pet_age}-years-old, but here are some #{user_pet_temper} #{user_pet_kind}s:"

    the_pets.each do |pet|
      puts "We have #{pet.name} who's #{pet.age}-years-old."
    end
    puts "Which pet do ya like?"
    user_select_name = gets.chomp.capitalize
    puts "You like #{user_select_name}! Great #{user.name.capitalize}! I'm sure you'll have a happy life together."
    the_final_pet = the_pets.find do |pet|
      pet.name == user_select_name
    end
    Adoption.create(user_id: user.id, pet_id: the_final_pet.id)
  end
end


def run_app
  welcome_response = welcome_screen
  if welcome_response != "1"
    created_user = create_user
    return if !created_user
  else
    print_pets
    if second_chance == "1"
      created_user = create_user
      return if !created_user
    else
      puts "Ok... loser. Never show your face here again!"
      return
    end

  end

  get_users_pet(created_user)

end

run_app
exec("kill #{pid}")
