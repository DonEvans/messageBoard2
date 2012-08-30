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
			flash[:center] = "No new Topic created!"
			redirect_to :action => 'new'
		end
  end

  def show
  	@topic = Topic.find(params[:id])
	@title = @topic.title 
	@message = @topic.messages
	@form_heading = "Write post"
	@new_message = Message.new
	@user = User.find :all
	@topic_list = Topic.find :all, :order => "created_at DESC",
							 :limit =>15
	flash[:topic_id] = @topic.id
  end

  def index
  	@title = "Topics index"
  	@topic = Topic.find :all, :order => "created_at DESC"
  	@user = User.find :all
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
