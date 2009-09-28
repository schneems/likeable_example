class User < ActiveRecord::Base
  include Devise::Authenticable
  include Devise::Confirmable
  include Devise::Recoverable
  include Devise::Validatable

#  attr_accessible :email, :password, :password_confirmation
#  attr_accessor :password, :password_confirmation

#  validates_presence_of :login, :crypted_password
#  validates_confirmation_of :password, :if => :password

#  def password=(pass)
#    @password = pass
#    self.crypted_password = pass.nil? ? nil : ::BCrypt::Password.create(pass)
#  end

#  def crypted_password
#    @crypted_password ||= begin
#      crypted_pwd = read_attribute(:crypted_password)
#      crypted_pwd.nil? ? nil : ::BCrypt::Password.new(crypted_pwd)
#    end
#  end
end
