class Topic < ActiveRecord::Base
	has_many :messages
	belongs_to :user
	attr_accessible :title
end
