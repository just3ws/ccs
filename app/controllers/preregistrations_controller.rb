class PreregistrationsController < ApplicationController
  
  load_and_authorize_resource
  
  # POST /preregistrations
  # POST /preregistrations.xml
  def create
    @preregistration = Preregistration.new(params[:preregistration])
    @preregistration.status = 'NEW'
    
    respond_to do |format|
      if @preregistration.save
        format.html { redirect_to('/', :notice => 'Thank you for your interest. We will notify you when the registration opens.') }
        format.xml { render :xml => @preregistration, :status => :created, :location => @preregistration }
      else
        msg = 'Sorry. We could not register your email for updates.'
        msg = "Sorry. The email #{@preregistration.errors.on :email}." unless @preregistration.errors[:email].empty?
        
        format.html { redirect_to '/', :alert => msg }
        format.xml { render :xml => @preregistration.errors, :status => :unprocessable_entity }
      end
    end
  end

end
