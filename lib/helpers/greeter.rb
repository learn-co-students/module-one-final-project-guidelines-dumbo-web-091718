
class Greeter
  pastel = Pastel.new

  def self.prompt
    prompt = TTY::Prompt.new
  end

  def self.font
    font = TTY::Font.new(:standard)
  end

  def self.greet
    # system "clear"
    puts "Welcome to the WALL"
    # puts "Welcome to the".center(80)
    # puts font.write("MESSAGE BOARD")
    # puts "MESSAGE BORD"
    # puts font
  end

  # def self.login_or_signup
  #   # system "clear"
  #   puts "Press (1) to Login"
  #   puts "Press (2) to Signup"

  #   choice = gets.chomp.to_i
  #   while choice != 1 && choice != 2
  #     system "clear"
  #     puts "That's not what I asked. Try again"
  #   end

  #   if choice == 1
  #     self.login
  #   elsif choice == 2
  #     self.signup
  #   end
  # end

  def self.login
    system "clear"
    username = prompt.ask('What is your username?', required: true)
    password = prompt.mask('What is your password?')

    ######## NEED REFACTOR #########
    while !User.exists?(:name => "#{username}")
      system "clear"
      puts "Wrong username. Try again."
      username = gets.chomp
    end

    while User.find_by(name: username).password != password
      system "clear"
      password = prompt.mask('Wrong password. Try again.')
    end

    Escort.current_user = User.find_by(name: username)
    system "clear"
    WallGuide.choose_wall
  end

  def self.signup
      username = prompt.ask('Enter a username: ', required: true)
      while User.exists?(:name => "#{username}")
        puts "This username already exists. Try again."
        username = gets.chomp
      end

      password = prompt.mask('Enter a password: ')

      Escort.current_user = User.create(name: username, password: password)
      wall_id = Wall.create(name: Escort.current_user.name).id
      Permission.create do |u|
        u.user_id= Escort.current_user.id
        u.wall_id= wall_id
      end

      WallGuide.choose_wall
  end
end
