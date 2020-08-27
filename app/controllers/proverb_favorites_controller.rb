class ProverbFavoritesController < ApplicationController

  before_action :authenticate_user!
  
  def create
    @proverb = Proverb.find(params[:proverb_id])
    favorite = current_user.proverb_favorites.new
    favorite.proverb_id = @proverb.id
    favorite.save
  end

  def destroy
    @proverb = Proverb.find(params[:proverb_id])
    favorite = ProverbFavorite.find_by(proverb_id: @proverb.id, user_id: current_user.id)
    favorite.destroy
  end
end
