class Greeter
  @@current_user = nil

  def self.current_user
    @@current_user
  end

  def self.greet
    system "clear"
    puts "Welcome to THE WALL"
  end
  # ^ necessary?

  def self.login_or_signup
    system "clear"
    puts "Press (1) to Login"
    puts "Press (2) to Signup"

    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      system "clear"
      puts "That's not what I asked. Try again"
    end

    if choice == 1
      self.login
    elsif choice == 2
      self.signup
    end
  end

  def self.login

    system "clear"
    puts "Username?"
    username = gets.chomp
    puts "Password"
    password = gets.chomp

    ######## NEED REFACTOR #########
    while !User.exists?(:name => "#{username}")
      system "clear"
      puts "wrong username.  try again"
      username = gets.chomp
    end

    while User.find_by(name: username).password != password
      system "clear"
      puts "Password was incorrect"
      password = gets.chomp
    end

    @@current_user = User.find_by(name: username)
    system "clear"
    puts "Password was correct"
    WallGuide.choose_wall
  end

  def self.signup
      puts "What would you like me to call you?"
      username = gets.chomp
      while User.exists?(:name => "#{username}")
        puts "Username already exists, give me another username"
        username = gets.chomp
      end
      puts "Give me your password"
      password = gets.chomp

      # creates user acc, their wall, and permission to their wall
      @@current_user = User.create(name: username, password: password)
      wall_id = Wall.create(name: @@current_user.name).id
      Permission.create do |u|
        u.user_id= @@current_user.id
        u.wall_id= wall_id
      end
      
      WallGuide.choose_wall
  end
end
