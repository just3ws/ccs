class StaticController < ApplicationController
  caches_page :show
  
  @@valid ||= %(home about location)

  def show
    params[:path] = "home" if params[:path].blank? 

    if @@valid.include?(params[:path])
      render :template => File.join('static', params[:path])
    else
      render :file => File.join(Rails.root, 'public', '404.html'), :status => 404
    end
  end
end
