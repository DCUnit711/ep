class Computer < ActiveRecord::Base
  validates :service_tag, presence:true
  belongs_to :computer_image
  belongs_to :computer_model
  belongs_to :print_station
  has_many :tickets, as: :ticketable
  has_many :comments, as: :commentable
end
