class FloorsController < ApplicationController
  before_action :set_floor, only: %i[ show edit update destroy ]
  before_action :set_floors, only: [:index, :search_floors]

  # GET /floors or /floors.json
  def index
    authorize! :read, Room

    respond_to do |format|
      format.html
      format.pdf do
        authorize! :manage, Room
        render pdf: "Floors Registered - #{Date.today}",
               template: "floors/floors",
               locals: {floors: Floor.all}
      end
    end
  end

  def search_floors
    respond_to do |format|
      format.js {render partial: "floors/floors"}
    end
  end

  # GET /floors/1 or /floors/1.json
  def show
  end

  # GET /floors/new
  def new
    @floor = Floor.new
  end

  # GET /floors/1/edit
  def edit
  end

  # POST /floors or /floors.json
  def create
    @floor = Floor.new(floor_params)

    respond_to do |format|
      if @floor.save
        format.html { redirect_to @floor, notice: "Floor was successfully created." }
        format.json { render :show, status: :created, location: @floor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @floor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /floors/1 or /floors/1.json
  def update
    respond_to do |format|
      if @floor.update(floor_params)
        format.html { redirect_to @floor, notice: "Floor was successfully updated." }
        format.json { render :show, status: :ok, location: @floor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @floor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floors/1 or /floors/1.json
  def destroy
    @floor.destroy

    respond_to do |format|
      format.html { redirect_to floors_path, status: :see_other, notice: "Floor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floor
      @floor = Floor.find(params[:id])
    end

    def set_floors
      @q = Floor.paginate(page: params[:page], per_page: 10).ransack(params[:q])
      @floors = @q.result(distinct: true)
    end

    # Only allow a list of trusted parameters through.
    def floor_params
      params.require(:floor).permit(:name)
    end
end
