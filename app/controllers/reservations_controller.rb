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

  def set_reservations
    @q = Reservation.paginate(page: params[:page], per_page: 10).ransack(params[:q])
    @reservations = @q.result(distinct: true)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
