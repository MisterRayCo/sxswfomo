class SessionController < ApplicationController
  	def new
	end

	def login
    		user = User.find_by_email(params[:email])
    		if user && user.authenticate(params[:password])
      			session[:user_id] = user.id
      			redirect_to events_path
    		else
      			redirect_to login_path
		end 
	end
  	
	def destroy
		session[:user_id] = nil
		redirect_to notes_path
  	end

end
