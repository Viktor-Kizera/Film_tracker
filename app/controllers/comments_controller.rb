class CommentsController < ApplicationController

  def new
    @comment = Comment.new(film_id: params[:film_id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params.merge(film_id: params[:film_id], user_id: current_user.id))
    if @comment.save
      redirect_to film_path(@comment.film.id)
    else
      render :new
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to film_path(@comment.film.id)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to film_path(@comment.film.id) if @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :film_id, :user_id)
  end
end
