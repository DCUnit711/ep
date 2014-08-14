class PrinterModel < ActiveRecord::Base
  has_many :printers
  has_many :inventories
  validates :model, presence:true
end
