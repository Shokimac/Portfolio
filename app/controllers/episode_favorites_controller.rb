class EpisodeFavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @episode = Episode.find(params[:episode_id])
    favorite = current_user.episode_favorites.new
    favorite.episode_id = @episode.id
    favorite.save
  end

  def destroy
    @episode = Episode.find(params[:episode_id])
    favorite = EpisodeFavorite.find_by(episode_id: @episode.id, user_id: current_user.id)
    favorite.destroy
  end
end
