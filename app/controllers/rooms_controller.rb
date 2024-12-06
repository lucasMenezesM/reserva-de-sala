class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :set_rooms, only: [:index]

  # GET /rooms or /rooms.json
  def index
    authorize! :read, Room

    respond_to do |format|
      format.html
      format.pdf do
        authorize! :manage, Room
        render pdf: "Rooms Registered - #{Date.today}",
               template: "rooms/rooms",
               locals: {rooms: Room.all}
      end
    end
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    authorize! :read, Room
    @reservation = Reservation.new
    if current_user
      @reservations_made = current_user.get_reserved_rooms(@room)
    else
      @reservations_made = []
    end
  end

  # GET /rooms/new
  def new
    authorize! :create, Room
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    authorize! :update, Room
  end

  # POST /rooms or /rooms.json
  def create
    authorize! :create, Room
    
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    authorize! :update, Room

    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    authorize! :destroy, Room
    
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_path, status: :see_other, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search_rooms
  
    date = params.dig(:q, :date)
    time = params.dig(:q, :time)

    available_rooms = Room.available_rooms(date: date, time: time)

    @q = available_rooms.ransack(params[:q])
    @rooms = @q.result.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.js {render partial: "rooms/rooms"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def set_rooms
      @q = Room.paginate(page: params[:page], per_page: 10).ransack(params[:q])
      @rooms = @q.result(distinct: true)
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :building_id, :floor_id, :capacity)
    end
end
