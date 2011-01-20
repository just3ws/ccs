class PreregistrationsController < ApplicationController
  # GET /preregistrations
  # GET /preregistrations.xml
  #def index
    #@preregistrations = Preregistration.all

    #respond_to do |format|
      #format.html # index.html.erb
      #format.xml  { render :xml => @preregistrations }
    #end
  #end

  # GET /preregistrations/1
  # GET /preregistrations/1.xml
  #def show
    #@preregistration = Preregistration.find(params[:id])

    #respond_to do |format|
      #format.html # show.html.erb
      #format.xml  { render :xml => @preregistration }
    #end
  #end

  # GET /preregistrations/new
  # GET /preregistrations/new.xml
  def new
    @preregistration = Preregistration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @preregistration }
    end
  end

  # GET /preregistrations/1/edit
  #def edit
    #@preregistration = Preregistration.find(params[:id])
  #end

  # POST /preregistrations
  # POST /preregistrations.xml
  def create
    @preregistration = Preregistration.new(params[:preregistration])

    respond_to do |format|
      if @preregistration.save
        #format.html { redirect_to(@preregistration, :notice => 'Preregistration was successfully created.') }
        format.xml  { render :xml => @preregistration, :status => :created, :location => @preregistration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @preregistration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /preregistrations/1
  # PUT /preregistrations/1.xml
  #def update
    #@preregistration = Preregistration.find(params[:id])

    #respond_to do |format|
      #if @preregistration.update_attributes(params[:preregistration])
        #format.html { redirect_to(@preregistration, :notice => 'Preregistration was successfully updated.') }
        #format.xml  { head :ok }
      #else
        #format.html { render :action => "edit" }
        #format.xml  { render :xml => @preregistration.errors, :status => :unprocessable_entity }
      #end
    #end
  #end

  # DELETE /preregistrations/1
  # DELETE /preregistrations/1.xml
  #def destroy
    #@preregistration = Preregistration.find(params[:id])
    #@preregistration.destroy

    #respond_to do |format|
      #format.html { redirect_to(preregistrations_url) }
      #format.xml  { head :ok }
    #end
  #end
end
