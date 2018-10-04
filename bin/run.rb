require_relative '../config/environment'

#### DON'T TOUCH! ##########
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)
pastel = Pastel.new


puts "Hello. Welcome to the Message Board!".center(80)
choice = prompt.select("What would you like to do?") do |menu|
  menu.choice 'Login', 1
  menu.choice 'Sign Up', 2
end

case choice
  when 1
    Greeter.login
  when 2
    Greeter.signup
end
