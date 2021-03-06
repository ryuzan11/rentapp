class RentHousesController < ApplicationController
  before_action :authenticate_user!, :except=>[:index, :show]
  before_action :set_renthouse, only: [:show ,:edit, :update]


  def index
    @renthouses = RentHouse.order("id DESC").page(params[:page]).per(5)
    @most_viewed = RentHouse.order('impressions_count DESC')
  end

  def show
    @user = User.find(@renthouse.user_id)
    @gender = Gender.find(@user.gender_id)
    @comments = @renthouse.comments.includes(:user)
    impressionist(@renthouse, nil, :unique => [:session_hash])
    @most_viewed = RentHouse.order('impressions_count DESC')
  end

  def new
    @renthouse = RentHouse.new
  end

  def create
    @renthouse = RentHouse.new(renthouse_params)

    if @renthouse.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @renthouse.update(renthouse_params)
        format.html { redirect_to root_path, notice: '物件情報を変更しました' }
        format.json { render :index, status: :ok, location: @renthouse }
      else
        format.html { render :edit }
        format.json { render json: @renthouse.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    renthouse = RentHouse.find(params[:id])
    renthouse.destroy
    redirect_to root_path
  end

  def get_cities
    cities = City.where( prefecture_id: params[:prefecture_id] )
    render json: cities
  end

  private

  def renthouse_params
    params.require(:rent_house).permit(:building_name, :rent, :city_id, :prefecture_id, :line_name, :station_name, :management_fee, :else_fee, :comment).merge(user_id: current_user.id)
  end

  def set_renthouse
    @renthouse = RentHouse.find(params[:id])
  end

end
