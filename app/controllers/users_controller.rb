class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :baria_user, only: [:edit,:update,:unsubscribe]


  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

  def unsubscribe
  end

  def update
  	@user = User.find(params[:id])
  	if
  	  @user.update(user_params)
  	  redirect_to user_path(@user.id)
  	else
  	  render "edit"
  	end
  end


private

def set_user
	@user = User.find(params[:id])
end

def user_params
	params.require(:user).permit(:is_status, :name, :username, :image, :uid, :provider, :email, :audio)
end

#url直接防止　メソッドを自己定義してbefore_actionで発動。
  def baria_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
