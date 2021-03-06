class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    @comment = BookComment.new(book_comment_params)
    @comment.user_id = current_user.id
    # comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = book.id
    @comment.save
    # redirect_back(fallback_location: book_path(book))
  end

  def destroy
    @comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @comment.destroy
    # BookComment.find(params[:id]).destroyでもok
    # find_byはidとbook_idで探す。URIパターンがそうだからこのように書いていると考えられる。
    # redirect_back(fallback_location: book_path(params[:book_id]))
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
