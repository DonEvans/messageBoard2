class Message < ActiveRecord::Base
belongs_to :user
belongs_to :topic
attr_accessible :user_id, :content, :id, :created_at

validates :user_id, :presence => true
validates_numericality_of :user_id
validates :content, :presence => true, :length => { :maximum => 1000 }

end
