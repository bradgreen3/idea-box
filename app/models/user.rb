class User < ActiveRecord::Base
  has_many :ideas
  has_secure_password
  validates_confirmation_of :password

  #enum allows us to access
  #user = User.find(1)
  #user.admin! #sets user role to 1
  #user.adin? #returns true
  #user.role #returns 'admin' even though the value is 1 in the db

  enum role: [:default, :admin]
end
