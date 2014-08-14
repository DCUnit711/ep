json.array!(@print_stations) do |print_station|
  json.extract! print_station, :id, :location_id, :location, :printer1_id, :printer1_ip, :printer1_jack, :printer1_pharos, :printer2_id, :printer2_ip, :printer2_jack, :printer2_pharos, :printer3_id, :printer3_ip, :printer3_jack, :printer3_pharos, :building, :room_number, :computer_id, :computer_jack, :printer_our_jack, :computer_our_jack, :strapped_down, :restricted_access, :key_code, :keyboard, :mouse, :touchpad, :monitor, :status
  json.url print_station_url(print_station, format: :json)
end
