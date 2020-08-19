class Admins::EpisodesController < ApplicationController
  def show
    @episode = Episode.find(params[:id])
    @user = User.find(@episode.user_id)
  end

  def destroy
    @episode = Episode.find(params[:id])
    binding.pry
    @episode.destroy
    redirect_to admins_tops_top_path
  end
end
