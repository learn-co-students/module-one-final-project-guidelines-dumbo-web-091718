class Escort

  @@current_user = nil
  @@current_wall_num = nil

  # READER AND WRITER METHODS FOR CLASS VAR. #
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
    puts "To choose a wall, press (1)"
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
      WallGuide.new_wall
    elsif response == 4
      WallGuide.my_posts  
    elsif response == 5
      exit
    end
  end

end
