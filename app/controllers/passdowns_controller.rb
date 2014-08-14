class PassdownsController < ApplicationController
  before_action :set_passdown, only: [:show, :edit, :update, :destroy]

  # GET /passdowns
  # GET /passdowns.json
  def index
    @passdowns = Passdown.all
  end

  # GET /passdowns/1
  # GET /passdowns/1.json
  def show
  end

  # GET /passdowns/new
  def new
    @passdown = Passdown.new
  end

  # GET /passdowns/1/edit
  def edit
  end

  # POST /passdowns
  # POST /passdowns.json
  def create
    @passdown = Passdown.new(passdown_params)

    respond_to do |format|
      if @passdown.save
        format.html { redirect_to @passdown, notice: 'Passdown was successfully created.' }
        format.json { render action: 'show', status: :created, location: @passdown }
      else
        format.html { render action: 'new' }
        format.json { render json: @passdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passdowns/1
  # PATCH/PUT /passdowns/1.json
  def update
    respond_to do |format|
      if @passdown.update(passdown_params)
        format.html { redirect_to @passdown, notice: 'Passdown was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @passdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passdowns/1
  # DELETE /passdowns/1.json
  def destroy
    @passdown.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passdown
      @passdown = Passdown.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passdown_params
      params.require(:passdown).permit(:body, :employee_id)
    end
end
