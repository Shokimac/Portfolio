class EpisodeFavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @episode = Episode.find(params[:episode_id])
    favorite = current_user.episode_favorites.new
    favorite.episode_id = @episode.id
    unless favorite.save
      @episode = Episode.find(params[:id])
      @user = User.find(@proverb.user_id)
      render 'episodes/show'
    end
  end

  def destroy
    @episode = Episode.find(params[:episode_id])
    favorite = EpisodeFavorite.find_by(episode_id: @episode.id, user_id: current_user.id)
    unless favorite.destroy
      @episode = Episode.find(params[:id])
      @user = User.find(@proverb.user_id)
      render 'episodes/show'
    end
  end
end
