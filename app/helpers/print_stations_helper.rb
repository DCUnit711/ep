module PrintStationsHelper

  def checked(input)
    if input == true
      return 'btn btn-primary active'
    else
      return 'btn btn-primary'
    end
  end

  def is_there(item)
    if item
      return 'glyphicon glyphicon-ok'
    else
      return 'glyphicon glyphicon-remove'
    end
  end

  def check_status(print_station)
    if print_station == 'Active'
      return 'panel-success'
    elsif print_station == 'Down'
      return 'panel-danger'
    elsif print_station == 'Removed'
      return 'panel-danger'
    else
      return 'panel-warning'
    end
  end

  def copy_center(print_station)
    if print_station.copy_center.nil?
      return "None Assigned"
    else
      html = link_to @print_station.copy_center.location, copy_center_path(@print_station.copy_center)
    end
  end

end
