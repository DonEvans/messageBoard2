class Topic < ActiveRecord::Base
	has_many :messages
	belongs_to :user
	attr_accessible :title

	validates :user_id, :presence => true
	validates_numericality_of :user_id
	validates :title, :presence => true, :length => { :maximum => 30 }
end
