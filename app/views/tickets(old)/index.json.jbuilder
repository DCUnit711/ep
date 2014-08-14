json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :created_employee_id, :completed_employee_id, :completed_at, :issue_received_method_id
  json.url ticket_url(ticket, format: :json)
end
