class PsConnectionInformationsController < ApplicationController
  before_action :set_ps_connection_information, only: [:show, :edit, :update, :destroy]

  # GET /ps_connection_informations
  # GET /ps_connection_informations.json
  def index
    @ps_connection_informations = PsConnectionInformation.all
  end

  # GET /ps_connection_informations/1
  # GET /ps_connection_informations/1.json
  def show
  end

  # GET /ps_connection_informations/new
  def new
    @ps_connection_information = PsConnectionInformation.new
  end

  # GET /ps_connection_informations/1/edit
  def edit
  end

  # POST /ps_connection_informations
  # POST /ps_connection_informations.json
  def create
    @ps_connection_information = PsConnectionInformation.new(ps_connection_information_params)

    respond_to do |format|
      if @ps_connection_information.save
        format.html { redirect_to @ps_connection_information, notice: 'Ps connection information was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ps_connection_information }
      else
        format.html { render action: 'new' }
        format.json { render json: @ps_connection_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ps_connection_informations/1
  # PATCH/PUT /ps_connection_informations/1.json
  def update
    respond_to do |format|
      if @ps_connection_information.update(ps_connection_information_params)
        format.html { redirect_to @ps_connection_information, notice: 'Ps connection information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ps_connection_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ps_connection_informations/1
  # DELETE /ps_connection_informations/1.json
  def destroy
    @ps_connection_information.destroy
    respond_to do |format|
      format.html { redirect_to ps_connection_informations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ps_connection_information
      @ps_connection_information = PsConnectionInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ps_connection_information_params
      params.require(:ps_connection_information).permit(:print_station_id, :ip_address, :jack, :pharos)
    end
end
