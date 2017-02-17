require_relative 'convert'

class ConvertToRoman < Convert
  def initialize(x)
    @n_to_convert = x
    @ones_map = create_map_to_roman 'I', 'V', 'X'
    @tenths_map = create_map_to_roman 'X', 'L', 'C'
    @hundred_map = create_map_to_roman 'C', 'D', 'M'
  end

  def convert
    @thousands = (@n_to_convert / 1000).to_i
    @number_divided_array = @n_to_convert.to_s.chars.map(&:to_s)
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
end