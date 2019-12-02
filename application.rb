# **ADOPTION CENTER**
# Adoption center should be able to approve application of User for adoption
# Return pet indicated on adoption application
#
# **PET**
# A pet should have pet_skills
# A pet should have preferred pet_food
# A pet should have a pet pet_routine
# A pet should have the following attributes: pet_kind, pet_color, pet_age, pet_temperament ,  pet_routine,  pet_skills

________

# Application prompts:
# name, city, income (income requirement to implement later), randomize application temperament

puts "Welcome to the pet adoption agency! Please fill out this application."

puts "***********"

puts "What is your full name?"
  full_name = gets.chomp
puts "What is your city?"
  city = gets.chomp
puts "What is your income status?"
  income = gets.chomp
puts "What kind of pet are you applying for?"
  pet_type = gets.chomp
  #dog
  #cat
  #bird
  #reptile, etc.
puts "Great! You want a #{pet_type}! What kind would you like?"
  pet_kind = gets.chomp
puts "Good choice! What color?"
  color = gets.chomp
puts "What age?"
  age = gets.chomp
puts "What kind of pet are you looking for? (calm, excitable, shy, cute)"
  pet_temperament = gets.chomp
puts "Any skills you would like your pet to have?"
  pet_skills = gets.chomp
puts "Based on your application we think #{pet_name} would be perfect for you! Here's a little more information about them!"
#list of pet info
puts "Do you want to give #{pet_name} a forever home?"
  adopt? = gets.chomp
