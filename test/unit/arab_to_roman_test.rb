require_relative '../test_case'
require_relative '../../lib/tasks/arab_to_roman'

class FizzBuzzTest < Test::Unit::TestCase
  def setup
    @romans = ArabToRoman.new
  end

  def test_ones
    @romans.convert 4
    assert_equal 'IV', @romans.write_ones

    @romans.convert 13
    assert_equal 'III', @romans.write_ones

    @romans.convert 133
    assert_equal 'III', @romans.write_ones

    @romans.convert 1333
    assert_equal 'III', @romans.write_ones
  end

  def test_tenths
    @romans.convert 4
    assert_equal '', @romans.write_tenths

    @romans.convert 13
    assert_equal 'X', @romans.write_tenths

    @romans.convert 133
    assert_equal 'XXX', @romans.write_tenths

    @romans.convert 1333
    assert_equal 'XXX', @romans.write_tenths
  end

  def test_hundreds
    @romans.convert 4
    assert_equal '', @romans.write_hundreds

    @romans.convert 13
    assert_equal '', @romans.write_hundreds

    @romans.convert 133
    assert_equal 'C', @romans.write_hundreds

    @romans.convert 1333
    assert_equal 'CCC', @romans.write_hundreds
  end

  def test_thousand
    @romans.convert 40
    assert_equal '', @romans.write_thousand

    @romans.convert 130
    assert_equal '', @romans.write_thousand

    @romans.convert 1330
    assert_equal 'M', @romans.write_thousand

    @romans.convert 17330
    assert_equal 'MMMMMMM', @romans.write_thousand
  end

  def test_simple_numbers
    assert_equal 'VIII', @romans.convert(8)
    assert_equal 'XXVIII', @romans.convert(28)
    assert_equal 'DCXXI', @romans.convert(621)
    assert_equal 'MMMMMMCLXXXI', @romans.convert(6181)

    assert_equal 'IX', @romans.convert(9)
    assert_equal 'XXIX', @romans.convert(29)
    assert_equal 'DCXXIX', @romans.convert(629)
    assert_equal 'MMMMMMCLXXXIX', @romans.convert(6189)
  end
end