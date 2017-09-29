class Brand <ActiveRecord::Base
  has_many :sjoins
  has_many :stores, through: :sjoins
  validates(:brand_name, :presence => true, :length => {:maximum => 100})
  before_save(:cap_name)

  private
  def cap_name
    self.name=(name().split.map!{|w| w.capitalize}.join(" "))
  end
end
