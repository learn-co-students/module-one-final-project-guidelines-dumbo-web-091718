class WallGuide

  @@current_wall = 0

  def self.current_wall= (num)
    @@current_wall= num
  end

  def self.choose_wall
    puts "All Walls:"
    Wall.all.each do |wall|
      puts "#{wall.id}: #{wall.name}"
    end
    puts "Which Wall# do you want to visit?"
    @@current_wall = gets.chomp
    while 0 == 0
      binding.pry
      if has_permission?(Greeter.current_user, @@current_wall)
        WallGuide.read
      else
        puts "403: You don't have permission to access that"
        puts "Choose another wall"
        @@current_wall = gets.chomp
      end
    end
  end

  def self.has_permission?(user, wall)
    Permission.exists?(:user_id => user.id) && Permission.exists?(:wall_id => @@current_wall)
  end

  def self.options
    puts "To read another wall, press (1)"
    puts "To post on this wall, press (2)"
    puts "To create a new wall, press (3)"
    puts "To view all posts, press (4)"
    puts "To quit, press (5)"

    response = gets.chomp.to_i
    if response == 1
      WallGuide.choose_wall
    elsif response == 2
      WallGuide.post
    elsif response == 3
      WallGuide.new_wall  # => need to build
    elsif response == 4
      WallGuide.my_posts  # => need to build
    elsif response == 5
      exit
    end
  end

  def self.read
    all_msg_on_wall = Message.where(wall_id: @@current_wall).order(created_at: :desc)
    all_msg_on_wall.each do |msg|
      puts ""
      puts "Date: #{msg.created_at}"
      puts "User: #{User.find_by(id: msg.user_id).name}"
      puts "#{msg.content}"
      puts "------------------------------------------"
    end
    WallGuide.options
  end

  def self.post
    puts "What do you want to post?"
    content = gets.chomp

    Message.create do |msg|
      msg.content = content
      msg.user_id = Greeter.current_user.id
      msg.wall_id = @@current_wall
    end

    self.options
  end

end
