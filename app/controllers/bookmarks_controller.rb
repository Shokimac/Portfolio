class BookmarksController < ApplicationController
  def index
    @episodes = EpisodeBookmark.includes(:user).where(user_id: current_user.id).page(params[:page]).reverse_order
    @proverbs = ProverbBookmark.includes(:user).where(user_id: current_user.id).page(params[:page]).reverse_order
  end
end