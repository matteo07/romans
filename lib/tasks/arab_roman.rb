require_relative 'arab_to_roman'
require_relative 'roman_to_arab'

class ArabRoman
  def self.convert(x)
    @converter = x.to_i == 0 ? RomanToArab.new(x) : ArabToRoman.new(x)
    @converter.convert
  end
end