class PrintStationsController < ApplicationController
  before_action :set_print_station, only: [:show, :edit, :update, :destroy]

  # GET /print_stations
  # GET /print_stations.json
  def index
    @print_stations = PrintStation.all
    @statuses = Status.all
  end

  # GET /print_stations/1
  # GET /print_stations/1.json
  def show
    @print_station = PrintStation.find(params[:id])
    @commentable = @print_station
    @comments = @commentable.comments
    @comment = Comment.new
    @ticketable = @print_station
    @tickets = @ticketable.tickets
    @ticket = Ticket.new
  end

  # GET /print_stations/new
  def new
    @print_station = PrintStation.new
  end

  # GET /print_stations/1/edit
  def edit
  end

  # POST /print_stations
  # POST /print_stations.json
  def create
    @print_station = PrintStation.new(print_station_params)

    respond_to do |format|
      if @print_station.save
        format.html { redirect_to @print_station, notice: 'Print station was successfully created.' }
        format.json { render action: 'show', status: :created, location: @print_station }
      else
        format.html { render action: 'new' }
        format.json { render json: @print_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_stations/1
  # PATCH/PUT /print_stations/1.json
  def update
    respond_to do |format|
      if @print_station.update(print_station_params)
        format.html { redirect_to @print_station, notice: 'Print station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @print_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_stations/1
  # DELETE /print_stations/1.json
  def destroy
    @print_station.destroy
    respond_to do |format|
      format.html { redirect_to print_stations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print_station
      @print_station = PrintStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_station_params
      params.require(:print_station).permit(:location_id, :location, :building, :room_number, :computer_jack, :printer_our_jack, :computer_our_jack, :strapped_down, :restricted_access, :key_code, :keyboard, :mouse, :touchpad, :monitor, :status_id, :copy_center_id)
    end
end
