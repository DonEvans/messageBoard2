class User < ActiveRecord::Base
has_many :topics
attr_accessible :name, :textColor, :font, :password, :password_confirmation

validates :name, :presence => true,
									:length => { :maximum => 50 }

validates :password, :presence => true,
										:confirmation => true,
										:length => { :within => 6..50 }

def self.authenticate(name, submitted_password)
   user = find_by_name(name)
   return nil  if user.nil?
   return user if user.password == submitted_password
end


end
