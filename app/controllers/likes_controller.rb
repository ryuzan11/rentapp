class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @renthouse = RentHouse.find(params[:renthouse_id])
    @likes_id = @renthouse.likes.where(user_id: current_user.id)
    unless @renthouse.fav?(current_user)
      @renthouse.fav(current_user)
      @renthouse.reload
      @likes_id.reload
      respond_to do |format|
        # format.html { redirect_to request.referrer || root_path}
        format.json
      end
    end
  end

  def destroy
    @renthouse = Like.find(params[:id]).rent_house
    if @renthouse.fav?(current_user)
      @renthouse.unfav(current_user)
      @renthouse.reload
      respond_to do |format|
        # format.html { redirect_to request.referrer || root_path}
        format.json
      end
    end
  end

end
