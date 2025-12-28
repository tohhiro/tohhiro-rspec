require 'calc'

RSpec.describe Calc do
  # describeにクラス名を与えた場合、subjectは自動的にそのクラスのインスタンスになる
  subject(:calc) { Calc.new } # インスタンス変数は使わず、letやsubjectを使うことが多い

  it {
    expect(calc.add(2,3)).to eq(5)
  }

  # let
  context "tax 5%" do
    let(:tax) {0.05} # letで変数を定義できる
    it { expect(calc.price(100, tax)).to eq(105.0) }
  end

  context "tax 8%" do
    let(:tax) {0.08}
    it { expect(calc.price(100, tax)).to eq(108.0) }
  end
end 