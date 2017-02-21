require_relative '../test_case'
require_relative '../../lib/tasks/arab_roman'

class ConvertToArabTest < Test::Unit::TestCase
  def test_ones
    assert_equal 1, 1
  end

  def test_only_thousand_no_nines
    assert_equal 3000, ArabRoman.convert('MMM')
    assert_equal 1000, ArabRoman.convert('M')
    assert_equal 11000, ArabRoman.convert('MMMMMMMMMMM')
  end

  def test_thousand_and_hundred_no_nines
    assert_equal 3100, ArabRoman.convert('MMMC')
    assert_equal 2600, ArabRoman.convert('MMDC')
  end

  def test_thousand_hundred_and_tenths_no_nines
    assert_equal 3170, ArabRoman.convert('MMMCLXX')
    assert_equal 2620, ArabRoman.convert('MMDCXX')
  end

  def test_number_no_nines
    assert_equal 3175, ArabRoman.convert('MMMCLXXV')
    assert_equal 2623, ArabRoman.convert('MMDCXXIII')
  end

  def test_with_nines
    assert_equal 3999, ArabRoman.convert('MMMCMXCIX')
  end

  def test_error_if_have_non_roman_letters
    assert_raise_message('Roman number given has a wrong format') {ArabRoman.convert('b')}
  end
end