class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  #nicknameを許可するstrong parametersの設定
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end