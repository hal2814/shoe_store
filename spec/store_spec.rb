require('spec_helper')

describe(Store) do
  it("validates presence of store name") do
      test_store = Store.new({:store_name => ""})
      expect(test_store.save()).to(eq(false))
  end

  it("uppercase each word input for store name") do
      test_store = Store.new({:store_name => "jungle shoes"})
      test_store.save()
      expect(test_store.store_name()).to(eq("Jungle Shoes"))
  end

  it { should have_many(:brands) }
end
