require 'calc_advanced'

RSpec.shared_examples "basic arithmetic operations" do
  it "multiplies two numbers" do
    expect(subject.multiply(4, 5)).to eq(20)
  end

  it "divides two numbers" do
    expect(subject.divide(10, 2)).to eq(5.0)
  end

  it "returns nil when dividing by zero" do
    expect(subject.divide(10, 0)).to be_nil
  end
end

RSpec.describe Calc_advanced do
  context "normal operations" do
    include_examples "basic arithmetic operations"
  end
  context "expert operations" do
    include_examples "basic arithmetic operations"
    it "exists multiply method"
    it "exists divide method"
  end
end