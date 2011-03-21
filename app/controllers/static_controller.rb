class StaticController < ApplicationController
  caches_page :show
  
  def show

    @content = Content.find_by_permalink(params[:path])

    unless @content
      flash[:alert] = "Sorry, couldn't find the page '#{params[:path]}'."
      if current_user.admin?
        redirect_to :controller => :content, :action => :new #new_content_path(Content.new(:permalink => params[:path]))
      else
      redirect_to root_url
      end
    end
  end
end
