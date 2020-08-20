class BookmarksController < ApplicationController

  def index

  end

  def create
    case params[:bookmark_sort]
    when "0"
        @proverb = Proverb.find(params[:proverb_id])
        bookmark = current_user.proverb_bookmarks.new
        bookmark.proverb_id = @proverb.id
        bookmark.save
        redirect_to proverb_path(@proverb)
        
    when "1"
        @episode = Episode.find(params[:episode_id])
        bookmark = current_user.episode_bookmarks.new
        bookmark.episode_id = @episode.id
        bookmark.save
    end
end

def destroy
    case params[:bookmark_sort]
    when "0"
        @proverb = Proverb.find(params[:proverb_id])
        bookmark = ProverbBookmark.find_by(proverb_id: @proverb.id, user_id: current_user.id)
        bookmark.destroy
        redirect_to proverb_path(@proverb)
    when "1"
        @episode = Episode.find(params[:episode_id])
        bookmark = EpisodeBookmark.find_by(episode_id: @episode.id, user_id: current_user.id)
        bookmark.destroy
    end
end
end
