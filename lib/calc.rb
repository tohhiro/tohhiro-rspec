class Calc
  def initialize(logger = nil)
    @logger = logger
  end
  def add(a, b)
    @logger&.log
    a + b
  end
  def price(amount, tax)
    @logger&.log
    amount * (1 + tax)
  end
  def add_name(a, b, name)
    @logger&.log
    "#{add(a, b)} by #{name}"
  end
end