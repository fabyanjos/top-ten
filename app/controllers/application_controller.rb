class ApplicationController < ActionController::Base
	before_filter :authorize
	protect_from_forgery

	protected
	def authorize
		unless session[:user_id]
			flash[:alert] = "Please loggin"
			redirect_to root_url
		end
	end

	private
	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
	
end
