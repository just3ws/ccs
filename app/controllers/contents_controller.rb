class ContentsController < ApplicationController
  load_and_authorize_resource
  caches_page :show

  def index
  end

  def show
    permalink = params[:path] || "default"
    @content = Content.find_by_permalink(permalink)
    unless @content
      flash[:alert] = "Sorry, couldn't find the page '#{permalink}'."
      if current_user.try(:admin?)
        @content = Content.new(:permalink => permalink)
        render :action => "new"
      else
        redirect_to root_url
      end
    end
  end

  def new
  end

  def edit
    @content = Content.find(params[:id])
  end

  def create
    respond_to do |format|
      if @content.save
        format.html { redirect_to(@content, :notice => 'Content was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to(@content, :notice => 'Content was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to(contents_url) }
    end
  end
end
