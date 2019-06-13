class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :gender_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :gender_id])
  end

  def store_current_location
    store_location_for(:user, request.url)
  end

  def devise_or_home_controller?
    devise_controller? || controller_name == 'home'
  end

end
