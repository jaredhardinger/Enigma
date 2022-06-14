class Decrypter
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

  def key_split
    split_stringset = @key.chars.each_cons(2).to_a
    split_stringset.map { |set| set.join.to_i }
  end

  def offsets
    square = @date.to_i**2
    square_chars = square.to_s.chars
    square_chars.last(4).map(&:to_i)
  end

  def final_shift
    (0..3).map { |number| offsets[number] + key_split[number] }
  end

  def message_to_nums
    char_array = @message.chars.to_a
    char_array.map do |char|
      @char_map.include?(char) ? @char_map.index(char) : char
    end
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
