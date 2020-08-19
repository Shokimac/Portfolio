class Admins::DroppedLettersController < ApplicationController
  def index
    @new_letter = DroppedLetter.new
    @letters = DroppedLetter.all.page(params[:page]).reverse_order
  end

  def create
    @letter = DroppedLetter.new(letter_params)
    @letter.save
    redirect_to admins_dropped_letters_path
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def letter_params
    params.require(:dropped_letter).permit(:body)
  end
  
end
