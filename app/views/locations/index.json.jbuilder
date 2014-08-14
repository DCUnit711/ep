json.array!(@locations) do |location|
  json.extract! location, :id, :location, :phone_number
  json.url location_url(location, format: :json)
end
