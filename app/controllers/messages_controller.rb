class MessagesController < ApplicationController
before_filter :authenticate, :only => [:create]

 	def create
		@message = Message.new(params[:message])
		@message.author = current_user.name
		this_user = User.find_by_name current_user.name
		@message.user_id = this_user.id

		if @message.save
			redirect_to :action => 'index'
		else
			flash[:messageFlash] = "Message didn't post!"
			redirect_to :action => 'index'
		end
	end

  def index
		@title = "Message Board"
		@message = Message.find :all
		@form_heading = "Write post"
		@new_message = Message.new
		@user = User.find :all
		@topic_list = Topic.find :all
  end

	private

		def authenticate
			deny_access unless signed_in?
		end


end
