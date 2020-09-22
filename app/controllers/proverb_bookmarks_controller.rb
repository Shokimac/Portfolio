class ProverbBookmarksController < ApplicationController

    before_action :authenticate_user!

    def create
        @proverb = Proverb.find(params[:proverb_id])
        bookmark = current_user.proverb_bookmarks.new
        bookmark.proverb_id = @proverb.id
        unless bookmark.save
            @proverb = Proverb.find(params[:id])
            @user = User.find(@proverb.user_id)
            @comment = PostComment.new
            @comments = PostComment.where(proverb_id: @proverb.id).includes(:user, :proverb).page(params[:page]).reverse_order
            render 'proverbs/show'
        end
    end

    def destroy
        @proverb = Proverb.find(params[:proverb_id])
        bookmark = ProverbBookmark.find_by(proverb_id: @proverb.id, user_id: current_user.id)
        unless bookmark.destroy
            @proverb = Proverb.find(params[:id])
            @user = User.find(@proverb.user_id)
            @comment = PostComment.new
            @comments = PostComment.where(proverb_id: @proverb.id).includes(:user, :proverb).page(params[:page]).reverse_order
            render 'proverbs/show'
        end
    end
end
