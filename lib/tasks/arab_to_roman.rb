class ArabToRoman

  def initialize
    @ones_map = {'0' => '', '1' => 'I', '2' => 'II', '3' => 'III', '4' => 'IV', '5' => 'V', '6' => 'VI',
                 '7' => 'VII', '8' => 'VIII', '9' => 'IX'}
    @tenths_map = {'0' => '', '1' => 'X', '2' => 'XX', '3' => 'XXX', '4' => 'XL', '5' => 'L', '6' => 'LX',
                 '7' => 'LXX', '8' => 'LXXX', '9' => 'XC'}
    @hundred_map = {'0' => '', '1' => 'C', '2' => 'CC', '3' => 'CCC', '4' => 'CD', '5' => 'D', '6' => 'DC',
                   '7' => 'DCC', '8' => 'DCCC', '9' => 'CM'}
  end

  def convert(x)
    @thousands = (x / 1000).to_i
    @number_divided_array = x.to_s.chars.map(&:to_s)
    @res = ''
    @res << write_thousand
    @res << write_hundreds
    @res << write_tenths
    @res << write_ones
    @res
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
    res = ''
    @thousands.to_i.times do
      res << 'M'
    end
    res
  end

end