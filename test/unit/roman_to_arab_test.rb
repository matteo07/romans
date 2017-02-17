require_relative '../test_case'
require_relative '../../lib/tasks/roman_to_arab'

class FizzBuzzTest < Test::Unit::TestCase

  def setup
    @romans = RomanToArab.new
  end

  def test_ones
    assert_equal 1, 1
  end
end