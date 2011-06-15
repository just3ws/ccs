class Admin::HomeController  < ActionController::Base
  helper :all
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  def index

  end
end
