require_relative 'number_convert'

class RomanToArab < NumberConvert
  def initialize(x)
    @n_to_convert = x
    @ones_map = create_map_to_arab 'I', 'V', 'X'
    @tenths_map = create_map_to_arab 'X', 'L', 'C'
    @hundred_map = create_map_to_arab 'C', 'D', 'M'
  end

  def convert
    'po po po bra bra bra'
  end
end