class UsersController < ApplicationController
  before_action :authenticate_user!, :except=>[:index]

  def index
  end

  def show
    @user = User.find(params[:id])
    @gender = Gender.find(@user.gender_id)
    @renthouses = RentHouse.where(user_id: @user.id).order("id DESC")
    @like_rentHouses = @user.like_rentHouses
  end
end
