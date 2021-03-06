class SessionsController < ApplicationController
  def new
		@title = "Sign in page"
  end

	def create
		user = User.authenticate(params[:session][:name],
								params[:session][:password])
		if user.nil?
			@title = "Sign in"
			flash[:center] = "Sign in failed!"
			render 'new'
		else
			sign_in user
			redirect_to messages_path
		end
	end

 	def destroy
		sign_out
		redirect_to signin_path
	end

end
