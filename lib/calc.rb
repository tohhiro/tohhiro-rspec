class Calc
  def add(a, b)
    a + b
  end
  def price(amount, tax)
    amount * (1 + tax)
  end
  def add_name(a, b, name)
    "#{add(a, b)} by #{name}"
  end
end