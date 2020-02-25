class PostCommentsController < ApplicationController
	def create
		comment = PostComment.new(comment: params[:post_comment][:comment],
		                          book_id: params[:book_id],
		                          user_id: current_user.id)
		book = Book.find(params[:book_id])#book_idはカラム名を定義している。
		comment.save
		redirect_to book_path(book.id)
	end

	def destroy
		book = Book.find(params[:book_id])
		comment = PostComment.find(params[:id])
        comment.destroy
        redirect_to book_path(book)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:commnet)
	end
end
