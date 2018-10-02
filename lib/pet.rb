class Pet < ActiveRecord::Base
  has_many :adoptions
<<<<<<< HEAD
  has_many :users, through: :adoptions
=======
   has_many :users, through: :adoptions
>>>>>>> 1773b701d53d8a971cd88d2181e29856018492e0
end
