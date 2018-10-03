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
    WallGuide.read
  end

  def self.three_op
    puts "To read another wall, press (1)"
    puts "To post on this wall, press (2)"
    puts "To quit, press (3)"
    response = gets.chomp.to_i
    if response == 1
      WallGuide.choose_wall
    elsif response == 2
      WallGuide.post
    elsif response == 3
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
    WallGuide.three_op
  end

  def self.post
    puts "What do you want to post?"
    content = gets.chomp

    Message.create do |msg|
      msg.content = content
      msg.user_id = Greeter.current_user.id
      msg.wall_id = @@current_wall
    end

    self.three_op
  end

end
