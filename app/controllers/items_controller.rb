class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
    @item = Item.new
    @search_items = Item.all.page(params[:page]).search(params[:search])
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
    #filepath = "https://rails-item1.s3-ap-northeast-1.amazonaws.com/"+@item.file.current_path
    #send_file(URI.encode(filepath.to_s))
    #require 'aws-sdk'

    #s3 = Aws::S3::Resource.new(region: 'ap-northeast-1')

    # Create the object to retrieve
    #obj = s3.bucket('rails-item1').object(@item.file.current_path)

    # Get the item's content and save it to a file
    #obj.get(response_target: './hoge')
    #hoge = obj.download_file(@item.file.identifier)
    #obj.get(response_target: "./"+@item.file.identifier)
    filepath = "https://rails-item1.s3-ap-northeast-1.amazonaws.com/"+@item.file.current_path
    data = open(URI.encode(filepath))
    send_data data.read, filename: @item.file.identifier, type: "application/wav", disposition: 'inline', stream: 'true', buffer_size: '40960'
    #redirect_to items_path
    #stat = File::stat(filepath)
    #send_file(filepath, :filename => '@item.file.identifier', :length => stat.size)
  end


  def show
    @item = Item.find(params[:id])
    @newitem = Item.new
    @comment = Comment.new
    @search_items = Item.all.page(params[:page]).search(params[:search])
  end

  def edit
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:id,:user_id,:title,:text,:file,:audio,:serch, { :tag_ids=> [] })
  end
end

