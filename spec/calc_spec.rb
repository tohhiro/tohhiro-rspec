require 'calc' # rspecでは、require_relativeは使わないことが多い


RSpec.describe "A calc" do
  before do
    @calc = Calc.new
  end

  it "given 2 and 3, return 5" do
    expect(@calc.add(2,3)).to eq(5)
  end

  it "given 5 and 8, return 13" do
    expect(@calc.add(5, 8)).to eq(13)
  end
end