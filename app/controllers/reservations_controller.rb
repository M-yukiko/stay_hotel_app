class ReservationsController < ApplicationController
	before_action :authenticate_user!
	before_action :permit_params, only: [:new, :confirm]
	before_action :stayhotel_deta_get, only: [:confirm, :complete]
	
	def index
		@reservations = Reservation.all
	end

	def new
		session.delete(:reservation)
		@reservation = Reservation.new
	end

	def back
		@reservation = Reservation.new(session[:reservation])
		session.delete(:reservation)
		redirect_to stayhotel_path
	end

	def confirm
		@reservation = current_user.reservations.new(@attr)
		@reservation.stayhotel_id = @stayhotel.id
		@people_num = @reservation["people_num"]
		start_date = @reservation["start_date"]
		end_date = @reservation["end_date"]
		@reservation.days = (end_date-start_date).to_i
		room_price = @stayhotel.room_price
		@reservation.sum_price = @reservation.days*room_price*@people_num
		session[:reservation] = @reservation
		
		if @reservation.days <= 0
			redirect_to request.referer, notice: "終了日は開始日より後の日付で設定してください。"
		elsif start_date <= Date.today
			redirect_to request.referer, notice: "本日以降の日付を選択してください"
		end
	end

	def complete
		@reservation = Reservation.create(session[:reservation])
		session.delete(:reservation)
	end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to reservations_path
  end


	private

	def permit_params
		@attr = params.require('reservation').permit(:id,:start_date, :end_date, :people_num, :sum_price)
	end
	
	def stayhotel_deta_get
		@stayhotel = Stayhotel.find(params[:id])
	end
end
