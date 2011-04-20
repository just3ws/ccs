class SponsorshipLevelsController < ApplicationController
  load_and_authorize_resource

  # GET /sponsorship_levels
  # GET /sponsorship_levels.xml
  def index
    # @sponsorship_levels = SponsorshipLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sponsorship_levels }
    end
  end

  # GET /sponsorship_levels/1
  # GET /sponsorship_levels/1.xml
  def show
    # @sponsorship_level = SponsorshipLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sponsorship_level }
    end
  end

  # GET /sponsorship_levels/new
  # GET /sponsorship_levels/new.xml
  def new
    # @sponsorship_level = SponsorshipLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sponsorship_level }
    end
  end

  # GET /sponsorship_levels/1/edit
  def edit
    # @sponsorship_level = SponsorshipLevel.find(params[:id])
  end

  # POST /sponsorship_levels
  # POST /sponsorship_levels.xml
  def create
    # @sponsorship_level = SponsorshipLevel.new(params[:sponsorship_level])

    respond_to do |format|
      if @sponsorship_level.save
        format.html { redirect_to(@sponsorship_level, :notice => 'Sponsorship level was successfully created.') }
        format.xml  { render :xml => @sponsorship_level, :status => :created, :location => @sponsorship_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sponsorship_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sponsorship_levels/1
  # PUT /sponsorship_levels/1.xml
  def update
    # @sponsorship_level = SponsorshipLevel.find(params[:id])

    respond_to do |format|
      if @sponsorship_level.update_attributes(params[:sponsorship_level])
        format.html { redirect_to(@sponsorship_level, :notice => 'Sponsorship level was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sponsorship_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsorship_levels/1
  # DELETE /sponsorship_levels/1.xml
  def destroy
    # @sponsorship_level = SponsorshipLevel.find(params[:id])
    @sponsorship_level.destroy

    respond_to do |format|
      format.html { redirect_to(sponsorship_levels_url) }
      format.xml  { head :ok }
    end
  end
end
