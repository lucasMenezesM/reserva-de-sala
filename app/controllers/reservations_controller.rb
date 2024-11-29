class ReservationsController < ApplicationController
  before_action :set_reservations, only: [:index, :search_reservations]
  
  def index
  end
  
  def create
  end

  def destroy
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
end
