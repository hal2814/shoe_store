class Store <ActiveRecord::Base
  has_many :sjoins
  has_many :brands, through: :sjoins
  validates(:store_name, :presence => true, :length => {:maximum => 100})
  before_save(:cap_name)

  private
  def cap_name
    self.name=(name().split.map!{|w| w.capitalize}.join(" "))
  end
end
