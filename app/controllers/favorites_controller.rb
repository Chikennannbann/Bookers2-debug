class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    # redirect_back(fallback_location: books_path)
    # # fallbackで戻れなかった時用のパスを指定
    # # redirect_to request.refererも同じ
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    # redirect_back(fallback_location: books_path)
  end

end
