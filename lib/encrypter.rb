require_relative 'calculable'
class Encrypter
  include Calculable
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @char_map = ('a'..'z').to_a << ' '
  end

  def encrypt
    characters = shift.map do |value|
      if value.class == Integer
        @char_map.rotate(value).first
      else value
      end
    end.to_a
    encryption = characters * ''
    return_hash = {encryption: encryption, key: @key, date: @date}
  end

  def shift
    shifted = []
    message_to_nums.each_slice(4) do |slice|
      slice.each_with_index do |value, index|
        shifted << value if value.class != Integer
        shifted << value.to_i + final_shift[index] if value.class == Integer
      end
    end
    shifted
  end
end
