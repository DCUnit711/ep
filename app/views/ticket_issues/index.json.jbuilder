json.array!(@ticket_issues) do |ticket_issue|
  json.extract! ticket_issue, :id, :ticket_id, :issue_type_id, :description, :issue_received_method_id
  json.url ticket_issue_url(ticket_issue, format: :json)
end
