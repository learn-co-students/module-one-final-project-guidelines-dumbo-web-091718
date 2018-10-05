class WallGuide

  def self.prompt
    TTY::Prompt.new
  end

  def self.has_permission?(user= Escort.current_user, wall_num= Escort.current_wall_num)
    Permission.find_by(:user_id => user.id, :wall_id => wall_num)
  end

  def self.choose_wall
    walls = Wall.all.map { |wall| wall }
    wall_names = walls.map { |wall| wall.name }
    wall_name = prompt.select('Which wall do you want to visit?', wall_names)
    found_wall = Wall.find_by(name: wall_name).id
    Escort.current_wall_num = found_wall
    if WallGuide.has_permission?
      WallGuide.read
    else
      puts "403: You don't have permission to access that."
      puts "Choose another wall"
      self.choose_wall
    end
  end

  def self.read
    system "clear"
    all_msg_on_wall = Message.where(wall_id: Escort.current_wall_num).order(created_at: :desc)
    all_msg_on_wall.each do |msg|
      system ""
      puts "Date: #{msg.created_at}"
      puts "User: #{User.find_by(id: msg.user_id).name}"
      puts "#{msg.content}"
      puts "------------------------------------------"
    end

    if all_msg_on_wall == []
      puts "This wall is empty :("
    end

    response = prompt.select('What would you like to do?') do |menu|
      menu.choice 'Delete the Wall', 1
      menu.choice 'Post on This Wall', 2
      menu.choice 'View the Main Menu', 3
    end

    if response == 1
      WallGuide.delete_wall
    elsif response == 2
      WallGuide.new_post
    elsif response == 3
      Escort.options
    else
      WallGuide.read
    end
  end

  def self.delete_wall
    system "clear"
    if ( Userwall.exists?(:user_id => Escort.current_user.id) &&
      Userwall.find_by(:user_id => Escort.current_user.id).wall_id == Escort.current_wall_num )
      Wall.find_by(:id => Escort.current_wall_num).delete
      puts "Wall was successfully deleted"
    else
      puts "You don't have permission to delete that wall."
    end
    WallGuide.choose_wall
  end

  def self.new_post
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
    Permission.create(user_id: Escort.current_user.id, wall_id: Escort.current_wall_num)
    Userwall.create(user_id: Escort.current_user.id, wall_id: Escort.current_wall_num)
    WallGuide.read
  end

  def self.my_posts
    if Message.all.size == 0
      puts "There are no messages to view."
      Escort.options
    end

    messages = Message.where(:user_id => Escort.current_user.id).map(&:content)
    truncated_msg = prompt.select('Which post would you like to view?', messages)
    puts truncated_msg

    choice = prompt.select("What would you like to do?") do |menu|
      menu.choice 'Delete Message', 1
      menu.choice 'Back to Messages', 2
      menu.choice 'Main Menu', 3
    end

    if choice == 1
      puts "Message successfully deleted."
      Message.find_by(content: truncated_msg).destroy
    elsif choice == 2 
      system "clear"
      self.my_posts
    elsif choice == 3
      system "clear"
      Escort.options
    end
  end
end
