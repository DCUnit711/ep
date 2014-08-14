class AdminController < ApplicationController
  def index
    @copy_centers = CopyCenter.all
    @toner_locations = Location.all
    @computer_models = ComputerModel.all
    @computer_images = ComputerImage.all
    @printer_models = PrinterModel.all
    @employees = Employee.all
    @ps_connection_informations = PsConnectionInformation.all
    @devices = Device.all
    @issue_received_methods = IssueReceivedMethod.all
    @issue_types = IssueType.all
    @statuses = Status.all
    @inventory_types = InventoryType.all
  end
end