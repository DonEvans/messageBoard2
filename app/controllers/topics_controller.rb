class TopicsController < ApplicationController
	before_filter :authenticate, :only => [:new, :create]

  def new
  	@title = "Make new Topic"
  	@topic = Topic.new
  end

  def create
  	@topic = Topic.new(params[:topic])
  	this_user = User.find_by_name current_user.name
	@topic.user_id = this_user.id

	if @topic.save
			redirect_to messages_path
		else
			#Insert flash message 
			redirect_to :action => 'new'
		end
  end

  def show
  end

  def index
  end

  private

		def authenticate
			deny_access unless signed_in?
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end

end
