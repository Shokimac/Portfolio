class ProverbsController < ApplicationController
  def new
    @proverb = Proverb.new
  end

  def create
    @proverb = Proverb.new(proverb_params)
    @proverb.user_id = current_user.id
    @proverb.save
    redirect_to proverbs_path
  end

  def index
  end

  def show
    @proverb = Proverb.find(params[:id])
    @user = User.find(@proverb.user_id)
    @comment = PostComment.new
    @comments = PostComment.where(proverb_id: @proverb.id)
  end

  def edit
    @proverb = Proverb.find(params[:id])
  end

  def update
    @proverb = Proverb.find(params[:id])
    @proverb.update(proverb_params)
    redirect_to proverb_path(@proverb)
  end

  def destroy
    @proverb = Proverb.find(params[:id])
    @proverb.destroy
    redirect_to proverbs_path
  end

  private

  def proverb_params
    params.require(:proverb).permit(:body, :name, :introduction)
  end
end
