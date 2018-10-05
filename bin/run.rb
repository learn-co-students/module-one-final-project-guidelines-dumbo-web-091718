require_relative '../config/environment'

#### DON'T TOUCH! ##########
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)
pastel = Pastel.new

system "clear"
puts "Welcome to the".center(80)
puts font.write('WALL'.center(40))
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
