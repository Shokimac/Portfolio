class Admins::EpisodesController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'

  def show
    @episode = Episode.find(params[:id])
    @user = User.find(@episode.user_id)
  end

  def destroy
    @episode = Episode.find(params[:id])
    if @episode.destroy
    redirect_to admins_tops_top_path
    else
      render :show, notice: '削除に失敗しました。'
    end
  end
end