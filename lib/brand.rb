class Brand <ActiveRecord::Base
  has_many :sjoins
  has_many :stores, through: :sjoins
end
