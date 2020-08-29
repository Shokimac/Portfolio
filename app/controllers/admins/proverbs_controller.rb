class Admins::ProverbsController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'

  def show
    @proverb = Proverb.find(params[:id])
    @comments = PostComment.where(proverb_id: @proverb.id).includes(:user).page(params[:page]).reverse_order
  end

  def destroy
    @proverb = Proverb.find(params[:id])
    @proverb.destroy
    redirect_to admins_tops_top_path
  end

end