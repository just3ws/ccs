class CommentsController < ApplicationController
  authorize_resource

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      flash.now[:notice] = "Successfully saved comment."
      @comment = nil
    else
      flash.now[:error] = "Unable to create comment."
    end

    content_type = @commentable.class.to_s.downcase
    var_name = "@#{content_type}"
    instance_variable_set var_name, @commentable
    respond_to do |format|
      format.html do
        render "sesjas/show"
      end
    end
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
end
