require('spec_helper')

describe(Sjoin) do
  it {should belong_to(:brand)}
  it {should belong_to(:store)}
end
