class StaticController < ApplicationController
  caches_page :show
  
  def show

    @content = Content.find_by_permalink(params[:path])

    unless @content 
      flash[:alert] = "Sorry, couldn't find the page '#{params[:path]}'."
      redirect_to root_url
    end
  end
end
