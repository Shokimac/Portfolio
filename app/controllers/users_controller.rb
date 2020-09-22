class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_correct_confirmation, only: [:confirmation]

  def confirmation
    @user = User.find(params[:user_id])
    unless @user.image_id.nil?
      @image_url = "https://image-resize-itowokashi.s3-ap-northeast-1.amazonaws.com/store/" + @user.image_id + "-thumbnail."
    else
      @image_url = "https://direct-access.s3-ap-northeast-1.amazonaws.com/no_image.png"
    end
  end

  def show
    @user = User.find(params[:id])
    @episodes = Episode.includes(:user).where(user_id: @user.id).page(params[:page]).reverse_order
    @proverbs = Proverb.includes(:user).where(user_id: @user.id).page(params[:page]).reverse_order
    unless @user.image_id.nil?
      @image_url = "https://image-resize-itowokashi.s3-ap-northeast-1.amazonaws.com/store/" + @user.image_id + "-thumbnail."
    else
      @image_url = "https://direct-access.s3-ap-northeast-1.amazonaws.com/no_image.png"
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user.image_id.nil?
      @image_url = "https://image-resize-itowokashi.s3-ap-northeast-1.amazonaws.com/store/" + @user.image_id + "-thumbnail."
    else
      @image_url = "https://direct-access.s3-ap-northeast-1.amazonaws.com/no_image.png"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sleep(3)
    redirect_to user_path(@user), notice:"プロフィールを更新しました。"
    else
    @user.errors.full_messages
    unless @user.image_id.nil?
      @image_url = "https://image-resize-itowokashi.s3-ap-northeast-1.amazonaws.com/store/" + @user.image_id + "-thumbnail."
    else
      @image_url = "https://direct-access.s3-ap-northeast-1.amazonaws.com/no_image.png"
    end
    render :edit
    end
  end

  def withdrawal
    @user = current_user
  end

  def withdrawal_update
    @user = current_user
    @user.update(delete_flg: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image, :image_id)
  end

  def ensure_correct_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to user_path(current_user)
    end
  end

  def ensure_correct_confirmation
    user = User.find(params[:user_id])
    unless user == current_user
      redirect_to user_path(current_user)
    end
  end

end
