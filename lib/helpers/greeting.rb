class Greeter

  def self.greet
    puts "Welcome to THE WALL"
  end

  def self.login_or_signup
    puts "Press (1) to Login"
    puts "Press (2) to Signup"

    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts "That's not what I asked. Try again"
      p choice.class
      p choice = gets.chomp.to_i
    end

    if choice == 1
      self.login
    elsif choice == 2
      self.signup
    end

  end

  def self.login
    puts "Username?"
    username = gets.chomp
    puts "Password"
    password = gets.chomp
  end

  def self.signup
      puts "What would you like me to call you?"
      username = gets.chomp

      puts "Give me your password"
      password = gets.chomp
      User.create(name: username, password: password)
  end

  def self.user_exist?(username)
    ex = User.exists?(:name => username)
    if ex == true
      puts "YOU EXIST"
    else
      puts "WHO ARE YOU?"
    end
  end











end
