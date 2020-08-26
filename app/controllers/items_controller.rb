class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
    @item = Item.new
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

  def download
    @item = Item.find(params[:id])
    # ref: https://github.com/carrierwaveuploader/carrierwave#activerecord
    filepath = @item.file.current_path
    send_file(filepath.to_s, :filename => @item.file_identifier)
  end


  def show
    @item = Item.find(params[:id])
    @newitem = Item.new
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to item_path
  end
  
  private

  def item_params
    params.require(:item).permit(:id,:user_id,:title,:text,:file,:audio)
  end
end

