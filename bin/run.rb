require_relative '../config/environment'


### GREETING ### -----------------------------------
# greet user
Greeter.greet

# check to see if user wants to login or sign up
Greeter.login_or_signup

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
