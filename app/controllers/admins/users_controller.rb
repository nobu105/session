class Admins::UsersController < ApplicationController

  def edit
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "会員情報が更新されました"
       redirect_to admins_user_path(@user)
    else
      flash[:notice] = "会員情報の更新ができませんでした"
      render :edit
    end
  end


  private

  def user_params
	params.require(:user).permit(:is_status, :name, :username, :image, :uid, :provider, :email, :audio)
  end
end
