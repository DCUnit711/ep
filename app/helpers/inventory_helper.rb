module InventoryHelper

  def nice_location(location)
    Inventory::LOCATIONS.fetch location.to_sym
  end

end
