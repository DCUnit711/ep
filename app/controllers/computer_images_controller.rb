class ComputerImagesController < ApplicationController
  before_action :set_computer_image, only: [:show, :edit, :update, :destroy]

  # GET /computer_images
  # GET /computer_images.json
  def index
    @computer_images = ComputerImage.all
  end

  # GET /computer_images/1
  # GET /computer_images/1.json
  def show
  end

  # GET /computer_images/new
  def new
    @computer_image = ComputerImage.new
  end

  # GET /computer_images/1/edit
  def edit
  end

  # POST /computer_images
  # POST /computer_images.json
  def create
    @computer_image = ComputerImage.new(computer_image_params)

    respond_to do |format|
      if @computer_image.save
        format.html { redirect_to @computer_image, notice: 'Computer image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @computer_image }
      else
        format.html { render action: 'new' }
        format.json { render json: @computer_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computer_images/1
  # PATCH/PUT /computer_images/1.json
  def update
    respond_to do |format|
      if @computer_image.update(computer_image_params)
        format.html { redirect_to @computer_image, notice: 'Computer image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @computer_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computer_images/1
  # DELETE /computer_images/1.json
  def destroy
    @computer_image.destroy
    respond_to do |format|
      format.html { redirect_to computer_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer_image
      @computer_image = ComputerImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_image_params
      params.require(:computer_image).permit(:image, :details)
    end
end
