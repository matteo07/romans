require_relative '../exceptions/invalid_order_exception'
require_relative '../exceptions/invalid_character_exception'

class RomanNumberSyntaxCheck
  def check_num(to_convert)
    check_characters(to_convert)
    check_order(to_convert)
  end

  def check_order(to_convert)
    to_convert.split("").each do |x|
      if is_there_bigger? x, to_convert
        InvalidOrderException.new
      end
    end
  end

  def is_there_bigger?(char, number)
    chars_in_order_array = ['I','V','X','L','C','D','M']

    index_of_char = chars_in_order_array.index(char)
    index_to_compare = (index_of_char + 3)

    while index_to_compare < chars_in_order_array.size
      if number[number.index(char)..(number.size)].include? chars_in_order_array[index_to_compare]
        return true
      end
      index_to_compare += 1
    end
    return false
  end

  def check_characters(to_convert)
    get_forbidden_letters.each do |x|
      if to_convert.include? x
        InvalidCharacterException.new
      end
    end
  end

  def get_forbidden_letters
    res = ('a'..'z').to_a + ('A'..'Z').to_a
    allowed = ['I','V','X','L','C','D','M']
    allowed.each do |x|
      res.delete x
    end
    res
  end
end