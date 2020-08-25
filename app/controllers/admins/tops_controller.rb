class Admins::TopsController < ApplicationController

  before_action :authenticate_admin!

  def top
    @episodes = Episode.page(params[:page]).reverse_order
    @proverbs = Proverb.page(params[:page]).reverse_order
  end
end
