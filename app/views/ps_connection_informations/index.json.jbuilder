json.array!(@ps_connection_informations) do |ps_connection_information|
  json.extract! ps_connection_information, :id, :print_station_id, :ip_address, :jack, :pharos
  json.url ps_connection_information_url(ps_connection_information, format: :json)
end
