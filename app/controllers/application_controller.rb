class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Admins
      admins_top_url
    when User
      dropped_letter_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[:name])
  end
end
