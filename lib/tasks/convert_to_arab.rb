require_relative 'convert'
require_relative 'roman_number_syntax_check'

class ConvertToArab < Convert
  def initialize(x)
    @TO_CONVERT = x
    RomanNumberSyntaxCheck.new.check_num x
    @ones_map = create_map_to_arab 'I', 'V', 'X'
    @tenths_map = create_map_to_arab 'X', 'L', 'C'
    @hundred_map = create_map_to_arab 'C', 'D', 'M'
  end

  def convert
    split_roman_number
    replace_empty_with_zero
    @number_divided_array.reverse.join('').to_i
  end

  def split_roman_number
    @number_divided_array = []
    @number_divided_array << extract_last(@ones_map)
    @number_divided_array << extract_last(@tenths_map)
    @number_divided_array << extract_last(@hundred_map)
    @number_divided_array << extract_thousand
  end

  def extract_thousand
    @last_m_index = @TO_CONVERT.rindex('M')
    @last_m_index ? @TO_CONVERT[0..(@last_m_index)].size.to_s : 0
  end

  def extract_last(map)
    res = ''
    3.times do |j|
      i = 3 - j
      if is_in_map_last_chars_of_num(i, map)
        res = map[@TO_CONVERT[(@TO_CONVERT.size - i)..(@TO_CONVERT.size - 1)]]
        @TO_CONVERT = @TO_CONVERT[0..(@TO_CONVERT.size - i - 1)]
      end
    end
    res
  end

  def is_in_map_last_chars_of_num(i, map)
    map[@TO_CONVERT[(@TO_CONVERT.size - i)..(@TO_CONVERT.size - 1)]] != nil
  end

  def get_last_index(one, five)
    (@TO_CONVERT.rindex(one) || 0) > (@TO_CONVERT.rindex(five) || 0) ? @TO_CONVERT.rindex(one) : @TO_CONVERT.rindex(five)
  end

  def replace_empty_with_zero
    @number_divided_array.each do |st|
      if st == ''
        st.gsub!('', '0')
      end
    end
  end
end