class Inventory < ActiveRecord::Base
  belongs_to :printer
  belongs_to :location
  belongs_to :printer_model
  belongs_to :inventory_type
  
	validates :inventory_type_id, presence: true
	validates :location, presence: true

  LOCATIONS = {
    jfsbcc: 'JFSB CC',
    cougarcreations: 'Cougar Creations',
    upb: 'UPB', 
    intransit: 'In Transit'
  }
end
