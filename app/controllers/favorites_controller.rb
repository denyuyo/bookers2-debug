class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    current_user.favorite(book)
    redirect_back fallback_location: books_path
  end

  def destroy
    book = Book.find(params[:book_id])
    current_user.unfavorite(book)
    redirect_back fallback_location: books_path
  end
end
