require_relative '../config/environment'

# require_relative './user'


# puts "HELLO WORLD"
#
# puts "Welcome to the pet adoption agency! Please fill out this application."
#
# puts "***********"
#
# puts "What is your full name?"
#   full_name = gets.chomp
# puts "What is your city?"
#   city = gets.chomp
# puts "What is your income status?"
#   income = gets.chomp
# puts "What kind of pet are you applying for?"
#   pet_type = gets.chomp
#   #dog
#   #cat
#   #bird
#   #reptile, etc.
# puts "Great! You want a #{pet_type}! What kind would you like?"
#   pet_kind = gets.chomp
# puts "Good choice! What color?"
#   color = gets.chomp
# puts "What age?"
#   age = gets.chomp
# puts "What kind of pet are you looking for? (calm, excitable, shy, cute)"
#   pet_temperament = gets.chomp
# puts "Any skills you would like your pet to have?"
#   pet_skills = gets.chomp
# puts "Based on your application we think #{pet_name} would be perfect for you! Here's a little more information about them!"
# #list of pet info
# puts "Do you want to give #{pet_name} a forever home?"
#   adopt = gets.chomp
#
# puts "Welcome to the pet adoption agency! Please fill out this application."
#
# puts "***********"
#
def application
    puts "What is your full name?"
      full_name = gets.chomp
    puts "What is your city?"
      city = gets.chomp
    puts "What is your income status?"
      income = gets.chomp
    # puts "What kind of pet are you applying for?"
    #   pet_type = gets.chomp

      puts "Whats the pet to be named"
        name = gets.chomp

      #reptile, etc.
    # puts "Great! You want a #{pet_type}! What kind would you like?"
    #   pet_kind = gets.chomp
    # puts "Good choice! What color?"
    #   color = gets.chomp
    puts "What age?"
      age = gets.chomp
    puts "What kind of pet are you looking for? (calm, excitable, shy, cute)"
      temperament = gets.chomp
    puts "Any skills you would like your pet to have?"
      skills = gets.chomp
    # puts "Based on your application we think #{pet_name} would be perfect for you! Here's a little more information about them!"
    #list of pet info
    # puts "Do you want to give #{pet_name} a forever home?"
    #   adopt = gets.chomp

    adopted = Pet.create({ name:name,
    #pet_routine: pet_routine,
    temperament: temperament,
  #  color: color,
    skills: skills, age: age})
end

adopted = application

 User.create({name: 'Jules', city: "New York",
 income: 500,
 is_nice: true})

 puts "Congratulations!!!! Here's is your #{adopted.name}, his has a #{adopted.temperament} and is #{adopted.age} days old"
