class FavoritesController < ApplicationController
    def create
        b = Book.find(params[:book_id])#本を見つける
        favorite = current_user.favorites.new(book_id: b.id)#favoriteテーブルのbook_idカラムにbook.idを入れる
        favorite.save
        if params[:q]#中身はl qは変数
        redirect_to books_path
        else
        redirect_to book_path(b.id)
        end
    end
    def destroy
        book = Book.find(params[:book_id])
        favorite = current_user.favorites.find_by(book_id: book.id)
        favorite.destroy
         if params[:q]
        redirect_to books_path
        else
        redirect_to book_path(book.id)
        end
    end




end
