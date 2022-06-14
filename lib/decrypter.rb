require_relative 'calculable'
class Decrypter
  include Calculable
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @char_map = ('a'..'z').to_a << ' '
  end

  def decrypt
    characters = unshift.map do |value|
      if value.class == Integer
        @char_map.rotate(value).first
      else value
      end
    end.to_a
    decryption = characters * ''
    return_hash = {decryption: decryption, key: @key, date: @date}
  end

  def unshift
    shifted = []
    message_to_nums.each_slice(4) do |slice|
      slice.each_with_index do |value, index|
        shifted << value if value.class != Integer
        shifted << value.to_i - final_shift[index] if value.class == Integer
      end
    end
    shifted
  end
end
