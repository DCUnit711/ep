class WelcomeController < ApplicationController

  def index
    @computer_images = ComputerImage.all
    @computer_models = ComputerModel.all
    @computers = Computer.all
    @copy_centers = CopyCenter.all
    @employees = Employee.all
    @inventories = Inventory.all
    @toner_locations = Location.all
    @print_stations = PrintStation.all
    @printer_models = PrinterModel.all
    @printers = Printer.all
    @ps_connection_informations = PsConnectionInformation.all
    @statuses = Status.all
    @passdowns = Passdown.all
    @tickets = Ticket.all
  end
end
