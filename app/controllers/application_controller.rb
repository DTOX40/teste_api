class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller
  #protect_from_forgery with: :exception
 	
 	protected


 	def configure_permitted_parameters
 		devise_parameter_sanitizer.permit(:sing_up, keys:[:username])
 		devise_parameter_sanitizer.permit(:account_update, keys:[:username])
 	end
end
