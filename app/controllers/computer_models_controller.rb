class ComputerModelsController < ApplicationController
  before_action :set_computer_model, only: [:show, :edit, :update, :destroy]

  # GET /computer_models
  # GET /computer_models.json
  def index
    @computer_models = ComputerModel.all
  end

  # GET /computer_models/1
  # GET /computer_models/1.json
  def show
  end

  # GET /computer_models/new
  def new
    @computer_model = ComputerModel.new
  end

  # GET /computer_models/1/edit
  def edit
  end

  # POST /computer_models
  # POST /computer_models.json
  def create
    @computer_model = ComputerModel.new(computer_model_params)

    respond_to do |format|
      if @computer_model.save
        format.html { redirect_to @computer_model, notice: 'Computer model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @computer_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @computer_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computer_models/1
  # PATCH/PUT /computer_models/1.json
  def update
    respond_to do |format|
      if @computer_model.update(computer_model_params)
        format.html { redirect_to @computer_model, notice: 'Computer model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @computer_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computer_models/1
  # DELETE /computer_models/1.json
  def destroy
    @computer_model.destroy
    respond_to do |format|
      format.html { redirect_to computer_models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer_model
      @computer_model = ComputerModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_model_params
      params.require(:computer_model).permit(:model)
    end
end
