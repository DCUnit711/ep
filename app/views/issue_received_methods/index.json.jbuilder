json.array!(@issue_received_methods) do |issue_received_method|
  json.extract! issue_received_method, :id, :method
  json.url issue_received_method_url(issue_received_method, format: :json)
end
