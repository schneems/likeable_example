class User < ActiveRecord::Base
  devise :authenticatable, :confirmable, :lockable, :recoverable,
         :rememberable, :trackable, :timeoutable, :validatable

  attr_accessible :email, :password, :password_confirmation
end
