class SesjasController < ApplicationController
  load_and_authorize_resource
  caches_page [:index]

  def index
    response.headers['Cache-Control'] = "public, max-age=#{CACHE_CONTROL__MAX_AGE}"
    respond_to do |format|
      format.html 
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @sesja.save
        expire_page :action => :index
        format.html { redirect_to(@sesja, :notice => 'Session was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @sesja.update_attributes(params[:sesja])
        expire_page :action => :index
        format.html { redirect_to(@sesja, :notice => 'Session was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @sesja.destroy
    expire_page :action => :index
    respond_to do |format|
      format.html { redirect_to(sesjas_url) }
    end
  end
end
