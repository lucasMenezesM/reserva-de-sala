class ReservationsController < ApplicationController
  def index
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(distinct: true)
  end
  
  def create
  end

  def destroy
  end

  def search_reservations
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(distinct: true)

    respond_to do |format|
      format.js {render partial: "reservations/reservations_js"}
    end
  end
end
