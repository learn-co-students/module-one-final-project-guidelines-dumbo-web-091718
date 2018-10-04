class WallGuide

  @@curr_wall_num = 0

  def self.curr_wall_num= (num)
    @@curr_wall_num = num
  end

  def self.prompt 
    prompt = TTY::Prompt.new 
  end

  def self.choose_wall
    puts "All Walls:"
    Wall.all.each do |wall|
      puts "#{wall.id}: #{wall.name}"
    end
    puts "Which Wall# do you want to visit?"
    @@curr_wall_num = gets.chomp
    while 0 == 0
      if 1 == 1
        WallGuide.read
      else
        puts "403: You don't have permission to access that."
        puts "Choose another wall"
        @@curr_wall_num = gets.chomp
      end
    end
  end

  def self.has_permission?(user, wall_num)
    Permission.find_by(:user_id => user.id).wall_id == wall_num
  end

  def self.options
    response = prompt.select("What do you want to do?") do |menu|
      menu.choice 'Read Another Wall', 1
      menu.choice 'Post on This Wall', 2
      menu.choice 'Create a New Wall', 3
      menu.choice 'View All Posts', 4
      menu.choice 'Quit', 5
    end

    case response 
      when 1 
        WallGuide.choose_wall 
      when 2 
        WallGuide.post 
      when 3 
        WallGuide.new_wall 
      when 4 
        WallGuide.my_posts 
      when 5 
        exit  
      end
  end
  

  def self.read
    all_msg_on_wall = Message.where(wall_id: @@curr_wall_num).order(created_at: :desc)
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
      msg.wall_id = @@curr_wall_num
    end

    self.options
  end

  def self.new_wall
    puts "NAME OF NEW WALL PLEASE"
    new_wall_name = gets.chomp
    @@curr_wall_num = Wall.create(name: new_wall_name).id
    WallGuide.options
  end

  def self.my_posts
    Message.where(:user_id => Greeter.current_user.id).each do |msg|
      puts "Wall: #{Wall.find_by(:id => msg.wall_id).name}"
      puts "Date: #{msg.created_at}"
      puts "#{msg.content}"
    WallGuide.options # => other options?
    end
  end

end
