class EpisodeBookmarksController < ApplicationController

    before_action :authenticate_user!
    
    def create
        @episode = Episode.find(params[:episode_id])
        bookmark = current_user.episode_bookmarks.new
        bookmark.episode_id = @episode.id
        bookmark.save
    end

    def destroy
        @episode = Episode.find(params[:episode_id])
        bookmark = EpisodeBookmark.find_by(episode_id: @episode.id, user_id: current_user.id)
        bookmark.destroy
    end
end
