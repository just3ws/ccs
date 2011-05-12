class UsersController < ApplicationController
  load_and_authorize_resource
  caches_page [:index, :show]

  def show
    response.headers['Cache-Control'] = 'public, max-age=9600'
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        expire_page :action => :index
        format.html { redirect_to(@user, :notice => 'user was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def index 
    response.headers['Cache-Control'] = 'public, max-age=9600'
    @users = User.speakers.with_rsvped_sessions
  end
end
