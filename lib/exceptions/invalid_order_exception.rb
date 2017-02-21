class InvalidOrderException < RuntimeError
  def initialize
    raise super 'Roman number given has characters in the wrong order'
  end
end