class Brand <ActiveRecord::Base
  has_many :sjoins
  has_many :stores, through: :sjoins
  validates(:brand_name, {:presence => true, :length => {:maximum => 100}})
  before_save(:cap_brand_name)

  private
    def cap_brand_name
      self.brand_name=(brand_name().split.map!{|w| w.capitalize}.join(" "))
    end
end
