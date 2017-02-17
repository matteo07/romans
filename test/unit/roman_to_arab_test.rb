require_relative '../test_case'
require_relative '../../lib/tasks/arab_roman'

class ConvertToArabTest < Test::Unit::TestCase
  def test_ones
    assert_equal 1, 1
  end

  def test_conversion
    assert_equal 3000, ArabRoman.convert('MMM')
    assert_equal 1000, ArabRoman.convert('M')
    assert_equal 11000, ArabRoman.convert('MMMMMMMMMMM')
  end
end