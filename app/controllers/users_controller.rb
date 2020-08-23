class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user

  def edit
  end

  def show
  end

  def unsubscribe
  end

  def update
  end


private

def set_user
	@user = User.find(params[:id])
end

def user_params
	params.require(:user).permit(:is_status, :name, :username, :image_id, :uid, :provider)
end

end
