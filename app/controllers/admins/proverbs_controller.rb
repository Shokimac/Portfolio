class Admins::ProverbsController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'

  def show
    @proverb = Proverb.find(params[:id])
    @comment = PostComment.new
    @comments = PostComment.where(proverb_id: @proverb.id).includes(:user).page(params[:page]).reverse_order
  end
end
