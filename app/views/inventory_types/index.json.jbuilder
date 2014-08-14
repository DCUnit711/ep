json.array!(@inventory_types) do |inventory_type|
  json.extract! inventory_type, :id
  json.url inventory_type_url(inventory_type, format: :json)
end
