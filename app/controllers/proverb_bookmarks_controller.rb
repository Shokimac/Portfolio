class ProverbBookmarksController < ApplicationController

    before_action :authenticate_user!

    def create
        @proverb = Proverb.find(params[:proverb_id])
        bookmark = current_user.proverb_bookmarks.new
        bookmark.proverb_id = @proverb.id
        bookmark.save
    end

    def destroy
        @proverb = Proverb.find(params[:proverb_id])
        bookmark = ProverbBookmark.find_by(proverb_id: @proverb.id, user_id: current_user.id)
        bookmark.destroy
    end
end
