class PrinterModelsController < ApplicationController
  before_action :set_printer_model, only: [:show, :edit, :update, :destroy]

  # GET /printer_models
  # GET /printer_models.json
  def index
    @printer_models = PrinterModel.all
  end

  # GET /printer_models/1
  # GET /printer_models/1.json
  def show
  end

  # GET /printer_models/new
  def new
    @printer_model = PrinterModel.new
  end

  # GET /printer_models/1/edit
  def edit
  end

  # POST /printer_models
  # POST /printer_models.json
  def create
    @printer_model = PrinterModel.new(printer_model_params)

    respond_to do |format|
      if @printer_model.save
        format.html { redirect_to @printer_model, notice: 'Printer model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @printer_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @printer_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printer_models/1
  # PATCH/PUT /printer_models/1.json
  def update
    respond_to do |format|
      if @printer_model.update(printer_model_params)
        format.html { redirect_to @printer_model, notice: 'Printer model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @printer_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /printer_models/1
  # DELETE /printer_models/1.json
  def destroy
    @printer_model.destroy
    respond_to do |format|
      format.html { redirect_to printer_models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_printer_model
      @printer_model = PrinterModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def printer_model_params
      params.require(:printer_model).permit(:model, :service_code, :black, :cyan, :magenta, :yellow, :fuser, :maint_kit, :transfer_kit, :collection_unit)
    end
end
