require_relative '../config/environment'

#create the user from the form
def create_user
  puts "Whats your name?"
  name = gets.chomp
  new_user = User.create({name: name })
end

# get the pet based on user preference
def get_users_pet
  puts "What kind of pet would you want"
  user_pet_kind = gets.chomp

    Pet.all.select do |pet|
    if  pet.kind === user_pet_kind
      puts "Here is your pet, it's name is #{pet.name}"
     end
   end

end


def run_app
  create_user
  get_users_pet
end

run_app



#  puts "Congratulations!!!! Here's is your #{adopted.name}, his has a #{adopted.temperament} and is #{adopted.age} days old"
