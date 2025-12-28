class Calc_advanced
  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    return nil if b == 0
    a / b.to_f
  end
end