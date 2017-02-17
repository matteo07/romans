class MultipleOfRule
  def initialize(factor, text)
    @factor = factor
    @text = text
  end

  def apply(accumulator,number)
    accumulator << @text if number % @factor == 0
    accumulator
  end
end

class DefaultRule
  def apply(accumulator,number)
    accumulator.empty? ? number.to_s : accumulator
  end
end

class Fizzbuzz
  RULES = [MultipleOfRule.new(3, 'fizz'),
           MultipleOfRule.new(5, 'buzz'),
           MultipleOfRule.new(7, 'bang'),
           DefaultRule.new]

  def generate x
    RULES.inject('') do |accumulator, rule|
      rule.apply(accumulator, x)
    end
  end


end