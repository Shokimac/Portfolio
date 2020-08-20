class Admins::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.delete_flg = true
    @user.save
    redirect_to admins_users_path
  end
end
