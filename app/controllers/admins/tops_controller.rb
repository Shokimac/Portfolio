class Admins::TopsController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'

  def top
    @episodes = Episode.all.include(:user).page(params[:page]).reverse_order
    @proverbs = Proverb.all.include(:user).page(params[:page]).reverse_order
  end
end