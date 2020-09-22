class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_tops_top_path
    when User
      # Google認証 かつ 初回ログイン時のみプロフィール作成画面へ誘導
      if params[:action] == 'google_oauth2' && (Time.zone.now - current_user.created_at) < 10.seconds
        user_confirmation_path(current_user)
      else
        dropped_letter_path
      end
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
