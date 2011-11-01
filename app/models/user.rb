class User < ActiveRecord::Base
  devise :database_authenticatable, :lockable, :recoverable,
         :rememberable, :registerable, :trackable, :timeoutable, :validatable,
         :token_authenticatable

  attr_accessible :email, :password, :password_confirmation

  include Likeable::UserMethods
end
