class ApplicationController < ActionController::Base
	# Require authentication for the app, but allow Devise controllers
	# to handle sign in/up pages without being blocked.
	before_action :authenticate_user!, unless: :devise_controller?
end
