class TicketIssue < ActiveRecord::Base
  belongs_to :tickets
  belongs_to :issue_type
  belongs_to :issue_received_method
  has_many :comments, as: :commentable
  belongs_to :resolved, class_name: 'Employee', foreign_key: 'resolved_employee_id'

  validates :issue_type_id, presence: true
  validates :issue_received_method_id, presence: true

  # LEVELS = {
  #   high: 'High'
  #   normal: 'Normal'
  #   low: 'Low'
  # }
end
