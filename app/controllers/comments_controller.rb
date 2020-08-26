class CommentsController < ApplicationController

  def create
  	@item = Item.find(params[:item_id])
  	@comment = Comment.new(comment_params)
  	@comment.user_id = current_user.id
  	@comment.item_id = @item.id
  	if @comment.save
       redirect_to item_path(@item)
    else
       redirect_to items_path(@item)
    end
  end

  def destroy
  	@item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to item_path(@item)
  end


  private

  def comment_params
    params.require(:comment).permit(:item_id, :user_id, :comment)
  end

end
