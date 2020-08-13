class FavoritesController < ApplicationController
    def create
        case params[:favorite_sort]
        when "0"
            @proverb = Proverb.find(params[:proverb_id])
            favorite = current_user.proverb_favorites.new
            favorite.proverb_id = @proverb.id
            favorite.save
            redirect_to proverb_path(@proverb)
        end

    end

    def destroy
        case params[:favorite_sort]
        when "0"
            @proverb = Proverb.find(params[:proverb_id])
            favorite = ProverbFavorite.find_by(proverb_id: @proverb.id, user_id: current_user.id)
            favorite.destroy
            redirect_to proverb_path(@proverb)
        end
    end

end
