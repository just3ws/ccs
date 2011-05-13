class SchedulesController < ApplicationController
  load_and_authorize_resource
  caches_page [:index, :show]

  def index
    response.headers['Cache-Control'] = "public, max-age=#{CACHE_CONTROL__MAX_AGE}" 
    @schedules = Schedule.assigned.group_by {|s| s.time_slot.title }
    @last_updated_at = Schedule.last_updated_at

    respond_to do |format|
      if params.keys.include? "printable"
        format.html { render :layout => false, 
          :template => "schedules/printable" }
      else
        format.html
      end
      format.atom { render :layout => false }
    end
  end

  def show
    # @schedule = Schedule.find(params[:id])
    response.headers['Cache-Control'] = "public, max-age=#{CACHE_CONTROL__MAX_AGE}"

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    # @schedule = Schedule.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    # @schedule = Schedule.find(params[:id])
  end

  def create
    # @schedule = Schedule.new(params[:schedule])

    respond_to do |wants|
      if @schedule.save
        expire_page :action => :index
        wants.html { redirect_to(@schedule, :notice => 'Schedule was successfully created.') }
      else
        wants.html { render :action => "new" }
      end
      wants.atom { render :action => "index", :layout => false }
    end
  end

  def update
    # @schedule = Schedule.find(params[:id]).readonly(false)

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        expire_page :action => :index
        format.html { redirect_to(@schedule, :notice => 'Schedule was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.xml
  def destroy
    # @schedule = Schedule.find(params[:id])
    @schedule.destroy
    expire_page :action => :index

    respond_to do |format|
      format.html { redirect_to(schedules_url) }
    end
  end
end
