class IssueReceivedMethodsController < ApplicationController
  before_action :set_issue_received_method, only: [:show, :edit, :update, :destroy]

  # GET /issue_received_methods
  # GET /issue_received_methods.json
  def index
    @issue_received_methods = IssueReceivedMethod.all
  end

  # GET /issue_received_methods/1
  # GET /issue_received_methods/1.json
  def show
  end

  # GET /issue_received_methods/new
  def new
    @issue_received_method = IssueReceivedMethod.new
  end

  # GET /issue_received_methods/1/edit
  def edit
  end

  # POST /issue_received_methods
  # POST /issue_received_methods.json
  def create
    @issue_received_method = IssueReceivedMethod.new(issue_received_method_params)

    respond_to do |format|
      if @issue_received_method.save
        format.html { redirect_to @issue_received_method, notice: 'Issue received method was successfully created.' }
        format.json { render action: 'show', status: :created, location: @issue_received_method }
      else
        format.html { render action: 'new' }
        format.json { render json: @issue_received_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_received_methods/1
  # PATCH/PUT /issue_received_methods/1.json
  def update
    respond_to do |format|
      if @issue_received_method.update(issue_received_method_params)
        format.html { redirect_to @issue_received_method, notice: 'Issue received method was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issue_received_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_received_methods/1
  # DELETE /issue_received_methods/1.json
  def destroy
    @issue_received_method.destroy
    respond_to do |format|
      format.html { redirect_to issue_received_methods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_received_method
      @issue_received_method = IssueReceivedMethod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_received_method_params
      params.require(:issue_received_method).permit(:method)
    end
end
