class CommentsController < ApplicationController
  def create
    # binding.pry()
    @comment = Comment.create(text: comment_params[:text], rent_house_id: comment_params[:rent_house_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to rent_house_path(id: comment_params[:rent_house_id]) }
      format.json
    end
  end

  private
  def comment_params
    params.permit(:text, :rent_house_id)
  end
end
