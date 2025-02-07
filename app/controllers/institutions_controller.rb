class InstitutionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_institution, only: %i[ show edit update destroy ]
  skip_before_action :is_institution_selected?

  # GET /institutions or /institutions.json
  def index
    authorize! :read, Institution
    @institutions = Institution.all
  end

  def manage
    authorize! :manage, Institution
    @q = Institution.all.paginate(page: params[:page], per_page: 10).ransack(params[:q])
    @institutions = @q.result(distinct: true)
  end

  # GET /institutions/1 or /institutions/1.json
  def show
    authorize! :read, Institution
  end

  # GET /institutions/new
  def new
    authorize! :create, Institution
    @institution = Institution.new
  end

  # GET /institutions/1/edit
  def edit
    authorize! :update, Institution
  end

  # POST /institutions or /institutions.json
  def create
    authorize! :create, Institution

    @institution = Institution.new(institution_params)

    respond_to do |format|
      if @institution.save
        format.html { redirect_to @institution, notice: "Institution was successfully created." }
        format.json { render :show, status: :created, location: @institution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institutions/1 or /institutions/1.json
  def update
    authorize! :update, Institution

    respond_to do |format|
      if @institution.update(institution_params)
        format.html { redirect_to @institution, notice: "Institution was successfully updated." }
        format.json { render :show, status: :ok, location: @institution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutions/1 or /institutions/1.json
  def destroy
    authorize! :destroy, Institution

    @institution.destroy

    respond_to do |format|
      format.html { redirect_to institutions_path, status: :see_other, notice: "Institution was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def select_institution
    institution_id = params[:institution_id]
    selected_institution = Institution.find_by(id: institution_id) 
    current_user.institution = selected_institution if selected_institution.present?
    
    if current_user.institution.present? && current_user.save
      flash[:notice] = "Institution #{selected_institution.name} Successfully Selected"
      redirect_to root_path
    else
      flash.now[:alert] = "Error selecting institution #{selected_institution.name}"
      render institutions_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institution
      @institution = Institution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def institution_params
      params.require(:institution).permit(:name, :address, :contact)
    end
end
