json.array!(@passdowns) do |passdown|
  json.extract! passdown, :id, :body, :employee_id
  json.url passdown_url(passdown, format: :json)
end
