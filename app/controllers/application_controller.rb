class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?







protected


#deviseのストロングパラメーターにカラム追加するメソッドを定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_status, :name, :username, :image_id, :uid, :provider, :email ])
  end

end
