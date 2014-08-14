class InventoryType < ActiveRecord::Base
  has_many :inventories
end
