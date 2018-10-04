class WallGuide

  def self.prompt
    TTY::Prompt.new
  end

  def self.display_walls
    puts "All Walls:"
    Wall.all.each do |wall|
      puts "#{wall.id}: #{wall.name}"
    end
  end

  def self.has_permission?(user, wall_num)
    Permission.find_by(:user_id => user.id).wall_id == wall_num
  end

  def self.choose_wall
    # prompt.select("Which wall do you want to visit?") do |menu|
    #   menu.default 3

    #   menu.choice 'Scorpion', 1
    #   menu.choice 'Kano', 2
    #   menu.choice 'Jax', 3
    # end
    walls = Wall.all.map { |wall| wall }
    wall_names = walls.map { |wall| wall.name }
    wall_name = prompt.select('Which wall do you want to visit?', wall_names)
    # WallGuide.display_walls
    # puts "Which Wall # do you want to visit?"
    found_wall = Wall.find_by(name: wall_name).id
    Escort.current_wall_num = found_wall
    # binding.pry
    if WallGuide.has_permission?(Escort.current_user, Escort.current_wall_num)
      Escort.options
    else
      self.choose_wall
      # puts "403: You don't have permission to access that."
      # puts "Choose another wall"
      # Escort.current_wall_num = gets.chomp
    end
  end

  # def self.choose_wall
  #   # Present a list of walls to the user
  #   # If the user selects a wall that he doesn't have permission to view, he's presented with a
  #   # list of walls again
  #   walls = Wall.map { |wall| wall }
  #   wall_names = walls.map { |wall| wall.name }
  #   wall_name = prompt.select('Which wall do you want to visit?', wall_names)
  #   found_wall = Wall.find_by(name: wall_name).id
  #   Escort.current_wall_num = found_wall

  #   if WallGuide.has_permission??(Escort.current_user, Escort.c)
  # end


  def self.read
    all_msg_on_wall = Message.where(wall_id: Escort.current_wall_num).order(created_at: :desc)
    all_msg_on_wall.each do |msg|
      puts ""
      puts "Date: #{msg.created_at}"
      puts "User: #{User.find_by(id: msg.user_id).name}"
      puts "#{msg.content}"
      puts "------------------------------------------"
    end
    Escort.options
  end

  def self.post
    puts "What do you want to post?"
    content = gets.chomp

    Message.create do |msg|
      msg.content = content
      msg.user_id = Escort.current_user.id
      msg.wall_id = Escort.current_wall_num
    end
    Escort.options
  end

  def self.new_wall
    puts "NAME OF NEW WALL PLEASE"
    new_wall_name = gets.chomp
    Escort.current_wall_num = Wall.create(name: new_wall_name).id
    Permission.create(user_id: Escort.current_user, wall_id: Escort.current_wall_num)
    Userwall.create(user_id: Escort.current_user, wall_id: Escort.current_wall_num)
    WallGuide.read
  end

  def self.my_posts
    Message.where(:user_id => Escort.current_user.id).each do |msg|
      puts "Wall: #{Wall.find_by(:id => msg.wall_id).name}"
      puts "Date: #{msg.created_at}"
      puts "#{msg.content}"
    end
    Escort.options
  end
end
