class CopyCentersController < ApplicationController
  before_action :set_copy_center, only: [:show, :edit, :update, :destroy]

  # GET /copy_centers
  # GET /copy_centers.json
  def index
    @copy_centers = CopyCenter.all
  end

  # GET /copy_centers/1
  # GET /copy_centers/1.json
  def show
  end

  # GET /copy_centers/new
  def new
    @copy_center = CopyCenter.new
  end

  # GET /copy_centers/1/edit
  def edit
  end

  # POST /copy_centers
  # POST /copy_centers.json
  def create
    @copy_center = CopyCenter.new(copy_center_params)

    respond_to do |format|
      if @copy_center.save
        format.html { redirect_to @copy_center, notice: 'Copy center was successfully created.' }
        format.json { render action: 'show', status: :created, location: @copy_center }
      else
        format.html { render action: 'new' }
        format.json { render json: @copy_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /copy_centers/1
  # PATCH/PUT /copy_centers/1.json
  def update
    respond_to do |format|
      if @copy_center.update(copy_center_params)
        format.html { redirect_to @copy_center, notice: 'Copy center was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @copy_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /copy_centers/1
  # DELETE /copy_centers/1.json
  def destroy
    @copy_center.destroy
    respond_to do |format|
      format.html { redirect_to copy_centers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_copy_center
      @copy_center = CopyCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def copy_center_params
      params.require(:copy_center).permit(:location, :phone_number, :email)
    end
end
