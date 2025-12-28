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

  # test double
  # method stub
  context "test double" do
    it "returns name with result" do
      user = double('user') # doubleでtest doubleを作成できる（書かなくても良いが、名前を付けるとエラーメッセージがわかりやすくなる）
      allow(user).to receive(:name).and_return('Alice') # allow...to receiveでmethod stubを設定できる
      # user.name -> Aliceを返すように設定している
      expect(calc.add_name(10, 20, user.name)).to eq('30 by Alice') # user.nameは'Alice'を返す
    end
  end

  # test double
  # method expectation（呼ばれなかったら失敗する）
  context "test double with method expectation" do
    it "expects log method to be called" do
      logger = double('logger')
      expect(logger).to receive(:log)
      calc = Calc.new(logger)
      calc.add(1, 2) # loggerを使うメソッドを呼ぶ
    end
  end
end 