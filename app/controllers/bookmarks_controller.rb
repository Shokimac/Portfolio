class BookmarksController < ApplicationController
  def index
    @episodes = EpisodeBookmark.where(user_id: current_user.id).page(params[:page]).reverse_order
    @proverbs = ProverbBookmark.where(user_id: current_user.id).page(params[:page]).reverse_order
  end
end