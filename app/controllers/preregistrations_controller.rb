require 'csv'

class PreregistrationsController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @preregistrations }
      format.csv do
        csv_string = CSV.generate do |csv|
          csv << ["email", "created at", "status"]
          @preregistrations.each do |reg|
            csv << [reg.email, reg.created_at, reg.status]
          end
        end
        send_data csv_string, :type => "application/vnd.ms-excel", :filename=>"emails.csv", :disposition => 'attachment'
      end
    end
  end

  # POST /preregistrations
  # POST /preregistrations.xml
  def create
    #@preregistration        = Preregistration.new(params[:preregistration])
    @preregistration.status = 'NEW'

    respond_to do |format|
      if @preregistration.save
        format.html { redirect_to(root_url, :notice => 'Thank you for your interest. We will notify you when the registration opens.') }
      else
        msg = 'Sorry. We could not register your email for updates.'
        msg = "Sorry. The email #{@preregistration.errors.on :email}." unless @preregistration.errors[:email].empty?

        format.html { redirect_to root_url, :alert => msg }
      end
    end
  end

end
