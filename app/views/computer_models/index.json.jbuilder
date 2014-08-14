json.array!(@computer_models) do |computer_model|
  json.extract! computer_model, :id, :model
  json.url computer_model_url(computer_model, format: :json)
end
