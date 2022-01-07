class VinosController < ApplicationController
  before_action :set_vino, only: %i[ show edit update destroy ]

  # GET /vinos or /vinos.json
  def index
    @vinos = Vino.all
  end

  # GET /vinos/1 or /vinos/1.json
  def show
  end

  # GET /vinos/new
  def new
    @vino = Vino.new
  end

  # GET /vinos/1/edit
  def edit
  end

  # POST /vinos or /vinos.json
  def create
    @vino = Vino.new(name: vino_params[:name])

    respond_to do |format|
      if @vino.save
        vino_params[:cepa_ids].reject(&:empty?).each_with_index do |id, index|
          CepaVino.create!(vino_id: @vino.id, cepa_id: id, percentage: vino_params[:percentages][index])
        end
        format.html { redirect_to vino_url(@vino), notice: "Vino was successfully created." }
        format.json { render :show, status: :created, location: @vino }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinos/1 or /vinos/1.json
  def update
    respond_to do |format|
      if @vino.update(vino_params)
        format.html { redirect_to vino_url(@vino), notice: "Vino was successfully updated." }
        format.json { render :show, status: :ok, location: @vino }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinos/1 or /vinos/1.json
  def destroy
    @vino.destroy

    respond_to do |format|
      format.html { redirect_to vinos_url, notice: "Vino was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vino
      @vino = Vino.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vino_params
      params.require(:vino).permit(:name, cepa_ids: [], percentages: [])
    end
end
