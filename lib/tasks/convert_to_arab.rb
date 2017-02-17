require_relative 'convert'

class ConvertToArab < Convert
  def initialize(x)
    @n_to_convert = x
    @ones_map = create_map_to_arab 'I', 'V', 'X'
    @tenths_map = create_map_to_arab 'X', 'L', 'C'
    @hundred_map = create_map_to_arab 'C', 'D', 'M'
  end

  def convert
    split_roman_number
    @res = ''
    @res << write_thousand
    @res << write_hundreds
    @res << write_tenths
    @res << write_ones
    @res.to_i
  end

  def split_roman_number
    @number_divided_array = %w(MM C X I)
    @number_divided_array = []
    @number_divided_array << extract_thousand
  end

  def extract_thousand
    @n_to_convert[0..(@n_to_convert.rindex('M'))]
  end

  def write_ones
    @ones_map[@number_divided_array[3] || '']
  end

  def write_tenths
    @tenths_map[@number_divided_array[2] || '']
  end

  def write_hundreds
    @hundred_map[@number_divided_array[1] || '']
  end

  def write_thousand
    @number_divided_array[0].length.to_s || ''
  end
end