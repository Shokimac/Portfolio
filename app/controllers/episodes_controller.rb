class EpisodesController < ApplicationController
  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    @episode.user_id = current_user.id
    @episode.save
    redirect_to episode_path(@episode)
  end

  def index
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
    @episode.update(episode_params)
    redirect_to episode_path(@episode)
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    redirect_to episodes_path
  end

  private

  def episode_params
    params.require(:episode).permit(:title, :body)
  end

end
