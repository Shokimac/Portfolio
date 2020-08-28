class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'
  
  def index
    @users = User.all.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @episodes = Episode.includes(:user).where(user_id: @user.id).page(params[:page]).reverse_order
    @proverbs = Proverb.includes(:user).where(user_id: @user.id).page(params[:page]).reverse_order    
  end

  def withdrawal
    @user = User.find(params[:user_id])
    @user.delete_flg = true
    @user.save
    redirect_to admins_users_path
  end
end
