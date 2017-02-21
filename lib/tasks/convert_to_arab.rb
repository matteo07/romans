require_relative 'convert'

class ConvertToArab < Convert
  def initialize(x)
    @TO_CONVERT = x
    check_num
    @ones_map = create_map_to_arab 'I', 'V', 'X'
    @tenths_map = create_map_to_arab 'X', 'L', 'C'
    @hundred_map = create_map_to_arab 'C', 'D', 'M'
  end

  def check_num
    get_forbidden_letters.each do |x|
      if @TO_CONVERT.include? x
        not_valid_exception
      end
    end
  end

  def not_valid_exception
    raise 'Roman number given has a wrong format'
  end

  def get_forbidden_letters
    res = ('a'..'z').to_a + ('A'..'Z').to_a
    allowed = ['I','V','X','L','C','D','M']
    allowed.each do |x|
      res.delete x
    end
    res
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