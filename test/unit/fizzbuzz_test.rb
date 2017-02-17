require_relative '../test_case'
require_relative '../../lib/tasks/fizzbuzz'

class FizzBuzzTest < Test::Unit::TestCase

  def setup
    @fizzbuzz = Fizzbuzz.new
  end

  def test_fizz_when_three_multiple
    assert_fizz_buzz_result 'fizz', 3
  end

  def test_buzz_when_five_multiple
    assert_fizz_buzz_result 'buzz',10
  end

  def test_fizzbuzz_when_five_and_three_multiple
    assert_fizz_buzz_result 'fizzbuzz',15
  end

  def test_fizz_when_not_multiple
    assert_fizz_buzz_result '4',4
  end

  def test_when_multiple_of_seven
    assert_fizz_buzz_result 'bang',7
    assert_fizz_buzz_result 'fizzbang',21
    assert_fizz_buzz_result 'buzzbang',35
    assert_fizz_buzz_result 'fizzbuzzbang',7*5*3
  end



  def assert_fizz_buzz_result expected, number
    assert_equal expected, @fizzbuzz.generate(number)
  end

end