class ReservationsController < ApplicationController
  before_action :set_reservations, only: [:index, :search_reservations]
  before_action :set_reservation, only: [:destroy]

  def index
    authorize! :read, Reservation
    
    respond_to do |format|
      format.html
      format.pdf do
        authorize! :manage, Reservation
        render pdf: "Reservations Registered - #{Date.today}",
               template: "reservations/reservations",
               locals: {reservations: Reservation.all}
      end
    end
  end
  
  def create
    authorize! :create, Reservation

    month = params.dig(:reservation, :month)
    day = params.dig(:reservation, :day)
    hour = params.dig(:reservation, :hour)
    minutes = params.dig(:reservation, :minutes)
    year = Date.today.year

    date = "#{year}-#{month}-#{day}"
    time = "#{hour}:#{minutes}:#{00}"

    reserved_date = Date.new(year.to_i, month.to_i, day.to_i)

    if reserved_date < Date.today
      puts "invalid date"
      flash[:alert] = "Error: Choose a valid date to make your reservation!"
      redirect_to room_path(params[:room_id])
      return
    end

    room = Room.find_by(id: params[:room_id])

    if !room.is_available?(date, time)
      flash[:alert] = "This room is not available at the moment you choose"
      redirect_to room_path(params[:room_id])
      return
    end

    @reservation = Reservation.new(date: date, time:time, user: current_user, room: room)

    if @reservation.save
      flash[:notice] = "Reservation successfully created!"
    else
      flash[:alert] = "Error: An error has occurred while creating this reservation"
    end

    redirect_to room_path(params[:room_id])
  end

  def destroy
    authorize! :destroy, @reservation
  end

  def search_reservations
    respond_to do |format|
      format.js {render partial: "reservations/reservations_js"}
    end
  end

  private

  def reservations_params
    params.require(:reservation).permit(:time, :date, :user, :room)
  end

  def set_reservations
    @q = Reservation.paginate(page: params[:page], per_page: 10).ransack(params[:q])
    @reservations = @q.result(distinct: true)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
