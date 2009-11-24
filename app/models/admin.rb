class Admin < ActiveRecord::Base
  devise :authenticatable, :validatable
end
