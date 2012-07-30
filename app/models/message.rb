class Message < ActiveRecord::Base
belongs_to :user
attr_accessible :user_id, :content, :title, :author, :id, :created_at

validates :user_id, :presence => true
validates_numericality_of :user_id
validates :content, :presence => true, :length => { :maximum => 1000 }
validates :title, :length => { :maximum => 30 }

end
