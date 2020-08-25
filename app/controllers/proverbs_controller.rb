class ProverbsController < ApplicationController
  def new
    @proverb = Proverb.new
  end

  def create
    @proverb = Proverb.new(proverb_params)
    @proverb.user_id = current_user.id
    if @proverb.save
    redirect_to proverbs_path
    else
      render :new
    end
  end

  def index
    @proverbs = Proverb.all.page(params[:page]).reverse_order
    @user = User.find(current_user.id)
    @all_rank = Proverb.all.sort {|a,b| b.proverb_favorites.count <=> a.proverb_favorites.count}
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
    if @proverb.update(proverb_params)
    redirect_to proverb_path(@proverb)
    else
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
end
