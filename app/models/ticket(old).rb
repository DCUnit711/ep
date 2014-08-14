class Ticket < ActiveRecord::Base
  belongs_to :created, class_name: 'Employee', foreign_key: 'created_employee_id'
  belongs_to :completed, class_name: 'Employee', foreign_key: 'completed_employee_id'
  belongs_to :ticketable, polymorphic: true
  belongs_to :issue_received_method
  has_many :ticket_issues
  has_many :comments, as: :commentable

  accepts_nested_attributes_for :ticket_issues, :allow_destroy => true
end
