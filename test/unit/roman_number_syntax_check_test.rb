require_relative '../test_case'
require_relative '../../lib/tasks/arab_roman'
require_relative '../../lib/tasks/roman_number_syntax_check'
require_relative '../../lib/exceptions/invalid_character_exception'
require_relative '../../lib/exceptions/invalid_order_exception'

class RomanNumberSyntaxCheckTest < Test::Unit::TestCase
  def test_error_if_have_non_roman_letters
    assert_raise(InvalidCharacterException) {ArabRoman.convert('a')}
    assert_raise(InvalidCharacterException) {ArabRoman.convert('Xc')}
    assert_raise(InvalidCharacterException) {ArabRoman.convert('MMz')}
  end

  def test_error_if_letter_in_wrong_order
    assert_raise(InvalidOrderException) {ArabRoman.convert('XM')}
  end
end