class Passdown < ActiveRecord::Base
  belongs_to :employee

  default_scope { order ('passdowns.created_at DESC') }

end
