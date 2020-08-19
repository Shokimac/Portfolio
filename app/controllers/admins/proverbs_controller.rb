class Admins::ProverbsController < ApplicationController
  def show
    @proverb = Proverb.find(params[:id])
    @post_comments = PostComment.where(proverb_id: @proverb.id)
  end
end
