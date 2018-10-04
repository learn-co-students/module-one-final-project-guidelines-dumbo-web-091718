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
### GREETING ### -----------------------------------
# greet user
# GreeterRefactor.login_or_signup
# Greeter.greet
# Greeter.login_or_signup
# GreeterRefactor.greet
# check to see if user wants to login or sign up

  # => login:
  # => prompt them to enter their user/pass
  # => check to see if user exist

  # => signup:
  # => check if username exist?
  # => if not, create new user

###============================================

### WHICH WALL? ### -------------------------

# WallGuide.choose_wall
# list walls
# => choose wall

# WallGuide.read
# => display the messages on wall X
# => based on timestamps

# WallGuide.three_opts
# => post to curr wall
  # => WallGuide.post, should Message.new
# => read diff wall
  # => WallGuide.choose_wall
# => quit / signout
  #

# WallGuide.post
# => input: msg content
# => Message.new(content,self(user),wall)

# @@last_wall_read
# should be updated everytime by WallGuide


# user should NOT be able to:
# delete others' messages
# delete walls
# access other users
# edit own post

# user SHOULD be able to:
# post new msg
#



### USER EXPERIENCE EXAMPLE ###

# Greeter.greet
# "Welcome."
# Greeter.login_or_signup
# "Login(1)"
# "or signup(2)?"
