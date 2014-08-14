json.array!(@computer_images) do |computer_image|
  json.extract! computer_image, :id, :image, :details
  json.url computer_image_url(computer_image, format: :json)
end
