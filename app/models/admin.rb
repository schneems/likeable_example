class Admin < ActiveRecord::Base
  devise :authenticatable, :registerable, :timeoutable, :validatable, :timeout_in => 20.minutes
end
