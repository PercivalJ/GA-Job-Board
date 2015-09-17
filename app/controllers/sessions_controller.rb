class SessionsController < ApplicationController
  def new
	
	end


	def create
		user = User.find_by(email: params[:login][:email])
		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id
			redirect_to jobs_path
		else
			flash.now.alert = "invalid login credentials"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
      	redirect_to root_url
	end

end