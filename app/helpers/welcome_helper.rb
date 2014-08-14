module WelcomeHelper

  def up_stations
    result = PrintStation.where(status_id: '1').count.to_f / PrintStation.count.to_f  * 100
    
    "#{ result.round.to_s }"
  end

  def down_stations
    result = PrintStation.where(status_id: '2').count.to_f / PrintStation.count.to_f  * 100
    
    "#{ result.round.to_s }"
  end
end
