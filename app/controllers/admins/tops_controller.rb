class Admins::TopsController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'

  def top
    @episodes = Episode.includes(:user).page(params[:page]).reverse_order
    @proverbs = Proverb.includes(:user).page(params[:page]).reverse_order
  end
end