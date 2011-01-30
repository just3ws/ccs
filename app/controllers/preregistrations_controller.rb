class PreregistrationsController < ApplicationController
  
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
        #Question: How can I tell if the error was "duplicate email" and give the user the
        # right explanation?
        format.html { redirect_to '/', :alert => "Sorry. There was an error saving your email to be notified. Maybe you had already registered?" }
        format.xml { render :xml => @preregistration.errors, :status => :unprocessable_entity }
      end
    end
  end

end
