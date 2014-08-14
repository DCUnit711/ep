json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :created_employee_id
  json.url ticket_url(ticket, format: :json)
end
