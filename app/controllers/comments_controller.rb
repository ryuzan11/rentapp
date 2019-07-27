class CommentsController < ApplicationController
  def create
    @comment = Comment.new(text: comment_params[:text], rent_house_id: comment_params[:rent_house_id], user_id: current_user.id)
    if @comment.save
      respond_to do |format|
        # format.html { redirect_to rent_house_path(id: comment_params[:rent_house_id]) }
        format.json
      end
    else
      render json: @comment.error, status: :unprocessable_entity
    end
    # binding.pry()
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: rent_house_path(comment_params[:rent_house_id]))
  end

  private
  def comment_params
    params.permit(:text, :rent_house_id)
  end
end
