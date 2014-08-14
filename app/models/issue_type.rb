class IssueType < ActiveRecord::Base
  belongs_to :device
  has_many :ticket_issues

  default_scope { order ('issue_types.device_id ASC, issue_types.issue ASC') }

end
