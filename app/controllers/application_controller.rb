class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      items_path(resource)
    end







protected


#deviseのストロングパラメーターにカラム追加するメソッドを定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_status, :name, :username, :image_id, :uid, :provider, :email ])
  end

end
