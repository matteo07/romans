class ArabToRoman
  def initialize
    @ones_map = create_map 'I', 'V', 'X'
    @tenths_map = create_map 'X', 'L', 'C'
    @hundred_map = create_map 'C', 'D', 'M'
  end

  def convert(x)
    @thousands = (x / 1000).to_i
    @number_divided_array = x.to_s.chars.map(&:to_s)
    @res = ''
    @res << write_thousand
    @res << write_hundreds
    @res << write_tenths
    @res << write_ones
  end

  def write_ones
    @ones_map[@number_divided_array[-1] || 0]
  end

  def write_tenths
    @tenths_map[@number_divided_array[-2] || '0']
  end

  def write_hundreds
    @hundred_map[@number_divided_array[-3] || '0']
  end

  def write_thousand
    'M' * @thousands
  end

  def create_map one, five, ten
    {'0' => '', '1' => one, '2' => one + one, '3' => one + one + one, '4' => one + five, '5' => five, '6' => five + one,
     '7' => five + one + one, '8' => five + one + one + one, '9' => one + ten}
  end
end