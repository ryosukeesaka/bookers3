class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :update]

def new
 @book = Book.new
 @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(@book.id)
    end

    def index
    	 @users = User.all
    	 @book = Book.new
         @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    end

    def show
    	@user = User.find(params[:id])
    	@book = Book.new
    end

    def edit
        @user = User.find(params[:id])
        if @user != current_user
            redirect_to user_path(current_user.id)
        end
    end

    def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
    	  redirect_to user_path(@user.id)
          flash[:notice] = "You have updated user successfully."
        else
          render action: :edit

        end
    end

    def destroy
    end

    private
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction,:gender, :address, :prefecture, :age)
    end

    def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

end
