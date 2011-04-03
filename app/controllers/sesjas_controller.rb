class SesjasController < ApplicationController
  # GET /sesjas
  # GET /sesjas.xml
  def index
    @sesjas = Sesja.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sesjas }
    end
  end

  # GET /sesjas/1
  # GET /sesjas/1.xml
  def show
    @sesja = Sesja.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sesja }
    end
  end

  # GET /sesjas/new
  # GET /sesjas/new.xml
  def new
    @sesja = Sesja.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sesja }
    end
  end

  # GET /sesjas/1/edit
  def edit
    @sesja = Sesja.find(params[:id])
  end

  # POST /sesjas
  # POST /sesjas.xml
  def create
    @sesja = Sesja.new(params[:sesja])

    respond_to do |format|
      if @sesja.save
        format.html { redirect_to(@sesja, :notice => 'Sesja was successfully created.') }
        format.xml  { render :xml => @sesja, :status => :created, :location => @sesja }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sesja.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sesjas/1
  # PUT /sesjas/1.xml
  def update
    @sesja = Sesja.find(params[:id])

    respond_to do |format|
      if @sesja.update_attributes(params[:sesja])
        format.html { redirect_to(@sesja, :notice => 'Sesja was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sesja.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sesjas/1
  # DELETE /sesjas/1.xml
  def destroy
    @sesja = Sesja.find(params[:id])
    @sesja.destroy

    respond_to do |format|
      format.html { redirect_to(sesjas_url) }
      format.xml  { head :ok }
    end
  end
end
