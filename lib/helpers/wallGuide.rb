class WallGuide

  def self.prompt
    TTY::Prompt.new
  end

  def self.has_permission?(user= Escort.current_user, wall_num= Escort.current_wall_num)
    Permission.exists?(:user_id => user.id, :wall_id => wall_num)
  end

  def self.choose_wall
    walls = Wall.all.map { |wall| wall }
    wall_names = walls.map { |wall| wall.name }
    wall_name = prompt.select('Which wall do you want to visit?', wall_names)
    found_wall = Wall.find_by(name: wall_name).id
    Escort.current_wall_num = found_wall
    if WallGuide.has_permission?
      WallGuide.read_wall
    else
      puts "403: You don't have permission to access that."
      puts "Choose another wall"
      self.choose_wall
    end
  end

  def self.read_wall
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
      if Userwall.exists?(:user_id => Escort.current_user.id, :wall_id => Escort.current_wall_num)
        menu.choice 'Grant Access to Other Users', 3
      end
      menu.choice 'View the Main Menu', 4
    end

    if response == 1
      WallGuide.delete_wall
    elsif response == 2
      WallGuide.new_post
    elsif response == 3
      WallGuide.select_user_to_grant_perm
    elsif response == 4
      Escort.options
    else
      WallGuide.read_wall
    end
  end

  def self.delete_wall
    if Userwall.exists?(:user_id => Escort.current_user.id, :wall_id => Escort.current_wall_num)
      Wall.find_by(:id => Escort.current_wall_num).delete
      Message.where(:wall_id => Escort.current_wall_num).delete_all
      Permission.where(:wall_id => Escort.current_wall_num).delete_all
      Userwall.where(:wall_id => Escort.current_wall_num).delete_all
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

    choice = prompt.select('What status do you want to grant this wall?') do |menu|
      menu.choice 'Public - Everyone can see this', 1
      menu.choice 'Private - Only invited users can see this', 2
    end

    if choice == 1
      self.grant_permission("all")
    elsif choice == 2
      WallGuide.select_user_to_grant_perm
    end
    Escort.options

  end

  def self.select_user_to_grant_perm
    # usernames should be all users who curr dont have permission
    # usernames = User.all.map(&:name)
    usernames = User.all.select do |user|
      !self.has_permission?(user, Escort.current_wall_num)
    end
    if usernames == []
      puts "THIS IS A PUBLIC WALL ALREADY."
      puts "NO ONE NEEDS PERMISSION TO VIEW IT."
      puts "GET OFF MY LAWN."
      Escort.options
    end 
    username = prompt.select('Which user do you want to invite?', usernames.map(&:name))

    self.grant_permission(User.find_by(:name => username))
  end

  def self.grant_permission(user)
    if user == "all"
      User.all.each do |user|
        Permission.create(user_id: user.id, wall_id: Escort.current_wall_num)
      end
    else
      Permission.create(user_id: user.id, wall_id: Escort.current_wall_num)
    end
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
