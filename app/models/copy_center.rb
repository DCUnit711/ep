class CopyCenter < ActiveRecord::Base
	has_many :employees
  has_many :print_stations
end
