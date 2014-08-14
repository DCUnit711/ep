json.array!(@printer_models) do |printer_model|
  json.extract! printer_model, :id, :model, :service_code, :black, :cyan, :magenta, :yellow, :fuser, :maint_kit, :transfer_kit, :collection_unit
  json.url printer_model_url(printer_model, format: :json)
end
