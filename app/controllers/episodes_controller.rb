class EpisodesController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    @episode.user_id = current_user.id
    if @episode.save
      redirect_to episode_path(@episode), notice: "エピソードを投稿しました"
    else
      @episode.errors.full_messages
      render :new
    end
  end

  def index
    @episodes = Episode.eager_load(:user).page(params[:page]).reverse_order
    @user_episodes = Episode.preload(:user).where(user_id: current_user.id).page(params[:page]).reverse_order
    @user = User.find(current_user.id)
    unless @user.image_id.nil?
      @image_url = "https://image-resize-itowokashi.s3-ap-northeast-1.amazonaws.com/store/" + @user.image_id + "-thumbnail."
    else
      @image_url = "https://direct-access.s3-ap-northeast-1.amazonaws.com/no_image.png"
    end
  end

  def show
    @episode = Episode.find(params[:id])
    @user = User.find(@episode.user_id)
  end

  def edit
    @episode = Episode.find(params[:id])
  end

  def update
    @episode = Episode.find(params[:id])
    if @episode.update(episode_params)
    redirect_to episode_path(@episode), notice: "エピソードを更新しました"
    else
      @episode.errors.full_messages
      render :edit
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    redirect_to episodes_path
  end

  def search
  end

  def result
    @word = params[:title]
    @results = Episode.search(@word)
    respond_to do |format|
      format.html
      format.json { render json: @results }
    end
  end

  private

  def episode_params
    params.require(:episode).permit(:title, :body)
  end

  def ensure_correct_user
    episode = Episode.find(params[:id])
    user = User.find(episode.user_id)
    unless user == current_user
      redirect_to user_path(current_user)
    end
  end
end
