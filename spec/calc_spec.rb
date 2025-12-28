require 'calc' # rspecでは、require_relativeは使わないことが多い

RSpec.describe Calc do # describeでもcontextでも良いが、物であればdescribe、状況の場合はcontextを使うことが多い
  before do
    @calc = Calc.new
  end

  it "given 2 and 3, return 5" do # exampleの略。itの引数には期待値を記述することが多い。specifyでも良い
    expect(@calc.add(2,3)).to eq(5)
  end

  it do # itの引数を省略することもでき、自動的にタイトルが付与される
    expect(@calc.add(2,3)).to eq(5)
  end

  it { # do...endを省略して1行で書くこともできる
    expect(@calc.add(2,3)).to eq(5)
  }

  # it "pending example" # pendingはひとまず保留にしたいexampleに使う

  it "given 5 and 8, return 13" do
    expect(@calc.add(5, 8)).to eq(13)
  end

  # not_toマッチャー
  it "given 2 and 3, return not 6" do
    expect(@calc.add(2,3)).not_to eq(6) # not_toで否定形のマッチャーを使うことができる
  end

  it "given 2 and 3, return < 10" do
    expect(@calc.add(2,3)).to be < 10 # beマッチャーで大小比較ができる
  end

  it "given 2 and 3, return between 4 and 10" do
    expect(@calc.add(2,3)).to be_between(4, 10).inclusive # be_betweenマッチャーで範囲を検証できる
  end

  # 同じ3つのexample内で複数のexpectを使うこともできる
  it "given 2 and 3, return be_a Integer" do
    expect(@calc.add(2,3)).to be_a Integer # be_aマッチャーで型を検証できる
    expect(@calc.add(2,3).integer? ).to be true  # be trueマッチャーで真偽値を検証できる
    expect(@calc.add(2,3)).to be_integer  # be_integerマッチャーで型を検証できる
  end

  it "exists add method" do
    expect(@calc).to respond_to(:add) # respond_toマッチャーでメソッドの存在を検証できる
  end
end