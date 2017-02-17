require_relative '../test_case'
require_relative '../../lib/tasks/arab_roman'

class ConvertToRomanTest < Test::Unit::TestCase
  def test_numbers
    assert_equal 'VIII', ArabRoman.convert(8)
    assert_equal 'IX', ArabRoman.convert(9)
    assert_equal 'XXVIII', ArabRoman.convert(28)
    assert_equal 'XXIX', ArabRoman.convert(29)
    assert_equal 'CXCIX', ArabRoman.convert(199)
    assert_equal 'DCXXI', ArabRoman.convert(621)
    assert_equal 'DCCXXIX', ArabRoman.convert(729)
    assert_equal 'MCMXCII', ArabRoman.convert(1992)
    assert_equal 'MMMMMMCLXXXI', ArabRoman.convert(6181)
    assert_equal 'MMMMMMCLXXXIX', ArabRoman.convert(6189)
    assert_equal 'MMMMMMMMMMCMXCII', ArabRoman.convert(10992)
  end
end