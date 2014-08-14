json.array!(@printers) do |printer|
  json.extract! printer, :id, :serial_number, :model, :color_bw, :webjet_model
  json.url printer_url(printer, format: :json)
end
