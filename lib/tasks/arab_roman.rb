require_relative 'convert_to_roman'
require_relative 'convert_to_arab'

class ArabRoman
  def self.convert(x)
    @converter = x.to_i == 0 ? ConvertToArab.new(x) : ConvertToRoman.new(x)
    @converter.convert
  end
end