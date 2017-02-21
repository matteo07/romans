class InvalidCharacterException < RuntimeError
  def initialize
    raise super 'Roman number given has a character that is not Roman'
  end
end