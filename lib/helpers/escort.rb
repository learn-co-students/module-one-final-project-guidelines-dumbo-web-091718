class Escort

  @@current_user = nil
  @@current_wall_num = nil

  # READER AND WRITER METHODS FOR CLASS VAR. #

  def self.prompt 
    TTY::Prompt.new
  end

  def self.current_user
    @@current_user
  end
  def self.current_user= (user)
    @@current_user = user
  end
  def self.current_wall_num
    @@current_wall_num
  end
  def self.current_wall_num= (num)
    @@current_wall_num = num
  end

  def self.options
    choice = prompt.select("What would you like to do?") do |menu|
      menu.choice 'Choose a Wall', 1
      menu.choice 'Post on This Wall', 2
      menu.choice 'Create a New Wall', 3 
      menu.choice 'View all Posts', 4
      menu.choice 'Quit', 5 
    end

    case choice
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

end
