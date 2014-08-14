json.array!(@copy_centers) do |copy_center|
  json.extract! copy_center, :id, :location, :phone_number
  json.url copy_center_url(copy_center, format: :json)
end
