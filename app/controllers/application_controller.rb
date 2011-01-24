class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_user

  def set_current_user
    Authorization.current_user = current_user
  end
end
