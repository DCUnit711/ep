class IssueReceivedMethod < ActiveRecord::Base
  has_many :ticket_issues
end
