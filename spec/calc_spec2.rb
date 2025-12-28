require 'calc'

RSpec.describe Calc do
  # describeにクラス名を与えた場合、subjectは自動的にそのクラスのインスタンスになる
  subject(:calc) { Calc.new } # インスタンス変数は使わず、letやsubjectを使うことが多い

  it {
    expect(calc.add(2,3)).to eq(5)
  }
end