class EpisodeBookmarksController < ApplicationController

    before_action :authenticate_user!
    
    def create
        @episode = Episode.find(params[:episode_id])
        bookmark = current_user.episode_bookmarks.new
        bookmark.episode_id = @episode.id
        unless bookmark.save
            @episode = Episode.find(params[:id])
            @user = User.find(@proverb.user_id)
            render 'episodes/show'
        end
    end

    def destroy
        @episode = Episode.find(params[:episode_id])
        bookmark = EpisodeBookmark.find_by(episode_id: @episode.id, user_id: current_user.id)
        unless bookmark.destroy
            @episode = Episode.find(params[:id])
            @user = User.find(@proverb.user_id)
            render 'episodes/show'
        end
    end
end
