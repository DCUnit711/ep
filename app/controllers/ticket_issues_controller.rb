class TicketIssuesController < ApplicationController
  before_action :set_ticket_issue, only: [:show, :edit, :update, :destroy]
  before_filter :load_ticketable

  # GET /ticket_issues
  # GET /ticket_issues.json
  def index
    @ticket_issues = TicketIssue.all
  end

  # GET /ticket_issues/1
  # GET /ticket_issues/1.json
  def show
    @ticket_issue = TicketIssue.find(params[:id])
    @commentable = @ticket_issue
    @comments = @commentable.comments
    @comment = Comment.new
  end

  # GET /ticket_issues/new
  def new
    @ticket_issue = TicketIssue.new
  end

  # GET /ticket_issues/1/edit
  def edit
  end

  # POST /ticket_issues
  # POST /ticket_issues.json
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @ticket_issue = @ticket.ticket_issues.create(ticket_issue_params)

    respond_to do |format|
      if @ticket_issue.save
        format.html { redirect_to :back, notice: 'Ticket issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticketable }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_issues/1
  # PATCH/PUT /ticket_issues/1.json
  def update
    respond_to do |format|
      if @ticket_issue.update(ticket_issue_params)
        format.html { redirect_to :back, notice: 'Ticket issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_issues/1
  # DELETE /ticket_issues/1.json
  def destroy
    # @ticket = Ticket.find(params[:ticket_id])
    # @ticket_issue = @ticket.ticket_issues.find(params[:id])
    @ticket_issue.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_issue
      @ticket_issue = TicketIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_issue_params
      params.require(:ticket_issue).permit(:ticket_id, :issue_type_id, :description, :issue_received_method_id, :resolution_notes, :resolved_employee_id, :resolved_at, :issue_severity)
    end

    def load_ticketable
      resource, id = request.path.split('/')[ 1, 2 ]
      @ticketable = resource.singularize.classify.constantize.find(id)
    end

end
