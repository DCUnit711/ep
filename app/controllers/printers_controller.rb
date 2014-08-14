class PrintersController < ApplicationController
  before_action :set_printer, only: [:show, :edit, :update, :destroy]

  # GET /printers
  # GET /printers.json
  def index
    @printers = Printer.all
  end

  # GET /printers/1
  # GET /printers/1.json
  def show
    @printer = Printer.find(params[:id])
    @commentable = @printer
    @comments = @commentable.comments
    @comment = Comment.new
    @ticketable = @printer
    @tickets = @ticketable.tickets
    @ticket = Ticket.new
  end

  # GET /printers/new
  def new
    @printer = Printer.new
  end

  # GET /printers/1/edit
  def edit
  end

  # POST /printers
  # POST /printers.json
  def create
    @printer = Printer.new(printer_params)

    respond_to do |format|
      if @printer.save
        format.html { redirect_to @printer, notice: 'Printer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @printer }
      else
        format.html { render action: 'new' }
        format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printers/1
  # PATCH/PUT /printers/1.json
  def update
    respond_to do |format|
      if @printer.update(printer_params)
        format.html { redirect_to @printer, notice: 'Printer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /printers/1
  # DELETE /printers/1.json
  def destroy
    @printer.destroy
    respond_to do |format|
      format.html { redirect_to printers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_printer
      @printer = Printer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def printer_params
      params.require(:printer).permit(:serial_number, :printer_model_id, :color_bw, :webjet_model, :print_station_id, :ps_connection_information_id)
    end
end