class Admins::DroppedLettersController < ApplicationController
  
  before_action :authenticate_admin!

  layout 'admin'

  def index
    @new_letter = DroppedLetter.new
    @letters = DroppedLetter.all.page(params[:page]).reverse_order
  end

  def create
    @new_letter = DroppedLetter.new(letter_params)
    if @new_letter.save
    redirect_to admins_dropped_letters_path, notice:"投稿に成功しました。"
    else
      @new_letter.errors.full_messages
      @letters = DroppedLetter.all.page(params[:page]).reverse_order
      render :index
    end
  end

  def edit
    @letter = DroppedLetter.find(params[:id])
  end

  def update
    @letter = DroppedLetter.find(params[:id])
    if @letter.update(letter_params)
      redirect_to admins_dropped_letters_path, notice:"更新に成功しました。"
    else
      @letter.errors.full_messages
      render :edit
    end
  end

  private

  def letter_params
    params.require(:dropped_letter).permit(:body, :delete_flg)
  end
  
end
