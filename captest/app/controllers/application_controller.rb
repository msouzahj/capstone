class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate!
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
	devise_parameter_sanitizer.for(:sign_up) << :fname
	devise_parameter_sanitizer.for(:sign_up) << :lname	
	devise_parameter_sanitizer.for(:account_update) << :fname
	devise_parameter_sanitizer.for(:account_update) << :lname
    end

    def authenticate!
    # use the devise authenticate to make user a user is signed in
    # Could customize by checking for each controller/action pair
    authenticate_user!

    # only allow a user to edit/update or delete ratings created by the user
    if params[:controller] == 'seasons' && (params[:action] == 'edit' || params[:action] == 'update' || params[:action] == 'destroy')
      current_season = Season.find(params[:id])

      if current_season.user_id == current_user.id
        # when you return from authentication!, the program continues to requested page
        return
      else
        # by redirecting here, we are preventing the user from visiting the requested page
        redirect_to root_url, notice: "Record not found"
      end
    end
  end
end

