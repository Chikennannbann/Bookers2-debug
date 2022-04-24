class BooksController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
  # edit,update,destroyアクション内の@book = Book.find(params[:id])は削除しても作動する。
  # そのアクションが呼び出される前にensure_current_userの中に定義されているものが作動するから。

  def show
    @book = Book.find(params[:id])
    @booknew = Book.new
    @book_comment = BookComment.new
    # インスタンス変数を置かず、直接部分テンプレートにBook.newを渡すことでも解決
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render:index
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render:edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_current_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
