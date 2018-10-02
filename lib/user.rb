class User < ActiveRecord::Base
  has_many :adoptions
  has_many :pets, through: :adoptions
<<<<<<< HEAD
=======

>>>>>>> 1773b701d53d8a971cd88d2181e29856018492e0

end
