class UsersController < ApplicationController
  load_and_authorize_resource
  caches_page [:index, :show]

  def show
    response.headers['Cache-Control'] = "public, max-age=#{CACHE_CONTROL__MAX_AGE}"
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        expire_page :action => :index
        sign_in(@user, bypass: true)
        format.html { redirect_to(@user, :action => "show", :notice => 'user was successfully updated.') }
      else
        sign_in(@user, bypass: true)
        format.html { render :action => "edit" }
      end
    end
  end

  def index
    response.headers['Cache-Control'] = "public, max-age=#{CACHE_CONTROL__MAX_AGE}"
    @users = User.speakers.with_rsvped_sessions
  end
end
