require 'generator'

class SubmissionsController < ApplicationController
  load_and_authorize_resource

  # GET /submissions
  # GET /submissions.xml
  def index
  end

  # GET /submissions/1
  # GET /submissions/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.xml
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @submission }
    end
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.xml
  def create
    p params[:submission]
    p params[:user]
    @submission.user      = find_or_create_user_with params[:user] #params[:submission].slice(:email, :home_page, :first_name, :last_name, :biography)
    @submission.user.role = "speaker"
    respond_to do |format|
      if @submission.save
        format.html { redirect_to(@submission, :notice => 'Submission was successfully created.') }
        format.xml { render :xml => @submission, :status => :created, :location => @submission }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.xml
  def update
    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to(@submission, :notice => 'Submission was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.xml
  def destroy
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to(submissions_url) }
      format.xml { head :ok }
    end
  end

  private

  def find_or_create_user_with(p)
    # use the current user
    return current_user if user_signed_in?

    # lookup the user
    user = User.find(:first, :conditions => {:email => p[:email]})
    return user unless user.nil?

    # make a user
    password = Generator.password
    user     = User.create!(p.symbolize_keys.merge(:password => password, :password_confirmation => password))

    if user.errors.blank?
      sign_in user
    end
    user
  end
end
