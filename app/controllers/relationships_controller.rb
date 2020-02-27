class RelationshipsController < ApplicationController
	def create
        follow = current_user.follow(params[:id])
        #user.rbのdefでfollowを定義
        if follow.save!
        redirect_to user_path(params[:id])
    end
    end

    def  destroy
    	#user = User.find(params[:user_id])
        current_user.unfollow(params[:id])#user.rbのdefでunfollowを定義
        redirect_to user_path(params[:id])
    end

    def follows
        @user = User.find(params[:id])
    end

    def followers
        @user = User.find(params[:id])
    end
end
