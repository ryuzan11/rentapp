class CommentsController < ApplicationController
  def create
    # binding.pry()
    Comment.create(text: comment_params[:text], rent_house_id: comment_params[:rent_house_id], user_id: current_user.id)
    redirect_to rent_house_path(id: comment_params[:rent_house_id])
  end

  private
  def comment_params
    params.permit(:text, :rent_house_id)
  end
end
