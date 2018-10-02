# require 'money'
class User < ActiveRecord::Base
  has_many :pets, through: :adoption_center


end
