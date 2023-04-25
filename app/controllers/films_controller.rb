class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
    @comments = Comment.where(film_id: params[:id])
  end

  def new
    @film = Film.new
  end

  def edit
    @film = Film.find(params[:id])
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @film = Film.find(params[:id])
    if @film.update(film_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def film_params
    params.require(:film).permit(:name, :genre, :author, :year)
  end
end
