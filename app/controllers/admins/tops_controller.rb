class Admins::TopsController < ApplicationController
  def top
    @episodes = Episode.page(params[:page]).reverse_order
    @proverbs = Proverb.page(params[:page]).reverse_order
  end
end
