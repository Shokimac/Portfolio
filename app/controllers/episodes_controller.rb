class EpisodesController < ApplicationController
  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    @episode.user_id = current_user.id
    binding.pry
    @episode.save
    redirect_to episode_path(@episode)

  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    
  end

  def destroy

  end

  private

  def episode_params
    params.require(:episode).permit(:title, :body)
  end

end
