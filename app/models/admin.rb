class Admin < ActiveRecord::Base
  devise :authenticatable, :timeoutable, :validatable, :timeout_in => 20.minutes
end
