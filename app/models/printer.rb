class Printer < ActiveRecord::Base
  has_many :inventories
  has_many :tickets, as: :ticketable
  has_many :comments, as: :commentable
  belongs_to :ps_connection_information
  belongs_to :printer_model
  validates :serial_number, presence:true

  default_scope { order ('printers.printer_model_id ASC, printers.serial_number ASC') }

  COLORS = {
    color: 'Color',
    bw: 'B&W'
  }
end
