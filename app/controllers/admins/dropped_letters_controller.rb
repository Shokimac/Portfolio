class Admins::DroppedLettersController < ApplicationController
  def index
    @new_letter = DroppedLetter.new
    @letters = DroppedLetter.all.page(params[:page]).reverse_order
  end

  def create

  end

  def edit
  end

  def update

  end

  def destroy

  end
  
end
