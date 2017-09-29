class Store <ActiveRecord::Base
  has_many :sjoins
  has_many :brands, through: :sjoins
end
