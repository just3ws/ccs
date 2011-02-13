class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'user was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
