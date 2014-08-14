class Ticket < ActiveRecord::Base
  belongs_to :ticketable, polymorphic: true
  belongs_to :created, class_name: 'Employee', foreign_key: 'created_employee_id'
  has_many :ticket_issues, dependent: :destroy
  has_many :comments, as: :commentable

  validates :created_employee_id, presence: true

  accepts_nested_attributes_for :ticket_issues, :allow_destroy => true

  default_scope { order ('tickets.id DESC') }


end
