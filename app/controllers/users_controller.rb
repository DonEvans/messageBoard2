class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit,:update, :destroy]
	before_filter :correct_user, :only => [:edit, :update, :destroy]

	def new
		@title = "Signup Page"
		@user = User.new
  end

 	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to the Sample app!"
			redirect_to :action => 'index'
		else
			@title = 'Signup failed'
			flash[:fail] = "Signup failed!"
			render 'new'
		end
	end

	def show
		@title = "User record"
		@user = User.find(params[:id])
  end


  def index
		@title = "List of users"
		@user = User.find :all
  end

	def edit
		@title = "Edit user info"
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:update] = "Profile updated"
			redirect_to :action => 'show'
		else
			redirect_to :action => 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to :action => 'index'
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
