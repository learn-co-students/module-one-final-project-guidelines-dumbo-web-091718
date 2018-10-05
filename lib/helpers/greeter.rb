
class Greeter
  pastel = Pastel.new

  def self.prompt
    prompt = TTY::Prompt.new
  end

  def self.font
    font = TTY::Font.new(:standard)
  end

  def self.greet
    puts "Welcome to the WALL"
  end

  def self.login
    system "clear"
    username = prompt.ask('What is your username?', required: true)

    while !User.exists?(:name => username)
      system "clear"
      puts "User doesn't exist. Try again."
      username = prompt.ask('What is your username?')
    end

    password = prompt.mask('What is your password?')

    4.times do
      if User.find_by(name: username).password != password
        system "clear"
        password = prompt.mask('Wrong password. Try again.')
      else
        Escort.current_user = User.find_by(name: username)
        system "clear"
        WallGuide.choose_wall
      end
    end
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
      u.user_id = Escort.current_user.id
      u.wall_id = wall_id
    end
    WallGuide.choose_wall
  end

end
