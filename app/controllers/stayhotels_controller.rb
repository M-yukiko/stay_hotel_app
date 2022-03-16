class StayhotelsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @stayhotel = Stayhotel.new
  end
  
  def show
    @stayhotel = Stayhotel.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @stayhotel = Stayhotel.new(stayhotel_params)
    @stayhotel.user_id = current_user.id
    if @stayhotel.save
      redirect_to stayhotel_path(@stayhotel), notice: '登録に成功しました。'
    else
      render :new
    end
  end

  def edit
    @stayhotel = Stayhotel.find(params[:id])
    if @stayhotel.user != current_user
      redirect_to stayhotel_path, alert: '不正なアクセスです。'
    end
  end
  
  def update
    @stayhotel = Stayhotel.find(params[:id])
    if @stayhotel.update(stayhotel_params)
      redirect_to stayhotel_path(@stayhotel), notice: '更新に成功しました。'
    else
      render :edit
    end
  end
  
  def destroy
    stayhotel = Stayhotel.find(params[:id])
    stayhotel.destroy
    flash[:notice] = "物件を削除しました"
    redirect_to users_path
  end

  private

  def stayhotel_params
    params.require(:stayhotel).permit(:room_title, :room_intro, :room_price, :room_adress, :room_image)
  end

end
