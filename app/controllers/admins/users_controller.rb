class Admins::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).reverse_order
  end

  def show
  end

  def withdrawal

  end

  def withdrawal_update
    
  end
end
