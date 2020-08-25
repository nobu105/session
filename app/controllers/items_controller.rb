class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save!
       redirect_to items_path
    else
       render "new"
    end
  end


  def show
  end

  def edit
  end
  
  private

  def item_params
    params.require(:item).permit(:user_id,:title,:text,:file,:audio)
  end
end

