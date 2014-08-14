class PsConnectionInformation < ActiveRecord::Base
  belongs_to :print_station
  has_one :printer

  default_scope { order ('ps_connection_informations.print_station_id ASC, ps_connection_informations.ip_address ASC') }

end
