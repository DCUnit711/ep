json.array!(@computers) do |computer|
  json.extract! computer, :id, :service_tag, :model, :image_date, :vga_dvi
  json.url computer_url(computer, format: :json)
end
