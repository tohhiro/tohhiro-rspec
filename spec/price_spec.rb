require 'calc'

RSpec.describe Calc do
  # describeにクラス名を与えた場合、subjectは自動的にそのクラスのインスタンスになる
  subject(:calc) { Calc.new } # インスタンス変数は使わず、letやsubjectを使うことが多い

  it {
    expect(calc.add(2,3)).to eq(5)
  }

  # let
  # 注意点: 
  # - example毎に結果がキャッシュされるため、example内で値を変更しても次のexampleには影響しない
  # - 遅延評価されるため、実際に使われるまで評価されない
  context "tax 5%" do
    let(:tax) {0.05} # letで変数を定義できる
    it { expect(calc.price(100, tax)).to eq(105.0) }
  end

  context "tax 8%" do
    let!(:tax) {0.08} # let!で即時評価される
    it { expect(calc.price(100, tax)).to eq(108.0) }
  end
end 