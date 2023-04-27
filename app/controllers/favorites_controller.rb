class FavoritesController < ApplicationController
  before_action :book_params

  def create
    @favorite = current_user.favorites.build(book_params)
    @book = @favorite.book
    if @favorite.save
      redirect_back fallback_location: books_path
    end
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @book = @favorite.book
    if @favorite.destroy
      redirect_back fallback_location: books_path
    end
  end
end