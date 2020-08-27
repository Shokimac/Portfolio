class Admins::ProverbsController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'

  def show
    @proverb = Proverb.find(params[:id])
    @post_comments = PostComment.where(proverb_id: @proverb.id)
  end
end
