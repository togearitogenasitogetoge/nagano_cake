class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
    flash[:notice] = "ジャンルの登録に成功しました"
    redirect_to admin_genres_path
    else
    @genres = Genre.all
    render :index
    end
  end


  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルの登録に成功しました"
       redirect_to admin_genres_path
    else
       render 'edit'
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

end
