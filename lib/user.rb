# require 'money'
class User < ActiveRecord::Base
  has_many :adoptions
  has_many :pets, through: :adoptions


end
