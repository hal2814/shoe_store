require('spec_helper')

describe(Brand) do
  it("validates presence of brand name") do
      test_brand = Brand.new({:brand_name => ""})
      expect(test_brand.save()).to(eq(false))
  end

  it("uppercase each word input for brand name") do
      test_brand = Brand.new({:brand_name => "nike"})
      test_brand.save()
      expect(test_brand.brand_name()).to(eq("Nike"))
  end

  it { should have_many(:stores) }
end
