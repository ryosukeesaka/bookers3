class BooksController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    flash[:create] ="大成功2."
    else
    render action: :index
    end
 
  end

    def edit
      @book = Book.find(params[:id])

    end

    def index
      @user = current_user
    	@books = Book.page(params[:page])
    	@book = Book.new
      @t = Book.ransack(params[:q])
      @books = @t.result(distinct: true)
    end

    def show
      @new = Book.new
      @book = Book.find(params[:id])
      @user = @book.user
      @post_comment = PostComment.new
    end

    def update
      @book = Book.find(params[:id])
     if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:update] ="大成功."
      else
      render action: :edit
    end
    end

    def destroy
       book = Book.find(params[:id]) #データ(レコード)を1件取得
        book.destroy #データ（レコード）を削除
        redirect_to books_path
    end


    private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def correct_user
    book = Book.find(params[:id])
    if current_user.id != book.user.id
      redirect_to books_path
    end
  end


end
