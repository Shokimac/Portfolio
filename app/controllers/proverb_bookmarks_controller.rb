class ProverbBookmarksController < ApplicationController
    def create
        @proverb = Proverb.find(params[:proverb_id])
        bookmark = current_user.proverb_bookmarks.new
        bookmark.proverb_id = @proverb.id
        bookmark.save
        redirect_to proverb_path(@proverb)
    end

    def destroy
        @proverb = Proverb.find(params[:proverb_id])
        bookmark = ProverbBookmark.find_by(proverb_id: @proverb.id, user_id: current_user.id)
        bookmark.destroy
        redirect_to proverb_path(@proverb)
    end
end
