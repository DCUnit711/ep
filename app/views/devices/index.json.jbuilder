json.array!(@devices) do |device|
  json.extract! device, :id, :type
  json.url device_url(device, format: :json)
end
