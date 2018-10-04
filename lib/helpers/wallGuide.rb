class WallGuide

  def self.display_walls
    puts "All Walls:"
    Wall.all.each do |wall|
      puts "#{wall.id}: #{wall.name}"
    end
  end

  def self.has_permission?(user, wall_num)
    binding.pry
    Permission.find_by(:user_id => user.id).wall_id == wall_num
  end

  def self.choose_wall
    WallGuide.display_walls
    puts "Which Wall# do you want to visit?"
    Escort.current_wall_num = gets.chomp
    while true
      if WallGuide.has_permission?(Escort.current_user, Escort.current_wall_num)
        Escort.options
      else
        puts "403: You don't have permission to access that."
        puts "Choose another wall"
        Escort.current_wall_num = gets.chomp
      end
    end
  end


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
    Escort.options
  end

  def self.my_posts
    Message.where(:user_id => Escort.current_user.id).each do |msg|
      puts "Wall: #{Wall.find_by(:id => msg.wall_id).name}"
      puts "Date: #{msg.created_at}"
      puts "#{msg.content}"
    Escort.options
    end
  end
end
