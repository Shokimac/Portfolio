class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice:"プロフィールを更新しました。"
    else
    render :edit
    end
  end

  def withdrawal
    @user = current_user
  end

  def withdrawal_update
        @user = current_user
        @user.delete_flg = true
        @user.save
        redirect_to destroy_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image)
  end

end
