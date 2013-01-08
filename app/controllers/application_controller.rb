class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_user!, :set_session_user
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def set_session_user
     User.session_current_user = current_user if current_user
  end
  
end
