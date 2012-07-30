class SessionsController < ApplicationController
  def new
		@title = "Sign in page"
  end

	def create
		user = User.authenticate(params[:session][:name],
															params[:session][:password])
		if user.nil?
			@title = "Sign in"
			flash[:fail] = "Sign in failed!"
			render 'new'
		else
			sign_in user
			redirect_to user
		end
	end

 	def destroy
		sign_out
		redirect_to signin_path
	end

end
