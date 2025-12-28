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

  it "pending example" # pendingはひとまず保留にしたいexampleに使う

  it "given 5 and 8, return 13" do
    expect(@calc.add(5, 8)).to eq(13)
  end
end