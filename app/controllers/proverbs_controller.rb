class ProverbsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @proverb = Proverb.new
  end

  def create
    @proverb = Proverb.new(proverb_params)
    @proverb.user_id = current_user.id
    if @proverb.save
    redirect_to proverbs_path
    else
      @proverb.errors.full_messages
      render :new
    end
  end

  def index
    @proverbs = Proverb.all.includes(:user).page(params[:page]).reverse_order
    @user = User.find(current_user.id)
    @all_rank = Proverb.all.includes(:user).sort {|a,b| b.proverb_favorites.count <=> a.proverb_favorites.count}
  end

  def show
    @proverb = Proverb.find(params[:id])
    @user = User.find(@proverb.user_id)
    @comment = PostComment.new
    @comments = PostComment.where(proverb_id: @proverb.id).includes(:user, :proverb).page(params[:page]).reverse_order
  end

  def edit
    @proverb = Proverb.find(params[:id])
  end

  def update
    @proverb = Proverb.find(params[:id])
    if @proverb.update(proverb_params)
    redirect_to proverb_path(@proverb)
    else
      @proverb.errors.full_messages
      render :edit
    end
  end

  def destroy
    @proverb = Proverb.find(params[:id])
    @proverb.destroy
    redirect_to proverbs_path
  end

  def search
  end

  def result
    @word = params[:name]
    @results = Proverb.search(@word)
    respond_to do |format|
      format.html
      format.json { render json: @results }
    end
  end

  private

  def proverb_params
    params.require(:proverb).permit(:body, :name, :introduction)
  end

  def ensure_correct_user
    proverb = Proverb.find(params[:id])
    user = User.find(proverb.user_id)
    unless user == current_user
      redirect_to user_path(current_user)
    end
  end
end
