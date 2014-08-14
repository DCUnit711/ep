module CopyCentersHelper

  def print_station_status(print_station)
    if print_station.status.status == "Active"
      return 'success'
    elsif print_station.status.status == "Down"
      return 'danger'
    else
      return 'warning'
    end
  end
end
