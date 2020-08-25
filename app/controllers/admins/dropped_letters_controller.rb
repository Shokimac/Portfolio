class Admins::DroppedLettersController < ApplicationController
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
    @letter.update(letter_params)
    redirect_to admins_dropped_letters_path
  end

  def destroy
    @letter = DroppedLetter.find(params[:id])
    @letter.destroy
    redirect_to admins_dropped_letters_path
  end

  private

  def letter_params
    params.require(:dropped_letter).permit(:body)
  end
  
end
