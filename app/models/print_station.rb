class PrintStation < ActiveRecord::Base
  has_many :printers, through: :ps_connection_informations
  has_many :ps_connection_informations
  has_many :inventories, through: :printers
  has_one :computer
  has_many :tickets, as: :ticketable
  has_many :comments, as: :commentable
  belongs_to :status, class_name: 'Status', foreign_key: 'status_id'
  belongs_to :copy_center
  validates_presence_of :location_id, :location

  default_scope { order ('print_stations.location_id ASC') }

end
